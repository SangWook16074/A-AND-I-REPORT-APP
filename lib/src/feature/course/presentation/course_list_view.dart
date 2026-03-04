import 'package:a_and_i_report_web_server/src/core/constants/api_url.dart';
import 'package:a_and_i_report_web_server/src/core/providers/study_theme_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_state.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 사용자 코스 목록 화면입니다.
///
/// `course_list_view2.html` 시안을 기반으로,
/// 수강 가능 코스를 카드 형태로 보여줍니다.
class CourseListView extends ConsumerStatefulWidget {
  const CourseListView({super.key});

  @override
  ConsumerState<CourseListView> createState() => _CourseListViewState();
}

class _CourseListViewState extends ConsumerState<CourseListView> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(studyDarkModeProvider);
    final palette = _CoursePalette.fromMode(isDarkMode);
    final isLoggedIn = ref.watch(authViewModelProvider).status ==
        AuthenticationStatus.authenticated;
    final userState = ref.watch(userViewModelProvider);
    final profileImageUrl = userState.profileImageUrl;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;

    return Scaffold(
      backgroundColor: palette.pageBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1080),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 18 : 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TopNavigationBar(
                      palette: palette,
                      profileImageUrl: profileImageUrl,
                      isLoggedIn: isLoggedIn,
                      onTapLogo: () => context.go('/'),
                      onTapContrast: () {
                        ref.read(studyDarkModeProvider.notifier).state =
                            !isDarkMode;
                      },
                      onTapAvatar: () =>
                          context.go(isLoggedIn ? '/my-account' : '/sign-in'),
                      onTapBack: () {
                        if (context.canPop()) {
                          context.pop();
                          return;
                        }
                        context.go('/');
                      },
                    ),
                    SizedBox(height: isMobile ? 34 : 44),
                    Text(
                      '내 학습 코스',
                      style: TextStyle(
                        color: palette.textPrimary,
                        fontSize: isMobile ? 36 : 44,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.9,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '현재 수강 가능한 강의 목록입니다.',
                      style: TextStyle(
                        color: palette.textMuted,
                        fontSize: isMobile ? 16 : 18,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: isMobile ? 24 : 32),
                    _CourseCard(
                      palette: palette,
                      data: _activeCourse,
                      onTapAction: () => context.go('/report'),
                    ),
                    const SizedBox(height: 22),
                    _CourseCard(
                      palette: palette,
                      data: _lockedCourse,
                      onTapAction: null,
                    ),
                    SizedBox(height: isMobile ? 72 : 108),
                    _FooterSection(palette: palette),
                    const SizedBox(height: 20),
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

class _TopNavigationBar extends StatelessWidget {
  const _TopNavigationBar({
    required this.palette,
    required this.profileImageUrl,
    required this.isLoggedIn,
    required this.onTapLogo,
    required this.onTapContrast,
    required this.onTapAvatar,
    required this.onTapBack,
  });

  final _CoursePalette palette;
  final String? profileImageUrl;
  final bool isLoggedIn;
  final VoidCallback onTapLogo;
  final VoidCallback onTapContrast;
  final VoidCallback onTapAvatar;
  final VoidCallback onTapBack;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final resolvedImageUrl = _resolveProfileImageUrl(profileImageUrl);

    return Padding(
      padding: EdgeInsets.only(top: isMobile ? 16 : 22),
      child: Row(
        children: [
          _TopNavAction(
            palette: palette,
            icon: Icons.arrow_back_rounded,
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
                color: palette.logoBackground,
              ),
              child: Center(
                child: Text(
                  'A&I',
                  style: TextStyle(
                    color: palette.logoForeground,
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
                borderRadius: BorderRadius.circular(999),
                color: palette.iconBackground,
                border: Border.all(color: palette.border),
              ),
              child: Icon(
                Icons.contrast_rounded,
                size: 20,
                color: palette.textMuted,
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
                borderRadius: BorderRadius.circular(999),
                color: palette.iconBackground,
                border: Border.all(color: palette.border),
              ),
              child: ClipOval(
                child: resolvedImageUrl == null
                    ? Icon(
                        Icons.person,
                        color: isLoggedIn
                            ? palette.textPrimary
                            : palette.textMuted.withValues(alpha: 0.9),
                      )
                    : CachedNetworkImage(
                        imageUrl: resolvedImageUrl,
                        fit: BoxFit.cover,
                        errorWidget: (_, __, ___) => Icon(
                          Icons.person,
                          color: palette.textPrimary,
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
    required this.palette,
    required this.icon,
    required this.onTap,
  });

  final _CoursePalette palette;

  final IconData icon;
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
            color: palette.textMuted,
          ),
        ],
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  const _CourseCard({
    required this.palette,
    required this.data,
    required this.onTapAction,
  });

  final _CoursePalette palette;
  final _CourseCardData data;
  final VoidCallback? onTapAction;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;

    return Container(
      decoration: BoxDecoration(
        color: palette.cardBackground,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: palette.border),
        boxShadow: [
          BoxShadow(
            color: palette.cardShadow,
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: isMobile
          ? Column(
              children: [
                _CourseVisual(
                  palette: palette,
                  icon: data.visualIcon,
                ),
                _CourseCardContent(
                  palette: palette,
                  data: data,
                  onTapAction: onTapAction,
                ),
              ],
            )
          : Row(
              children: [
                SizedBox(
                  width: 300,
                  child: _CourseVisual(
                    palette: palette,
                    icon: data.visualIcon,
                  ),
                ),
                Expanded(
                  child: _CourseCardContent(
                    palette: palette,
                    data: data,
                    onTapAction: onTapAction,
                  ),
                ),
              ],
            ),
    );
  }
}

class _CourseVisual extends StatelessWidget {
  const _CourseVisual({
    required this.palette,
    required this.icon,
  });

  final _CoursePalette palette;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.35,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          gradient: LinearGradient(
            colors: [palette.visualStart, palette.visualEnd],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 84,
            color: palette.visualIcon,
          ),
        ),
      ),
    );
  }
}

class _CourseCardContent extends StatelessWidget {
  const _CourseCardContent({
    required this.palette,
    required this.data,
    required this.onTapAction,
  });

  final _CoursePalette palette;
  final _CourseCardData data;
  final VoidCallback? onTapAction;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Padding(
      padding: EdgeInsets.all(isMobile ? 20 : 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: data.badgeBackground,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: data.badgeBorder),
                ),
                child: Text(
                  data.badgeLabel,
                  style: TextStyle(
                    color: data.badgeText,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.7,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            data.title,
            style: TextStyle(
              color: palette.textPrimary,
              fontSize: 30 > (isMobile ? 26 : 30) ? 30 : (isMobile ? 26 : 30),
              fontWeight: FontWeight.w800,
              letterSpacing: -0.6,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data.description,
            style: TextStyle(
              color: palette.textMuted,
              fontSize: 15,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          data.isActive
              ? _buildActiveBottom(context)
              : _buildLockedBottom(context),
        ],
      ),
    );
  }

  Widget _buildActiveBottom(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: FilledButton(
        onPressed: onTapAction,
        style: FilledButton.styleFrom(
          backgroundColor: palette.actionButtonBackground,
          foregroundColor: palette.actionButtonForeground,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        child: const Text('학습하기'),
      ),
    );
  }

  Widget _buildLockedBottom(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(Icons.lock_outline, color: palette.textMuted, size: 16),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  '이전 과정 수료 후 활성화',
                  style: TextStyle(
                    color: palette.textMuted,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: palette.lockedButtonBackground,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            '준비 중',
            style: TextStyle(
              color: palette.lockedButtonForeground,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

class _FooterSection extends StatelessWidget {
  const _FooterSection({required this.palette});

  final _CoursePalette palette;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: palette.border, height: 1),
        const SizedBox(height: 26),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: palette.footerLogoBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'A&I',
              style: TextStyle(
                color: palette.footerLogoForeground,
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.6,
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'A&I Learning Portal',
          style: TextStyle(
            color: palette.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '이 사이트는 A&I 회원들을 위한 전용 학습 플랫폼입니다.\n© 2024 A&I. All rights reserved.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: palette.textMuted,
            fontSize: 12,
            height: 1.7,
          ),
        ),
      ],
    );
  }
}

class _CourseCardData {
  const _CourseCardData({
    required this.title,
    required this.description,
    required this.badgeLabel,
    required this.badgeBackground,
    required this.badgeBorder,
    required this.badgeText,
    required this.visualIcon,
    required this.isActive,
  });

  final String title;
  final String description;
  final String badgeLabel;
  final Color badgeBackground;
  final Color badgeBorder;
  final Color badgeText;
  final IconData visualIcon;
  final bool isActive;
}

class _CoursePalette {
  const _CoursePalette({
    required this.pageBackground,
    required this.cardBackground,
    required this.border,
    required this.cardShadow,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.logoBackground,
    required this.logoForeground,
    required this.iconBackground,
    required this.visualStart,
    required this.visualEnd,
    required this.visualIcon,
    required this.actionButtonBackground,
    required this.actionButtonForeground,
    required this.lockedButtonBackground,
    required this.lockedButtonForeground,
    required this.footerLogoBackground,
    required this.footerLogoForeground,
  });

  final Color pageBackground;
  final Color cardBackground;
  final Color border;
  final Color cardShadow;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color logoBackground;
  final Color logoForeground;
  final Color iconBackground;
  final Color visualStart;
  final Color visualEnd;
  final Color visualIcon;
  final Color actionButtonBackground;
  final Color actionButtonForeground;
  final Color lockedButtonBackground;
  final Color lockedButtonForeground;
  final Color footerLogoBackground;
  final Color footerLogoForeground;

  factory _CoursePalette.fromMode(bool isDarkMode) {
    if (isDarkMode) {
      return const _CoursePalette(
        pageBackground: Color(0xFF0A0A0A),
        cardBackground: Color(0xFF18181B),
        border: Color(0xFF27272A),
        cardShadow: Color(0x33000000),
        textPrimary: Color(0xFFF5F5F5),
        textSecondary: Color(0xFFD4D4D8),
        textMuted: Color(0xFFA1A1AA),
        logoBackground: Color(0xFFF5F5F5),
        logoForeground: Color(0xFF111111),
        iconBackground: Color(0xFF18181B),
        visualStart: Color(0xFF3F3F46),
        visualEnd: Color(0xFF27272A),
        visualIcon: Color(0x33FFFFFF),
        actionButtonBackground: Color(0xFFF5F5F5),
        actionButtonForeground: Color(0xFF111111),
        lockedButtonBackground: Color(0xFF27272A),
        lockedButtonForeground: Color(0xFF71717A),
        footerLogoBackground: Color(0xFF18181B),
        footerLogoForeground: Color(0xFF71717A),
      );
    }

    return const _CoursePalette(
      pageBackground: Color(0xFFF8F9FA),
      cardBackground: Color(0xFFFFFFFF),
      border: Color(0xFFE4E4E7),
      cardShadow: Color(0x14000000),
      textPrimary: Color(0xFF111111),
      textSecondary: Color(0xFF3F3F46),
      textMuted: Color(0xFF71717A),
      logoBackground: Color(0xFF111111),
      logoForeground: Color(0xFFFFFFFF),
      iconBackground: Color(0xFFFFFFFF),
      visualStart: Color(0xFFE4E4E7),
      visualEnd: Color(0xFFD4D4D8),
      visualIcon: Color(0x33000000),
      actionButtonBackground: Color(0xFF111111),
      actionButtonForeground: Color(0xFFFFFFFF),
      lockedButtonBackground: Color(0xFFF4F4F5),
      lockedButtonForeground: Color(0xFFA1A1AA),
      footerLogoBackground: Color(0xFFF4F4F5),
      footerLogoForeground: Color(0xFF71717A),
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

const _activeCourse = _CourseCardData(
  title: '기초 CS 과정',
  description: '운영체제, 네트워크, 자료구조 등 개발자의 필수 소양인 컴퓨터 사이언스 기초를 다지는 과정입니다.',
  badgeLabel: 'ACTIVE',
  badgeBackground: Color(0xFFECFDF3),
  badgeBorder: Color(0xFFC6F6D5),
  badgeText: Color(0xFF16A34A),
  visualIcon: Icons.code_rounded,
  isActive: true,
);

const _lockedCourse = _CourseCardData(
  title: 'AI 심화 과정',
  description: '머신러닝과 딥러닝의 핵심 원리를 파악하고 실제 모델을 구현해보는 실습 위주의 교육 과정입니다.',
  badgeLabel: 'LOCKED',
  badgeBackground: Color(0xFFF4F4F5),
  badgeBorder: Color(0xFFE4E4E7),
  badgeText: Color(0xFF71717A),
  visualIcon: Icons.smart_toy_rounded,
  isActive: false,
);
