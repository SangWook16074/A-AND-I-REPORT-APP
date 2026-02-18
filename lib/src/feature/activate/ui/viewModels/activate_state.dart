import 'package:freezed_annotation/freezed_annotation.dart';

part 'activate_state.freezed.dart';

enum ActivateSubmitStatus { idle, submitting, success }

@freezed
abstract class ActivateState with _$ActivateState {
  const ActivateState._();

  const factory ActivateState({
    required String? token,
    required String newPassword,
    required String confirmPassword,
    required ActivateSubmitStatus submitStatus,
    required String? newPasswordError,
    required String? confirmPasswordError,
    required String? submitError,
  }) = _ActivateState;

  factory ActivateState.initial(String? token) {
    return ActivateState(
      token: token,
      newPassword: '',
      confirmPassword: '',
      submitStatus: ActivateSubmitStatus.idle,
      newPasswordError: null,
      confirmPasswordError: null,
      submitError: null,
    );
  }

  bool get isTokenMissing => token == null || token!.isEmpty;
  bool get isSubmitting => submitStatus == ActivateSubmitStatus.submitting;
  bool get isSuccess => submitStatus == ActivateSubmitStatus.success;

  bool get canSubmit {
    return !isTokenMissing &&
        !isSubmitting &&
        !isSuccess &&
        newPassword.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        newPasswordError == null &&
        confirmPasswordError == null;
  }
}
