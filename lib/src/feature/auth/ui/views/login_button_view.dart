import 'dart:developer';

import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_event.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/login_ui_event.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/login_ui_state.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/login_ui_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/home_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginButtonView extends ConsumerWidget {
  const LoginButtonView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginUiState = ref.watch(loginUiViewModelProvider);
    final loginUiViewModel = ref.read(loginUiViewModelProvider.notifier);
    final authViewModel = ref.read(authViewModelProvider.notifier);
    final canSubmit = loginUiState is Idle &&
        loginUiState.userId.trim().isNotEmpty &&
        loginUiState.password.isNotEmpty;

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FilledButton(
        onPressed: canSubmit
            ? () async {
                try {
                  final Idle(:userId, :password) = loginUiState;
                  final account = userId;
                  loginUiViewModel.onEvent(Login());
                  await authViewModel
                      .onEvent(SignIn(account: account, password: password));
                } catch (e) {
                  log(e.toString());
                  loginUiViewModel.onEvent(LoginFail(errorMsg: e.toString()));
                }
              }
            : null,
        style: FilledButton.styleFrom(
          backgroundColor: HomeTheme.primary,
          disabledBackgroundColor: HomeTheme.primary.withValues(alpha: 0.35),
          foregroundColor: Colors.white,
          disabledForegroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text("로그인"),
      ),
    );
  }
}
