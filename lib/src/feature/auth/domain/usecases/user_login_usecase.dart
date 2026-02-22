import 'dart:developer';

import 'package:a_and_i_report_web_server/src/feature/auth/data/dtos/login_request_dto.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/domain/models/user_login_result.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';

/// 사용자 로그인을 처리하는 UseCase 구현체입니다.
///
/// **비즈니스 로직:**
/// 1. [authRepository.login]을 호출하여 서버 인증을 수행합니다.
/// 2. 발급받은 액세스 토큰을 [authRepository.saveToken]으로 저장합니다.
/// 3. 저장한 토큰으로 `/v1/me`를 조회해 사용자 상세 정보를 확보합니다.
final class UserLoginUsecaseImpl implements UserLoginUsecase {
  final AuthRepository authRepository;

  const UserLoginUsecaseImpl({
    required this.authRepository,
  });

  /// 로그인을 수행합니다.
  ///
  /// 네트워크 오류 등 실패 시 예외를 던집니다.
  @override
  Future<UserLoginResult> call(LoginRequestDto dto) async {
    try {
      final response = await authRepository.login(dto);
      if (!response.success || response.data == null) {
        throw Exception(response.error?.message ?? "로그인에 실패했습니다.");
      }
      final newAccessToken = response.data!.accessToken;
      final newRefreshToken = response.data!.refreshToken;

      await authRepository.saveToken(newAccessToken);
      await authRepository.saveRefreshToken(newRefreshToken);
      final user = await authRepository.getMyInfo(newAccessToken);

      return UserLoginResult(
        response: response,
        user: user,
      );
    } on DioException catch (e) {
      log(e.toString());
      if (e.response?.statusCode == 401) {
        throw Exception("아이디 혹은 비밀번호가 올바르지 않습니다.");
      }
      throw Exception("서버와의 통신이 원할하지 않습니다.");
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}

/// 사용자 로그인을 처리하는 UseCase 인터페이스입니다.
abstract class UserLoginUsecase {
  Future<UserLoginResult> call(LoginRequestDto dto);
}
