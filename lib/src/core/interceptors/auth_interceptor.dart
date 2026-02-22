import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/domain/repositories/auth_repository.dart';

/// 401 에러 발생 시 자동으로 토큰을 갱신하는 Dio Interceptor
class AuthInterceptor extends QueuedInterceptor {
  final AuthRepository authRepository;
  final Dio dio;
  final Function() onTokenExpired;

  AuthInterceptor({
    required this.authRepository,
    required this.dio,
    required this.onTokenExpired,
  });

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Authorization 헤더가 있는 요청에서 401 에러 발생 시에만 토큰 갱신 시도
    final hasAuthHeader = err.requestOptions.headers['Authorization'] != null;

    if (err.response?.statusCode == 401 && hasAuthHeader) {
      try {
        log('401 에러 발생, 토큰 갱신 시도...');

        // 리프레시 토큰 조회
        final refreshToken = await authRepository.getRefreshToken();
        if (refreshToken == null || refreshToken.isEmpty) {
          log('리프레시 토큰이 없음, 로그아웃 처리');
          onTokenExpired();
          return handler.reject(err);
        }

        // 토큰 갱신 API 호출
        final response = await dio.post(
          '/v1/auth/refresh',
          data: {'refreshToken': refreshToken},
          options: Options(
            headers: {'Content-Type': 'application/json'},
          ),
        );

        // 응답 데이터 안전하게 파싱
        if (response.statusCode == 200 &&
            response.data is Map &&
            response.data['success'] == true &&
            response.data['data'] is Map) {
          final data = response.data['data'] as Map;
          final newAccessToken = data['accessToken'] as String?;
          final newRefreshToken = data['refreshToken'] as String?;

          if (newAccessToken == null || newRefreshToken == null) {
            log('토큰 갱신 응답에 토큰이 없음');
            onTokenExpired();
            return handler.reject(err);
          }

          // 새 토큰 저장
          await authRepository.saveToken(newAccessToken);
          await authRepository.saveRefreshToken(newRefreshToken);

          log('토큰 갱신 성공');

          // 원래 요청 재시도
          final requestOptions = err.requestOptions;
          requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

          final retryResponse = await dio.fetch(requestOptions);
          return handler.resolve(retryResponse);
        } else {
          log('토큰 갱신 실패, 로그아웃 처리');
          onTokenExpired();
          return handler.reject(err);
        }
      } on DioException catch (e) {
        log('토큰 갱신 중 에러 발생: ${e.response?.statusCode}');
        // 리프레시 토큰도 만료된 경우 (401)
        if (e.response?.statusCode == 401) {
          log('리프레시 토큰 만료, 로그아웃 처리');
          onTokenExpired();
        }
        return handler.reject(err);
      } catch (e) {
        log('토큰 갱신 중 예외 발생: $e');
        return handler.reject(err);
      }
    }

    return handler.next(err);
  }
}
