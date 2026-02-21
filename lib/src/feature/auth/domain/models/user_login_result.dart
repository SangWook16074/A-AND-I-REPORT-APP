import 'package:a_and_i_report_web_server/src/core/models/user.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/data/dtos/login_response_dto.dart';

/// 로그인 처리 결과 모델이다.
class UserLoginResult {
  const UserLoginResult({
    required this.response,
    required this.user,
  });

  final LoginResponseDto response;
  final User user;
}
