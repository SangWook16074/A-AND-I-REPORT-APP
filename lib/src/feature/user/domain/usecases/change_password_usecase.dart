import 'package:a_and_i_report_web_server/src/feature/user/domain/models/change_password_result.dart';
import 'package:a_and_i_report_web_server/src/feature/user/domain/repositories/user_profile_repository.dart';

/// 비밀번호 변경 유스케이스다.
class ChangePasswordUsecase {
  const ChangePasswordUsecase(this.userProfileRepository);

  final UserProfileRepository userProfileRepository;

  /// 내 비밀번호를 변경한다.
  Future<ChangePasswordResult> call({
    required String currentPassword,
    required String newPassword,
  }) async {
    final trimmedCurrentPassword = currentPassword.trim();
    final trimmedNewPassword = newPassword.trim();

    if (trimmedCurrentPassword.isEmpty || trimmedNewPassword.isEmpty) {
      return const ChangePasswordFailure(
        ChangePasswordFailureReason.invalidPassword,
      );
    }

    return userProfileRepository.changePassword(
      currentPassword: trimmedCurrentPassword,
      newPassword: trimmedNewPassword,
    );
  }
}
