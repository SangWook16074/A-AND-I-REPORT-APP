import 'dart:ui';

import 'package:a_and_i_report_web_server/src/core/constants/api_url.dart';
import 'package:a_and_i_report_web_server/src/core/providers/study_theme_provider.dart';
import 'package:a_and_i_report_web_server/src/core/utils/api_error_mapper.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/providers/auth_session_revision_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_state.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_state.dart';
import 'package:a_and_i_report_web_server/src/feature/course/presentation/course_access_policy.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/entities/course.dart';
import 'package:a_and_i_report_web_server/src/feature/home/providers/get_courses_usecase_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final courseListProvider =
    FutureProvider.autoDispose<List<Course>>((ref) async {
  ref.watch(authSessionRevisionProvider);
  return ref.read(getCoursesUsecaseProvider).call();
});

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
    final isServiceActive = ref.watch(courseServiceActiveProvider);
    final courseListAsync = ref.watch(courseListProvider);
    final isLoggedIn = ref.watch(authViewModelProvider).status ==
        AuthenticationStatus.authenticated;
    final userState = ref.watch(userViewModelProvider);
    final profileImageUrl = userState.profileImageUrl;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;

    return Scaffold(
      backgroundColor: palette.pageBackground,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1080),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: isMobile ? 18 : 24),
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
                          onTapAvatar: () => context
                              .go(isLoggedIn ? '/my-account' : '/sign-in'),
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
                          courseListAsync: courseListAsync,
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
          if (!isServiceActive)
            _CourseServiceDimOverlay(
              palette: palette,
              isDarkMode: isDarkMode,
              onTapBack: () => context.go('/'),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildCourseSections({
    required BuildContext context,
    required _CoursePalette palette,
    required AsyncValue<List<Course>> courseListAsync,
  }) {
    return courseListAsync.when(
      loading: () => <Widget>[
        _CourseLoadingCard(palette: palette),
      ],
      error: (error, _) => <Widget>[
        _CourseFeedbackCard(
          palette: palette,
          message: ApiErrorMapper.map(
            error,
            fallbackMessage: '코스 목록을 불러오지 못했습니다.',
          ),
        ),
      ],
      data: (courses) {
        final sortedCourses = courses
            .where((course) => isCourseVisible(course.startDate))
            .toList()
          ..sort(
            (prev, curr) => prev.metadata.title.compareTo(curr.metadata.title),
          );

        if (sortedCourses.isEmpty) {
          return <Widget>[
            _CourseFeedbackCard(
              palette: palette,
              message: '표시할 코스가 없습니다.',
            ),
          ];
        }

        return <Widget>[
          for (var index = 0; index < sortedCourses.length; index++) ...[
            Builder(
              builder: (_) {
                final course = sortedCourses[index];
                final cardData = _toCourseCardData(course);
                return _CourseCard(
                  palette: palette,
                  data: cardData,
                  onTapCourse: cardData.isClosed
                      ? null
                      : () => context.go(
                            '/report?courseSlug=${Uri.encodeComponent(course.slug)}',
                          ),
                );
              },
            ),
            if (index != sortedCourses.length - 1) const SizedBox(height: 22),
          ],
        ];
      },
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
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          color: palette.iconBackground,
          border: Border.all(color: palette.border),
        ),
        child: Icon(
          icon,
          size: 20,
          color: palette.textMuted,
        ),
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  const _CourseCard({
    required this.palette,
    required this.data,
    required this.onTapCourse,
  });

  final _CoursePalette palette;
  final _CourseCardData data;
  final VoidCallback? onTapCourse;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;

    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTapCourse,
      child: Container(
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
                    phaseStyle: data.phaseStyle,
                  ),
                  _CourseCardContent(
                    palette: palette,
                    data: data,
                  ),
                ],
              )
            : Row(
                children: [
                  SizedBox(
                    width: 300,
                    child: _CourseVisual(
                      phaseStyle: data.phaseStyle,
                    ),
                  ),
                  Expanded(
                    child: _CourseCardContent(
                      palette: palette,
                      data: data,
                    ),
                  ),
                ],
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
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      decoration: BoxDecoration(
        color: palette.cardBackground,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: palette.border),
      ),
      child: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
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
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
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
          height: 1.6,
        ),
      ),
    );
  }
}

class _CourseVisual extends StatelessWidget {
  const _CourseVisual({
    required this.phaseStyle,
  });

  final _CoursePhaseStyle phaseStyle;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.35,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: phaseStyle.visualEnd,
          ),
          child: Center(
            child: Icon(
              phaseStyle.icon,
              size: 84,
              color: phaseStyle.iconColor,
            ),
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
  });

  final _CoursePalette palette;
  final _CourseCardData data;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Padding(
      padding: EdgeInsets.all(isMobile ? 20 : 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  data.title,
                  style: TextStyle(
                    color: palette.textPrimary,
                    fontSize:
                        30 > (isMobile ? 26 : 30) ? 30 : (isMobile ? 26 : 30),
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.6,
                  ),
                ),
              ),
              if (data.isClosed) ...[
                const SizedBox(width: 12),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: palette.lockedButtonBackground,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: palette.border),
                  ),
                  child: Text(
                    '종료',
                    style: TextStyle(
                      color: palette.lockedButtonForeground,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ],
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
        ],
      ),
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

/// 학습 코스 서비스가 비활성화되었을 때 화면 전체를 덮는 딤 오버레이입니다.
///
/// 하단 콘텐츠를 블러+스크림으로 가려 진입을 차단하고,
/// 중앙 글래스 카드로 비활성화 상태를 안내합니다.
class _CourseServiceDimOverlay extends StatelessWidget {
  const _CourseServiceDimOverlay({
    required this.palette,
    required this.isDarkMode,
    required this.onTapBack,
  });

  final _CoursePalette palette;
  final bool isDarkMode;
  final VoidCallback onTapBack;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    final scrimColor =
        isDarkMode ? const Color(0xD905050A) : const Color(0x73111114);
    final accent = const Color(0xFF3B82F6);
    final badgeBackground =
        isDarkMode ? const Color(0xFF1E2A44) : const Color(0xFFE8F0FF);

    return Positioned.fill(
      // 빈 onTap으로 하단 카드 탭이 통과되지 않도록 흡수합니다.
      child: GestureDetector(
        onTap: () {},
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
          child: Container(
            color: scrimColor,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 26 : 36,
                  vertical: isMobile ? 32 : 40,
                ),
                decoration: BoxDecoration(
                  color: palette.cardBackground,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: palette.border),
                  boxShadow: [
                    BoxShadow(
                      color: isDarkMode
                          ? const Color(0x66000000)
                          : const Color(0x1F000000),
                      blurRadius: 40,
                      offset: const Offset(0, 18),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: badgeBackground,
                      ),
                      child: Icon(
                        Icons.flag_rounded,
                        size: 36,
                        color: accent,
                      ),
                    ),
                    const SizedBox(height: 22),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: badgeBackground,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        '코스 안내',
                        style: TextStyle(
                          color: accent,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '4기 스터디 과정이 종료되었어요.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: palette.textPrimary,
                        fontSize: isMobile ? 22 : 25,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.6,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '정규 교육과정은 모두 마무리되었어요.\n'
                      '프레임워크 과정은 계속 진행되고 있어요.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: palette.textMuted,
                        fontSize: 15,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      child: _DimPrimaryButton(
                        palette: palette,
                        label: '홈으로 돌아가기',
                        onTap: onTapBack,
                      ),
                    ),
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

class _DimPrimaryButton extends StatelessWidget {
  const _DimPrimaryButton({
    required this.palette,
    required this.label,
    required this.onTap,
  });

  final _CoursePalette palette;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        height: 52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: palette.actionButtonBackground,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: palette.actionButtonForeground,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
          ),
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
    required this.isClosed,
    required this.phaseStyle,
  });

  final String title;
  final String description;
  final String period;
  final bool isClosed;
  final _CoursePhaseStyle phaseStyle;
}

class _CoursePhaseStyle {
  const _CoursePhaseStyle({
    required this.icon,
    required this.visualEnd,
    required this.iconColor,
  });

  final IconData icon;
  final Color visualEnd;
  final Color iconColor;
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
  final phaseStyle = _coursePhaseStyle(course);
  final isClosed = isCourseClosed(course.endDate);

  return _CourseCardData(
    title: course.metadata.title,
    description: course.metadata.description,
    period: '기간: ${course.startDate} ~ ${course.endDate}',
    isClosed: isClosed,
    phaseStyle: phaseStyle,
  );
}

_CoursePhaseStyle _coursePhaseStyle(Course course) {
  final phase = (course.phase ?? course.metadata.phase).trim().toLowerCase();

  switch (phase) {
    case 'basic':
      return const _CoursePhaseStyle(
        icon: Icons.terminal,
        visualEnd: Color(0xFFCFE2FF),
        iconColor: Color(0xFF3B82F6),
      );
    case 'cs':
      return const _CoursePhaseStyle(
        icon: Icons.storage,
        visualEnd: Color(0xFF8FBCFF),
        iconColor: Color(0xFF2563EB),
      );
    case 'framework':
      return const _CoursePhaseStyle(
        icon: Icons.layers,
        visualEnd: Color(0xFF3B82F6),
        iconColor: Color(0xFF1E3A8A),
      );
    default:
      return const _CoursePhaseStyle(
        icon: Icons.auto_stories_rounded,
        visualEnd: Color(0xFFCFCFD6),
        iconColor: Color(0xFF52525B),
      );
  }
}
