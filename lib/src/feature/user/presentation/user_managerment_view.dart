import 'package:a_and_i_report_web_server/src/core/models/user.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_event.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_state.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_event.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_state.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/home_theme.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/sections/home_footer_section.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/sections/home_top_bar_section.dart';
import 'package:a_and_i_report_web_server/src/feature/user/domain/models/change_password_result.dart';
import 'package:a_and_i_report_web_server/src/feature/user/domain/models/update_my_profile_result.dart';
import 'package:a_and_i_report_web_server/src/feature/user/presentation/widgets/user_management_field_label.dart';
import 'package:a_and_i_report_web_server/src/feature/user/presentation/widgets/user_management_section_title.dart';
import 'package:a_and_i_report_web_server/src/feature/user/presentation/widgets/user_profile_image_picker.dart';
import 'package:a_and_i_report_web_server/src/feature/user/providers/user_profile_providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 사용자 계정 정보 관리 화면이다.
class UserManagermentView extends ConsumerStatefulWidget {
  const UserManagermentView({super.key});

  @override
  ConsumerState<UserManagermentView> createState() =>
      UserManagermentViewState();
}

class UserManagermentViewState extends ConsumerState<UserManagermentView> {
  final TextEditingController nicknameController = TextEditingController();
  final GlobalKey<UserProfileImagePickerState> profileImagePickerKey =
      GlobalKey<UserProfileImagePickerState>();
  UserProfileImageSelection? selectedProfileImage;
  String? syncedNickname;
  bool isEditingProfile = false;
  bool isSubmitting = false;

  @override
  void dispose() {
    nicknameController.dispose();
    super.dispose();
  }

  void synchronizeNicknameFromState(String? nickname) {
    if (nickname == null || nickname.isEmpty) {
      return;
    }

    final shouldSync = nicknameController.text.isEmpty ||
        nicknameController.text == syncedNickname;
    if (!shouldSync) {
      return;
    }

    nicknameController.value = TextEditingValue(
      text: nickname,
      selection: TextSelection.collapsed(offset: nickname.length),
    );
    syncedNickname = nickname;
  }

  void resetEditingState({String? nickname}) {
    profileImagePickerKey.currentState?.clearSelection();
    selectedProfileImage = null;
    synchronizeNicknameFromState(nickname);
  }

  User? resolveMergedUser(
    User? updatedUser,
    UserViewState userState, {
    required String? requestNickname,
  }) {
    if (updatedUser != null) {
      return updatedUser;
    }

    final currentUser = userState.user;
    if (currentUser == null) {
      return null;
    }

    final resolvedNickname =
        requestNickname != null && requestNickname.isNotEmpty
            ? requestNickname
            : currentUser.nickname;

    return currentUser.copyWith(nickname: resolvedNickname);
  }

  Future<void> submitProfileUpdate(
    UserViewState userState,
  ) async {
    if (isSubmitting) {
      return;
    }

    final trimmedNickname = nicknameController.text.trim();
    final fallbackNickname = userState.nickname?.trim();
    final requestNickname =
        trimmedNickname.isNotEmpty ? trimmedNickname : fallbackNickname;
    setState(() {
      isSubmitting = true;
    });

    try {
      final result = await ref.read(updateMyProfileUsecaseProvider).call(
            nickname: requestNickname,
            profileImageBytes: selectedProfileImage?.bytes,
            profileImageFileName: selectedProfileImage?.fileName,
            profileImageMimeType: selectedProfileImage?.mimeType,
          );

      if (!mounted) {
        return;
      }

      if (result is UpdateMyProfileSuccess) {
        final mergedUser = resolveMergedUser(
          result.user,
          userState,
          requestNickname: requestNickname,
        );
        if (mergedUser != null) {
          await ref.read(userViewModelProvider.notifier).onEvent(
                UserViewEvent.myInfoFetched(user: mergedUser),
              );
        }
        if (!mounted) {
          return;
        }
        syncedNickname = mergedUser?.nickname ?? syncedNickname;
        setState(() {
          isEditingProfile = false;
        });
        resetEditingState(nickname: mergedUser?.nickname ?? userState.nickname);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('내 정보가 수정되었습니다.'),
          ),
        );
        return;
      }

      final failure = result as UpdateMyProfileFailure;
      final errorMessage = switch (failure.reason) {
        UpdateMyProfileFailureReason.invalidNickname => '닉네임을 입력해주세요.',
        UpdateMyProfileFailureReason.unauthorized =>
          '로그인 정보가 만료되었습니다. 다시 로그인해주세요.',
        UpdateMyProfileFailureReason.networkError =>
          '네트워크 오류가 발생했습니다. 잠시 후 다시 시도해주세요.',
        UpdateMyProfileFailureReason.unknown => '정보 수정에 실패했습니다. 입력값을 확인해주세요.',
      };

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } finally {
      if (mounted) {
        setState(() {
          isSubmitting = false;
        });
      }
    }
  }

  Future<void> submitPasswordUpdate() async {
    if (isSubmitting) {
      return;
    }

    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    final passwords = await showDialog<Map<String, String>>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('비밀번호 변경'),
        content: SizedBox(
          width: 420,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: currentPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: '현재 비밀번호',
                  hintText: '현재 비밀번호를 입력하세요',
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: '새 비밀번호',
                  hintText: '새 비밀번호를 입력하세요',
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: '새 비밀번호 확인',
                  hintText: '비밀번호를 다시 입력하세요',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('취소'),
          ),
          FilledButton(
            onPressed: () {
              final currentPassword = currentPasswordController.text.trim();
              final password = newPasswordController.text.trim();
              final confirmPassword = confirmPasswordController.text.trim();

              if (currentPassword.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('현재 비밀번호를 입력해주세요.')),
                );
                return;
              }

              if (password.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('새 비밀번호를 입력해주세요.')),
                );
                return;
              }

              if (password != confirmPassword) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('비밀번호 확인이 일치하지 않습니다.')),
                );
                return;
              }

              Navigator.of(dialogContext).pop({
                'currentPassword': currentPassword,
                'newPassword': password,
              });
            },
            child: const Text('변경'),
          ),
        ],
      ),
    );

    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();

    if (!mounted || passwords == null || passwords.isEmpty) {
      return;
    }

    setState(() {
      isSubmitting = true;
    });

    try {
      final result = await ref.read(changePasswordUsecaseProvider).call(
            currentPassword: passwords['currentPassword']!,
            newPassword: passwords['newPassword']!,
          );

      if (!mounted) {
        return;
      }

      if (result is ChangePasswordSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('비밀번호가 변경되었습니다.')),
        );
        return;
      }

      final failure = result as ChangePasswordFailure;
      final errorMessage = switch (failure.reason) {
        ChangePasswordFailureReason.invalidPassword => '비밀번호를 모두 입력해주세요.',
        ChangePasswordFailureReason.unauthorized =>
          '로그인 정보가 만료되었습니다. 다시 로그인해주세요.',
        ChangePasswordFailureReason.networkError =>
          '네트워크 오류가 발생했습니다. 잠시 후 다시 시도해주세요.',
        ChangePasswordFailureReason.unknown => '비밀번호 변경에 실패했습니다. 현재 비밀번호를 확인해주세요.',
      };

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } finally {
      if (mounted) {
        setState(() {
          isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = ref.watch(authViewModelProvider).status ==
        AuthenticationStatus.authenticated;
    final userState = ref.watch(userViewModelProvider);
    final topBarNickname = userState.nickname ?? '동아리원';
    final topBarProfileImageUrl = userState.profileImageUrl;

    synchronizeNicknameFromState(userState.nickname);

    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;
    final isTablet = width >= 768 && width < 1200;
    final horizontal = isMobile ? 20.0 : (isTablet ? 28.0 : 48.0);
    final contentWidth = isMobile ? 680.0 : 860.0;
    final topPadding = isMobile ? 44.0 : 64.0;
    final bottomPadding = isMobile ? 56.0 : 72.0;

    return Scaffold(
      backgroundColor: HomeTheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.white.withValues(alpha: 0.92),
            surfaceTintColor: Colors.transparent,
            titleSpacing: 0,
            title: HomeTopBarSection(
              nickname: topBarNickname,
              profileImageUrl: topBarProfileImageUrl,
              isLoggedIn: isLoggedIn,
              onGoIntro: () => context.go('/promotion'),
              onGoEducation: () => context.go('/report'),
              onGoPosts: () => context.go('/articles'),
              onGoMyAccount: () => context.go('/my-account'),
              onLogin: () => context.go('/sign-in'),
              onLogout: () async {
                await ref
                    .read(authViewModelProvider.notifier)
                    .onEvent(const SignOut());
                await ref
                    .read(userViewModelProvider.notifier)
                    .onEvent(const UserViewEvent.clear());
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: contentWidth),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    horizontal,
                    topPadding,
                    horizontal,
                    bottomPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '내 계정',
                                  style: TextStyle(
                                    fontSize: isMobile ? 34 : 40,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -1.0,
                                    color: HomeTheme.textMain,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '프로필 정보 및 활동 현황을 관리하세요.',
                                  style: TextStyle(
                                    fontSize: isMobile ? 14 : 16,
                                    height: 1.5,
                                    color: HomeTheme.textMuted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          TextButton(
                            onPressed: isSubmitting
                                ? null
                                : () {
                                    setState(() {
                                      isEditingProfile = !isEditingProfile;
                                    });
                                    if (isEditingProfile) {
                                      synchronizeNicknameFromState(
                                        userState.nickname,
                                      );
                                    } else {
                                      resetEditingState(
                                        nickname: userState.nickname,
                                      );
                                    }
                                  },
                            child: Text(
                              isEditingProfile ? '수정 취소' : '내 정보 수정',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const UserManagementSectionTitle(text: '프로필 정보'),
                      const SizedBox(height: 22),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UserProfileImagePicker(
                            key: profileImagePickerKey,
                            enabled: isEditingProfile,
                            profileImageUrl: userState.user?.profileImageUrl,
                            onImageChanged: isEditingProfile
                                ? (value) {
                                    setState(() {
                                      selectedProfileImage = value;
                                    });
                                  }
                                : null,
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const UserManagementFieldLabel(text: '닉네임'),
                                const SizedBox(height: 8),
                                if (isEditingProfile)
                                  TextFormField(
                                    controller: nicknameController,
                                    decoration: InputDecoration(
                                      hintText: '닉네임을 입력하세요',
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 12,
                                      ),
                                      filled: true,
                                      fillColor: const Color(0xFFF8FAFC),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black
                                              .withValues(alpha: 0.06),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black
                                              .withValues(alpha: 0.06),
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        borderSide: BorderSide(
                                          color: HomeTheme.primary,
                                          width: 1.4,
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontSize: isMobile ? 14 : 15,
                                      color: HomeTheme.textMain,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                else
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF8FAFC),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.black
                                            .withValues(alpha: 0.06),
                                      ),
                                    ),
                                    child: Text(
                                      userState.nickname?.trim().isNotEmpty ==
                                              true
                                          ? userState.nickname!
                                          : '닉네임 정보가 없습니다.',
                                      style: TextStyle(
                                        fontSize: isMobile ? 14 : 15,
                                        color: HomeTheme.textMain,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const UserManagementSectionTitle(text: '보안'),
                      const SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 14 : 18,
                          vertical: isMobile ? 14 : 16,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFC).withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black.withValues(alpha: 0.06),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.lock_open_rounded,
                              size: isMobile ? 20 : 22,
                              color: HomeTheme.textMuted,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '비밀번호',
                                    style: TextStyle(
                                      fontSize: isMobile ? 14 : 15,
                                      fontWeight: FontWeight.w600,
                                      color: HomeTheme.textMain,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '마지막 변경: 3개월 전',
                                    style: TextStyle(
                                      fontSize: isMobile ? 12 : 13,
                                      color: HomeTheme.textMuted,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            OutlinedButton(
                              onPressed:
                                  isSubmitting ? null : submitPasswordUpdate,
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 14 : 18,
                                  vertical: isMobile ? 10 : 12,
                                ),
                                side: BorderSide(
                                  color: Colors.black.withValues(alpha: 0.10),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                foregroundColor: HomeTheme.textMain,
                              ),
                              child: const Text(
                                '비밀번호 변경',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isEditingProfile) ...[
                        const SizedBox(height: 48),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.black.withValues(alpha: 0.06),
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.only(top: 24),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: FilledButton(
                              onPressed: isSubmitting
                                  ? null
                                  : () => submitProfileUpdate(userState),
                              style: FilledButton.styleFrom(
                                backgroundColor: HomeTheme.primary,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 20 : 28,
                                  vertical: isMobile ? 12 : 14,
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: isSubmitting
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    )
                                  : const Text('정보 수정 완료'),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: HomeFooterSection(),
          ),
        ],
      ),
    );
  }
}
