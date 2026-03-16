import 'package:a_and_i_report_web_server/src/core/constants/api_url.dart';
import 'package:a_and_i_report_web_server/src/core/providers/study_theme_provider.dart';
import 'package:a_and_i_report_web_server/src/core/widgets/responsive_layout.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_state.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/view/problem_detail_view.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/viewModel/report_detail_state.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/viewModel/report_detail_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReportDetailUI extends HookConsumerWidget {
  final String courseSlug;
  final String id;
  final DateTime? endAt;
  final int? week;
  final int? seq;

  const ReportDetailUI({
    super.key,
    required this.courseSlug,
    required this.id,
    this.endAt,
    this.week,
    this.seq,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reportDetailViewModelProvider(courseSlug, id));
    final isDarkMode = ref.watch(studyDarkModeProvider);
    final isLoggedIn = ref.watch(authViewModelProvider).status ==
        AuthenticationStatus.authenticated;
    final userState = ref.watch(userViewModelProvider);
    final profileImageUrl = userState.user?.profileImageUrl;
    final backgroundColor =
        isDarkMode ? const Color(0xFF0A0A0A) : const Color(0xFFF8F9FA);
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1080),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 18 : 24),
                child: Column(
                  children: [
                    _TopBar(
                      isDarkMode: isDarkMode,
                      isLoggedIn: isLoggedIn,
                      profileImageUrl: profileImageUrl,
                      onTapBack: () {
                        if (context.canPop()) {
                          context.pop();
                          return;
                        }
                        context.go('/report?courseSlug=$courseSlug');
                      },
                      onTapLogo: () => context.go('/'),
                      onTapContrast: () {
                        ref.read(studyDarkModeProvider.notifier).state =
                            !isDarkMode;
                      },
                      onTapAvatar: () =>
                          context.go(isLoggedIn ? '/my-account' : '/sign-in'),
                    ),
                    switch (state.status) {
                      ViewStatus.success => ResponsiveLayout(
                          mobile: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 24,
                              horizontal: 16,
                            ),
                            child: ProblemDetailView(
                              report: state.report!,
                              endAt: endAt,
                              isDarkMode: isDarkMode,
                            ),
                          ),
                          tablet: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 48,
                              horizontal: 48,
                            ),
                            child: ProblemDetailView(
                              report: state.report!,
                              endAt: endAt,
                              isDarkMode: isDarkMode,
                            ),
                          ),
                          desktop: Padding(
                            padding: const EdgeInsets.only(
                              top: 48,
                              bottom: 15,
                            ),
                            child: ProblemDetailView(
                              report: state.report!,
                              endAt: endAt,
                              isDarkMode: isDarkMode,
                            ),
                          ),
                        ),
                      ViewStatus.error => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 48),
                          child: Center(
                            child: Text(
                              state.errorMsg,
                              style: TextStyle(
                                color: isDarkMode
                                    ? Colors.white70
                                    : const Color(0xFF111111),
                              ),
                            ),
                          ),
                        ),
                      ViewStatus.loading => const Padding(
                          padding: EdgeInsets.symmetric(vertical: 48),
                          child: Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        ),
                    },
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.isDarkMode,
    required this.isLoggedIn,
    required this.profileImageUrl,
    required this.onTapBack,
    required this.onTapLogo,
    required this.onTapContrast,
    required this.onTapAvatar,
  });

  final bool isDarkMode;
  final bool isLoggedIn;
  final String? profileImageUrl;
  final VoidCallback onTapBack;
  final VoidCallback onTapLogo;
  final VoidCallback onTapContrast;
  final VoidCallback onTapAvatar;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final resolvedImageUrl = _resolveProfileImageUrl(profileImageUrl);
    final textPrimary =
        isDarkMode ? const Color(0xFFF5F5F5) : const Color(0xFF111111);
    final textMuted =
        isDarkMode ? const Color(0xFFA1A1AA) : const Color(0xFF71717A);
    final borderColor =
        isDarkMode ? const Color(0xFF27272A) : const Color(0xFFE4E4E7);
    final logoBackground =
        isDarkMode ? const Color(0xFFF5F5F5) : const Color(0xFF111111);
    final logoForeground =
        isDarkMode ? const Color(0xFF111111) : const Color(0xFFFFFFFF);
    final iconBackground =
        isDarkMode ? const Color(0xFF18181B) : const Color(0xFFFFFFFF);

    return Padding(
      padding: EdgeInsets.only(top: isMobile ? 16 : 22),
      child: Row(
        children: [
          _TopNavAction(
            icon: Icons.arrow_back_rounded,
            color: textMuted,
            onTap: onTapBack,
          ),
          const SizedBox(width: 10),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTapLogo,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: logoBackground,
              ),
              child: Center(
                child: Text(
                  'A&I',
                  style: TextStyle(
                    color: logoForeground,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.6,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            borderRadius: BorderRadius.circular(999),
            onTap: onTapContrast,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBackground,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: borderColor),
              ),
              child: Icon(
                Icons.contrast_rounded,
                size: 20,
                color: textMuted,
              ),
            ),
          ),
          const SizedBox(width: 12),
          InkWell(
            borderRadius: BorderRadius.circular(999),
            onTap: onTapAvatar,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBackground,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: borderColor),
              ),
              child: ClipOval(
                child: resolvedImageUrl == null
                    ? Icon(
                        Icons.person,
                        size: 20,
                        color: isLoggedIn
                            ? textPrimary
                            : textMuted.withValues(alpha: 0.85),
                      )
                    : CachedNetworkImage(
                        imageUrl: resolvedImageUrl,
                        fit: BoxFit.cover,
                        errorWidget: (_, __, ___) => Icon(
                          Icons.person,
                          size: 20,
                          color: textPrimary,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopNavAction extends StatelessWidget {
  const _TopNavAction({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: color,
          ),
        ],
      ),
    );
  }
}

String? _resolveProfileImageUrl(String? imagePath) {
  final trimmedImagePath = imagePath?.trim();
  if (trimmedImagePath == null || trimmedImagePath.isEmpty) {
    return null;
  }

  if (trimmedImagePath.startsWith('http://') ||
      trimmedImagePath.startsWith('https://') ||
      trimmedImagePath.startsWith('data:')) {
    return trimmedImagePath;
  }

  if (baseUrl.trim().isEmpty) {
    return trimmedImagePath;
  }

  return Uri.parse(baseUrl).resolve(trimmedImagePath).toString();
}
