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
    // 401 에러이고, refresh 엔드포인트가 아닌 경우에만 토큰 갱신 시도
    if (err.response?.statusCode == 401 &&
        !err.requestOptions.path.contains('/v1/auth/refresh') &&
        !err.requestOptions.path.contains('/v1/auth/login')) {
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

        if (response.statusCode == 200 && response.data['success'] == true) {
          final newAccessToken = response.data['data']['accessToken'];
          final newRefreshToken = response.data['data']['refreshToken'];

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
