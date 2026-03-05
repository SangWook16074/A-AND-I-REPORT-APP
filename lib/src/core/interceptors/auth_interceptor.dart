import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/data/datasources/local/local_auth_datasource.dart';

/// 401 에러 발생 시 자동으로 토큰을 갱신하는 Dio Interceptor
class AuthInterceptor extends QueuedInterceptor {
  static const _retryKey = '__auth_retry__';
  static const _refreshPath = '/v1/auth/refresh';

  final LocalAuthDatasource localAuthDatasource;
  final Dio dio;
  final Future<void> Function(String? refreshToken) onTokenExpired;

  AuthInterceptor({
    required this.localAuthDatasource,
    required this.dio,
    required this.onTokenExpired,
  });

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final requestOptions = err.requestOptions;
    final isUnauthorized = err.response?.statusCode == 401;
    final isRefreshApi = _isRefreshApi(requestOptions);
    final alreadyRetried = requestOptions.extra[_retryKey] == true;

    // 401 에러 발생 시 토큰 갱신을 시도한다.
    // 헤더가 누락되었더라도 로컬 토큰이 있으면 재발급을 시도해
    // 브라우저/프록시 환경에서의 헤더 유실 케이스를 흡수한다.
    if (isUnauthorized && !isRefreshApi && !alreadyRetried) {
      String? refreshToken;
      try {
        final authorizationHeader = _readAuthorizationHeader(requestOptions);
        final accessToken = await localAuthDatasource.getUserToken();
        final hasAuthContext =
            _hasToken(authorizationHeader) || _hasToken(accessToken);

        if (!hasAuthContext) {
          return handler.next(err);
        }

        log('401 에러 발생, 토큰 갱신 시도...');

        // 리프레시 토큰 조회
        refreshToken = await localAuthDatasource.getRefreshToken();
        if (refreshToken == null || refreshToken.isEmpty) {
          log('리프레시 토큰이 없음, 로그아웃 처리');
          await onTokenExpired(null);
          return handler.reject(err);
        }

        // 토큰 갱신 API 호출
        final response = await _requestTokenRefresh(refreshToken);

        // 응답 데이터 안전하게 파싱
        final statusCode = response.statusCode ?? 0;
        if (statusCode < 200 || statusCode >= 300) {
          log('토큰 갱신 실패, 로그아웃 처리');
          await onTokenExpired(refreshToken);
          return handler.reject(err);
        }

        final newAccessToken = _extractAccessToken(response.data);
        final newRefreshToken = _extractRefreshToken(response.data);

        if (!_hasToken(newAccessToken)) {
          log('토큰 갱신 응답에 accessToken이 없음');
          await onTokenExpired(refreshToken);
          return handler.reject(err);
        }

        // 새 토큰 저장 (refreshToken은 내려준 경우에만 갱신)
        await localAuthDatasource.saveUserToken(newAccessToken!);
        if (_hasToken(newRefreshToken)) {
          await localAuthDatasource.saveRefreshToken(newRefreshToken!);
        }

        log('토큰 갱신 성공');

        // 원래 요청 재시도 (무한 재시도 방지 플래그 포함)
        final retryOptions = _buildRetryOptions(requestOptions)
          ..extra[_retryKey] = true;
        _setAuthorizationHeader(retryOptions, 'Bearer $newAccessToken');

        final retryResponse = await dio.fetch<dynamic>(retryOptions);
        return handler.resolve(retryResponse);
      } on DioException catch (e) {
        log('토큰 갱신 중 에러 발생: ${e.response?.statusCode}');
        // 리프레시 토큰도 만료된 경우 (401)
        if (e.response?.statusCode == 401) {
          log('리프레시 토큰 만료, 로그아웃 처리');
          await onTokenExpired(refreshToken);
        }
        return handler.reject(err);
      } catch (e) {
        log('토큰 갱신 중 예외 발생: $e');
        return handler.reject(err);
      }
    }

    return handler.next(err);
  }

  Future<Response<dynamic>> _requestTokenRefresh(String refreshToken) {
    final refreshDio = Dio(dio.options.copyWith());

    return refreshDio.post<dynamic>(
      _refreshPath,
      data: {'refreshToken': refreshToken},
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  bool _isRefreshApi(RequestOptions options) {
    final parsed = Uri.tryParse(options.path);
    final normalizedPath = parsed?.path ?? options.path;
    return normalizedPath.endsWith(_refreshPath);
  }

  bool _hasToken(String? token) {
    if (token == null) {
      return false;
    }
    return token.trim().isNotEmpty;
  }

  String? _extractAccessToken(dynamic body) {
    final root = _toMap(body);
    if (root == null) {
      return null;
    }
    final data = _toMap(root['data']);
    final token = data?['accessToken'] ?? root['accessToken'];
    return token?.toString();
  }

  String? _extractRefreshToken(dynamic body) {
    final root = _toMap(body);
    if (root == null) {
      return null;
    }
    final data = _toMap(root['data']);
    final token = data?['refreshToken'] ?? root['refreshToken'];
    return token?.toString();
  }

  Map<String, dynamic>? _toMap(dynamic source) {
    if (source is Map<String, dynamic>) {
      return source;
    }
    if (source is Map) {
      return Map<String, dynamic>.from(source);
    }
    return null;
  }

  String? _readAuthorizationHeader(RequestOptions options) {
    for (final entry in options.headers.entries) {
      if (entry.key.toLowerCase() != 'authorization') {
        continue;
      }
      final value = entry.value?.toString().trim();
      if (value == null || value.isEmpty) {
        return null;
      }
      return value;
    }
    return null;
  }

  void _setAuthorizationHeader(RequestOptions options, String value) {
    final authorizationHeaderKey = options.headers.keys.firstWhere(
      (key) => key.toLowerCase() == 'authorization',
      orElse: () => 'Authorization',
    );
    options.headers[authorizationHeaderKey] = value;
  }

  RequestOptions _buildRetryOptions(RequestOptions source) {
    final data = source.data;
    final clonedData = data is FormData ? data.clone() : data;
    return source.copyWith(data: clonedData);
  }
}
