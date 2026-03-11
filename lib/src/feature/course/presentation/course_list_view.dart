import 'package:a_and_i_report_web_server/src/core/constants/api_url.dart';
import 'package:a_and_i_report_web_server/src/core/providers/study_theme_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_state.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_state.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/entities/course.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/viewModel/course_list_state.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/viewModel/course_list_view_model.dart';
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
    final courseListState = ref.watch(courseListViewModelProvider);

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
                    ..._buildCourseSections(
                      context: context,
                      palette: palette,
                      courseListState: courseListState,
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

  List<Widget> _buildCourseSections({
    required BuildContext context,
    required _CoursePalette palette,
    required CourseListState courseListState,
  }) {
    switch (courseListState.status) {
      case CourseListViewStatus.loading:
        return [
          _CourseLoadingCard(palette: palette),
        ];
      case CourseListViewStatus.error:
        return [
          _CourseFeedbackCard(
            palette: palette,
            message: courseListState.errorMsg.isEmpty
                ? '코스 목록을 불러오지 못했습니다.'
                : courseListState.errorMsg,
          ),
        ];
      case CourseListViewStatus.done:
        final courses = List<Course>.of(courseListState.courses)
          ..sort((a, b) {
            final activeCompare = (_isCourseActive(a) == _isCourseActive(b))
                ? 0
                : (_isCourseActive(a) ? -1 : 1);
            if (activeCompare != 0) {
              return activeCompare;
            }

            return a.metadata.title.compareTo(b.metadata.title);
          });

        if (courses.isEmpty) {
          return [
            _CourseFeedbackCard(
              palette: palette,
              message: '표시할 코스가 없습니다.',
            ),
          ];
        }

        return [
          for (var index = 0; index < courses.length; index++) ...[
            _CourseCard(
              palette: palette,
              data: _toCourseCardData(courses[index]),
              onTapAction: _isCourseActive(courses[index])
                  ? () => context.go(
                        '/report?courseSlug=${Uri.encodeComponent(courses[index].slug)}',
                      )
                  : null,
            ),
            if (index != courses.length - 1) const SizedBox(height: 22),
          ],
        ];
    }
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
          const SizedBox(height: 12),
          Text(
            data.period,
            style: TextStyle(
              color: palette.textSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w600,
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

class _CourseFeedbackCard extends StatelessWidget {
  const _CourseFeedbackCard({
    required this.palette,
    required this.message,
  });

  final _CoursePalette palette;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      decoration: BoxDecoration(
        color: palette.cardBackground,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: palette.border),
      ),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: palette.textMuted,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          height: 1.6,
        ),
      ),
    );
  }
}

class _CourseLoadingCard extends StatelessWidget {
  const _CourseLoadingCard({required this.palette});

  final _CoursePalette palette;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48),
      decoration: BoxDecoration(
        color: palette.cardBackground,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: palette.border),
      ),
      child: Center(
        child: CircularProgressIndicator(
          color: palette.textPrimary,
        ),
      ),
    );
  }
}

class _CourseCardData {
  const _CourseCardData({
    required this.title,
    required this.description,
    required this.period,
    required this.badgeLabel,
    required this.badgeBackground,
    required this.badgeBorder,
    required this.badgeText,
    required this.visualIcon,
    required this.isActive,
  });

  final String title;
  final String description;
  final String period;
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

_CourseCardData _toCourseCardData(Course course) {
  final isActive = _isCourseActive(course);

  return _CourseCardData(
    title: course.metadata.title,
    description: course.metadata.description,
    period: '기간: ${course.startDate} ~ ${course.endDate}',
    badgeLabel: isActive ? 'ACTIVE' : 'LOCKED',
    badgeBackground:
        isActive ? const Color(0xFFECFDF3) : const Color(0xFFF4F4F5),
    badgeBorder: isActive ? const Color(0xFFC6F6D5) : const Color(0xFFE4E4E7),
    badgeText: isActive ? const Color(0xFF16A34A) : const Color(0xFF71717A),
    visualIcon: _courseIcon(course),
    isActive: isActive,
  );
}

bool _isCourseActive(Course course) {
  final normalizedStatus = course.status.trim().toLowerCase();

  return normalizedStatus == 'active' ||
      normalizedStatus == 'opened' ||
      normalizedStatus == 'open' ||
      normalizedStatus == 'ongoing' ||
      normalizedStatus == 'in_progress' ||
      normalizedStatus == 'available' ||
      normalizedStatus == 'published';
}

IconData _courseIcon(Course course) {
  final slug = course.slug.toLowerCase();
  final fieldTag = course.fieldTag.toLowerCase();
  final title = course.metadata.title.toLowerCase();
  final description = course.metadata.description.toLowerCase();

  if (slug.contains('ai') ||
      fieldTag.contains('ai') ||
      title.contains('ai') ||
      description.contains('딥러닝') ||
      description.contains('머신러닝')) {
    return Icons.smart_toy_rounded;
  }

  if (slug.contains('cs') ||
      fieldTag.contains('cs') ||
      description.contains('computer science') ||
      description.contains('자료구조') ||
      description.contains('운영체제')) {
    return Icons.code_rounded;
  }

  return Icons.auto_stories_rounded;
}
