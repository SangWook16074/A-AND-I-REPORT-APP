/// 비밀번호 변경 실패 원인이다.
enum ChangePasswordFailureReason {
  invalidPassword,
  unauthorized,
  networkError,
  unknown,
}

/// 비밀번호 변경 결과 타입이다.
sealed class ChangePasswordResult {
  const ChangePasswordResult();
}

/// 비밀번호 변경 성공 결과다.
class ChangePasswordSuccess extends ChangePasswordResult {
  const ChangePasswordSuccess();
}

/// 비밀번호 변경 실패 결과다.
class ChangePasswordFailure extends ChangePasswordResult {
  const ChangePasswordFailure(this.reason);

  final ChangePasswordFailureReason reason;
}
