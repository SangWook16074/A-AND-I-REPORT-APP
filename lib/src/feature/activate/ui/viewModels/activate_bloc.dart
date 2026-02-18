import 'dart:async';

import 'package:a_and_i_report_web_server/src/core/providers/analytics_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/domain/models/activate_result.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/providers/activate_providers.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/ui/viewModels/activate_event.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/ui/viewModels/activate_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activate_bloc.g.dart';

@riverpod
class ActivateBloc extends _$ActivateBloc {
  @override
  ActivateState build(String? token) {
    scheduleMicrotask(() => onEvent(const ActivateEvent.pageOpened()));
    return ActivateState.initial(token);
  }

  Future<void> onEvent(ActivateEvent event) async {
    final analytics = ref.read(firebaseAnalyticsProvider);
    switch (event) {
      case ActivatePageOpened():
        await analytics.logEvent(name: 'activate_page_view');
        if (state.isTokenMissing) {
          await analytics.logEvent(
            name: 'activate_failure',
            parameters: {'reason': 'token_missing'},
          );
        }
      case ActivateNewPasswordChanged():
        _onNewPasswordChanged(event.value);
      case ActivateConfirmPasswordChanged():
        _onConfirmPasswordChanged(event.value);
      case ActivateSubmitted():
        await _onSubmit();
    }
  }

  void _onNewPasswordChanged(String value) {
    final newPasswordError = _validateNewPassword(value);
    final confirmPasswordError = _validateConfirmPassword(
      state.confirmPassword,
      value,
    );
    state = state.copyWith(
      newPassword: value,
      newPasswordError: newPasswordError,
      confirmPasswordError: confirmPasswordError,
      submitError: null,
    );
  }

  void _onConfirmPasswordChanged(String value) {
    final confirmPasswordError =
        _validateConfirmPassword(value, state.newPassword);
    state = state.copyWith(
      confirmPassword: value,
      confirmPasswordError: confirmPasswordError,
      submitError: null,
    );
  }

  Future<void> _onSubmit() async {
    if (state.isSubmitting || state.isSuccess) {
      return;
    }

    if (state.isTokenMissing) {
      state = state.copyWith(
        submitError: '유효하지 않은 초대 링크입니다.',
      );
      await ref.read(firebaseAnalyticsProvider).logEvent(
        name: 'activate_failure',
        parameters: {'reason': 'token_missing'},
      );
      return;
    }

    final newPasswordError = _validateNewPassword(state.newPassword);
    final confirmPasswordError = _validateConfirmPassword(
      state.confirmPassword,
      state.newPassword,
    );
    state = state.copyWith(
      newPasswordError: newPasswordError,
      confirmPasswordError: confirmPasswordError,
      submitError: null,
    );
    if (newPasswordError != null || confirmPasswordError != null) {
      return;
    }

    await ref.read(firebaseAnalyticsProvider).logEvent(name: 'activate_submit');
    state = state.copyWith(
      submitStatus: ActivateSubmitStatus.submitting,
      submitError: null,
    );

    final result = await ref.read(activateAccountUsecaseProvider).call(
          token: state.token,
          password: state.newPassword,
        );
    if (result is ActivateSuccess) {
      state = state.copyWith(
        submitStatus: ActivateSubmitStatus.success,
        submitError: null,
      );
      await ref
          .read(firebaseAnalyticsProvider)
          .logEvent(name: 'activate_success');
      return;
    }

    final reason = (result as ActivateFailure).reason;
    final isNetworkError = reason == ActivateFailureReason.networkError;
    state = state.copyWith(
      submitStatus: ActivateSubmitStatus.idle,
      submitError: isNetworkError
          ? '네트워크 오류가 발생했습니다. 잠시 후 다시 시도해 주세요.'
          : '링크가 만료되었거나 이미 사용되었습니다. 관리자에게 재발급을 요청하세요.',
    );

    await ref.read(firebaseAnalyticsProvider).logEvent(
      name: 'activate_failure',
      parameters: {
        'reason': isNetworkError ? 'network_error' : 'token_invalid_or_expired',
      },
    );
  }

  String? _validateNewPassword(String value) {
    if (value.isEmpty) {
      return '비밀번호를 입력하세요.';
    }
    if (value.length < 12 || value.length > 128) {
      return '비밀번호는 12~128자여야 합니다.';
    }
    return null;
  }

  String? _validateConfirmPassword(String confirm, String newPassword) {
    if (confirm.isEmpty) {
      return '비밀번호 확인을 입력하세요.';
    }
    if (confirm != newPassword) {
      return '비밀번호가 일치하지 않습니다.';
    }
    return null;
  }
}
