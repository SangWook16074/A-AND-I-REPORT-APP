import 'dart:async';

import 'package:a_and_i_report_web_server/src/feature/activate/ui/viewModels/activate_bloc.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/ui/viewModels/activate_event.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/ui/viewModels/activate_state.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/home_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ActivatePage extends ConsumerStatefulWidget {
  const ActivatePage({
    super.key,
    required this.token,
  });

  final String? token;

  @override
  ConsumerState<ActivatePage> createState() => _ActivatePageState();
}

class _ActivatePageState extends ConsumerState<ActivatePage> {
  Timer? _redirectTimer;

  @override
  void dispose() {
    _redirectTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(activateBlocProvider(widget.token));
    final bloc = ref.read(activateBlocProvider(widget.token).notifier);

    ref.listen<ActivateState>(activateBlocProvider(widget.token),
        (previous, next) {
      final changedToSuccess = previous?.isSuccess != true && next.isSuccess;
      if (!changedToSuccess) return;
      _redirectTimer?.cancel();
      _redirectTimer = Timer(const Duration(milliseconds: 1500), () {
        if (mounted) context.go('/sign-in');
      });
    });

    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;
    final isTablet = width >= 768 && width < 1200;
    final cardWidth = isMobile ? width - 40 : (isTablet ? 460.0 : 500.0);
    final inputsEnabled =
        !state.isTokenMissing && !state.isSubmitting && !state.isSuccess;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: Center(
        child: Container(
          width: cardWidth,
          padding: EdgeInsets.fromLTRB(
            isMobile ? 22 : 30,
            isMobile ? 24 : 30,
            isMobile ? 22 : 30,
            isMobile ? 20 : 24,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(isMobile ? 14 : 16),
            border: Border.all(color: Colors.black.withValues(alpha: 0.06)),
            boxShadow: [
              BoxShadow(
                blurRadius: 14,
                offset: const Offset(0, 8),
                color: Colors.black.withValues(alpha: 0.06),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '계정 활성화',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: HomeTheme.textMain,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '초대 링크를 통해 최초 비밀번호를 설정합니다.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: HomeTheme.textMuted,
                ),
              ),
              if (state.isTokenMissing) ...[
                const SizedBox(height: 10),
                const Text(
                  '유효하지 않은 초대 링크입니다.',
                  style: TextStyle(
                    color: Color(0xFFD93025),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
              const SizedBox(height: 18),
              TextField(
                enabled: inputsEnabled,
                textInputAction: TextInputAction.next,
                cursorColor: HomeTheme.primary,
                decoration: _inputDecoration(
                  label: '아이디',
                  hint: '사용할 아이디를 입력하세요',
                  icon: Icons.person_outline,
                ).copyWith(errorText: state.usernameError),
                onChanged: (value) {
                  bloc.onEvent(ActivateUsernameChanged(value));
                },
                onSubmitted: (_) {
                  FocusScope.of(context).nextFocus();
                },
              ),
              const SizedBox(height: 12),
              TextField(
                enabled: inputsEnabled,
                obscureText: true,
                textInputAction: TextInputAction.next,
                cursorColor: HomeTheme.primary,
                decoration: _inputDecoration(
                  label: '새 비밀번호',
                  hint: '12자 이상 입력하세요',
                  icon: Icons.lock_outline,
                ).copyWith(errorText: state.newPasswordError),
                onChanged: (value) {
                  bloc.onEvent(ActivateNewPasswordChanged(value));
                },
                onSubmitted: (_) {
                  FocusScope.of(context).nextFocus();
                },
              ),
              const SizedBox(height: 12),
              TextField(
                enabled: inputsEnabled,
                obscureText: true,
                textInputAction: TextInputAction.done,
                cursorColor: HomeTheme.primary,
                decoration: _inputDecoration(
                  label: '비밀번호 확인',
                  hint: '비밀번호를 다시 입력하세요',
                  icon: Icons.verified_user_outlined,
                ).copyWith(errorText: state.confirmPasswordError),
                onChanged: (value) {
                  bloc.onEvent(ActivateConfirmPasswordChanged(value));
                },
                onSubmitted: (_) => bloc.onEvent(const ActivateSubmitted()),
              ),
              const SizedBox(height: 14),
              if (state.isSuccess) ...[
                const Text(
                  '계정이 활성화되었습니다. 잠시 후 로그인 페이지로 이동합니다.',
                  style: TextStyle(
                    color: Color(0xFF188038),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 50,
                  child: FilledButton(
                    onPressed: () => context.go('/sign-in'),
                    style: _buttonStyle(),
                    child: const Text('로그인하러 가기'),
                  ),
                ),
              ] else ...[
                SizedBox(
                  height: 50,
                  child: FilledButton(
                    onPressed: state.canSubmit
                        ? () => bloc.onEvent(const ActivateSubmitted())
                        : null,
                    style: _buttonStyle(),
                    child: state.isSubmitting
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.4,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text('활성화하기'),
                  ),
                ),
              ],
              if (state.submitError != null) ...[
                const SizedBox(height: 10),
                Text(
                  state.submitError!,
                  style: const TextStyle(
                    color: Color(0xFFD93025),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon, color: HomeTheme.textMuted),
      filled: true,
      fillColor: Colors.black.withValues(alpha: 0.02),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 1.4,
          color: HomeTheme.primary.withValues(alpha: 0.65),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 1.0,
          color: Colors.black.withValues(alpha: 0.08),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 1.0,
          color: Colors.black.withValues(alpha: 0.08),
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return FilledButton.styleFrom(
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
    );
  }
}
