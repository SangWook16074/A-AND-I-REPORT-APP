import 'package:freezed_annotation/freezed_annotation.dart';

part 'activate_event.freezed.dart';

@freezed
sealed class ActivateEvent with _$ActivateEvent {
  const factory ActivateEvent.pageOpened() = ActivatePageOpened;
  const factory ActivateEvent.newPasswordChanged(String value) =
      ActivateNewPasswordChanged;
  const factory ActivateEvent.confirmPasswordChanged(String value) =
      ActivateConfirmPasswordChanged;
  const factory ActivateEvent.submitted() = ActivateSubmitted;
}
