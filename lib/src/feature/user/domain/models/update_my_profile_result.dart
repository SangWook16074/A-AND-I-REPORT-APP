import 'package:a_and_i_report_web_server/src/core/models/user.dart';

/// 내 정보 수정 실패 원인이다.
enum UpdateMyProfileFailureReason {
  invalidNickname,
  unauthorized,
  networkError,
  unknown,
}

/// 내 정보 수정 결과 타입이다.
sealed class UpdateMyProfileResult {
  const UpdateMyProfileResult();
}

/// 내 정보 수정 성공 결과다.
class UpdateMyProfileSuccess extends UpdateMyProfileResult {
  const UpdateMyProfileSuccess({this.user});

  final User? user;
}

/// 내 정보 수정 실패 결과다.
class UpdateMyProfileFailure extends UpdateMyProfileResult {
  const UpdateMyProfileFailure(this.reason);

  final UpdateMyProfileFailureReason reason;
}
