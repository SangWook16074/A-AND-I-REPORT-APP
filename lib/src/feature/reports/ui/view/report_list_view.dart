import 'package:a_and_i_report_web_server/src/core/constants/api_url.dart';
import 'package:a_and_i_report_web_server/src/core/providers/study_theme_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_state.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_state.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/entities/level.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/entities/report_summary.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/entities/report_type.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/viewModel/report_list_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 과제 목록(리포트 목록) 화면입니다.
///
/// `report_list_view.html` 시안을 기반으로,
/// 코스별/주차별 과제 목록을 표시합니다.
class ReportListView extends ConsumerStatefulWidget {
  const ReportListView({
    super.key,
    required this.courseSlug,
  });

  final String courseSlug;

  @override
  ConsumerState<ReportListView> createState() => _ReportListViewState();
}

class _ReportListViewState extends ConsumerState<ReportListView> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(studyDarkModeProvider);
    final palette = _Palette.fromMode(isDarkMode);
    final reportListStateAsync =
        ref.watch(reportListViewModelProvider(widget.courseSlug));
    final isLoggedIn = ref.watch(authViewModelProvider).status ==
        AuthenticationStatus.authenticated;
    final userState = ref.watch(userViewModelProvider);
    final profileImageUrl = userState.profileImageUrl;
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      backgroundColor: palette.pageBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 896),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 18 : 24),
                child: Column(
                  children: [
                    _TopBar(
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
                        context.go('/course');
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: isMobile ? 34 : 48),
                      child: Column(
                        children: [
                          Text(
                            '목차',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: palette.textPrimary,
                              fontSize: isMobile ? 36 : 50,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -1.0,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '학습 과정 및 과제 현황을 한눈에 확인하세요.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: palette.textMuted,
                              fontSize: isMobile ? 15 : 18,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: isMobile ? 24 : 30),
                    reportListStateAsync.when(
                      data: (state) {
                        if (state.errorMsg.isNotEmpty) {
                          return _FeedbackCard(
                            palette: palette,
                            message: state.errorMsg,
                          );
                        }

                        final sections = _buildSections(state.reports);
                        if (sections.isEmpty) {
                          return _FeedbackCard(
                            palette: palette,
                            message: '표시할 과제가 없습니다.',
                          );
                        }

                        return Column(
                          children: [
                            ...sections.map(
                              (section) => Padding(
                                padding: const EdgeInsets.only(bottom: 22),
                                child: _CourseSectionCard(
                                  palette: palette,
                                  section: section,
                                  courseSlug: widget.courseSlug,
                                ),
                              ),
                            ),
                            SizedBox(height: isMobile ? 56 : 80),
                            _Footer(palette: palette),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                      loading: () => Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: isMobile ? 52 : 68,
                        ),
                        child: CircularProgressIndicator(
                          color: palette.textPrimary,
                        ),
                      ),
                      error: (error, _) => _FeedbackCard(
                        palette: palette,
                        message: error.toString(),
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

  List<_CourseSection> _buildSections(List<ReportSummary> reports) {
    final sorted = List<ReportSummary>.of(reports)
      ..sort((a, b) {
        final typeCompare = a.reportType.index.compareTo(b.reportType.index);
        if (typeCompare != 0) {
          return typeCompare;
        }

        final weekCompare = a.week.compareTo(b.week);
        if (weekCompare != 0) {
          return weekCompare;
        }

        return a.seq.compareTo(b.seq);
      });

    final sections = <_CourseSection>[];
    final metas = <_TypeMeta>[
      const _TypeMeta(
        type: ReportType.CS,
        title: '기초 CS 과정',
        subtitle: 'Computer Science Fundamentals',
      ),
      const _TypeMeta(
        type: ReportType.BASIC,
        title: 'BASIC 과정',
        subtitle: 'Programming Basics',
      ),
    ];

    for (final meta in metas) {
      final typeReports = sorted
          .where((report) => report.reportType == meta.type)
          .toList(growable: false);
      if (typeReports.isEmpty) {
        continue;
      }

      final weekGroups = <_WeekGroup>[];
      final weeks = typeReports.map((report) => report.week).toSet().toList()
        ..sort();

      for (final week in weeks) {
        final weekReports = typeReports
            .where((report) => report.week == week)
            .toList(growable: false)
          ..sort((a, b) => a.seq.compareTo(b.seq));

        final hasProgress = weekReports.any(
          (report) => report.endAt.isAfter(DateTime.now().toUtc()),
        );

        weekGroups.add(
          _WeekGroup(
            week: week,
            isProgress: hasProgress,
            reports: weekReports,
          ),
        );
      }

      sections.add(
        _CourseSection(
          title: meta.title,
          subtitle: meta.subtitle,
          weekGroups: weekGroups,
        ),
      );
    }

    return sections;
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.palette,
    required this.profileImageUrl,
    required this.isLoggedIn,
    required this.onTapLogo,
    required this.onTapContrast,
    required this.onTapAvatar,
    required this.onTapBack,
  });

  final _Palette palette;
  final String? profileImageUrl;
  final bool isLoggedIn;
  final VoidCallback onTapLogo;
  final VoidCallback onTapContrast;
  final VoidCallback onTapAvatar;
  final VoidCallback onTapBack;

  @override
  Widget build(BuildContext context) {
    final resolvedImageUrl = _resolveProfileImageUrl(profileImageUrl);

    return Padding(
      padding: const EdgeInsets.only(top: 18),
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
                color: palette.iconBackground,
                borderRadius: BorderRadius.circular(999),
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
                color: palette.iconBackground,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: palette.border),
              ),
              child: ClipOval(
                child: resolvedImageUrl == null
                    ? Icon(
                        Icons.person,
                        size: 20,
                        color: isLoggedIn
                            ? palette.textPrimary
                            : palette.textMuted.withValues(alpha: 0.85),
                      )
                    : CachedNetworkImage(
                        imageUrl: resolvedImageUrl,
                        fit: BoxFit.cover,
                        errorWidget: (_, __, ___) => Icon(
                          Icons.person,
                          size: 20,
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

  final _Palette palette;

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

class _CourseSectionCard extends StatelessWidget {
  const _CourseSectionCard({
    required this.palette,
    required this.section,
    required this.courseSlug,
  });

  final _Palette palette;
  final _CourseSection section;
  final String courseSlug;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 18 : 30),
      decoration: BoxDecoration(
        color: palette.cardBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: palette.border),
        boxShadow: [
          BoxShadow(
            color: palette.cardShadow,
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 6,
                height: isMobile ? 30 : 36,
                decoration: BoxDecoration(
                  color: palette.textPrimary,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      section.title,
                      style: TextStyle(
                        color: palette.textPrimary,
                        fontSize: isMobile ? 24 : 30,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.8,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      section.subtitle,
                      style: TextStyle(
                        color: palette.textMuted,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: palette.activeBadgeBackground,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: palette.activeBadgeBorder),
                ),
                child: Text(
                  'ACTIVE',
                  style: TextStyle(
                    color: palette.activeBadgeText,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 22 : 30),
          Column(
            children: section.weekGroups.map((weekGroup) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: weekGroup == section.weekGroups.last ? 0 : 20,
                ),
                child: _WeekGroupCard(
                  palette: palette,
                  weekGroup: weekGroup,
                  courseSlug: courseSlug,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _WeekGroupCard extends StatelessWidget {
  const _WeekGroupCard({
    required this.palette,
    required this.weekGroup,
    required this.courseSlug,
  });

  final _Palette palette;
  final _WeekGroup weekGroup;
  final String courseSlug;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${weekGroup.week}주차 과제',
              style: TextStyle(
                color: palette.textPrimary,
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 8),
            _WeekStatusBadge(
              isProgress: weekGroup.isProgress,
              palette: palette,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          children: weekGroup.reports.map((report) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: report == weekGroup.reports.last ? 0 : 8,
              ),
              child: _ReportTile(
                palette: palette,
                report: report,
                courseSlug: courseSlug,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _WeekStatusBadge extends StatelessWidget {
  const _WeekStatusBadge({
    required this.isProgress,
    required this.palette,
  });

  final bool isProgress;
  final _Palette palette;

  @override
  Widget build(BuildContext context) {
    if (isProgress) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: const Color(0xFFECFDF3),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: const Color(0xFFA7F3D0)),
        ),
        child: const Text(
          '진행중',
          style: TextStyle(
            color: Color(0xFF059669),
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.7,
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: palette.doneBadgeBackground,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: palette.doneBadgeBorder),
      ),
      child: Text(
        '종료',
        style: TextStyle(
          color: palette.doneBadgeText,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.7,
        ),
      ),
    );
  }
}

class _ReportTile extends StatelessWidget {
  const _ReportTile({
    required this.palette,
    required this.report,
    required this.courseSlug,
  });

  final _Palette palette;
  final ReportSummary report;
  final String courseSlug;

  @override
  Widget build(BuildContext context) {
    final bool isDone = report.endAt.isBefore(DateTime.now().toUtc());

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () => context.go(
        '/report/${report.id}?courseSlug=${Uri.encodeComponent(courseSlug)}&endAt=${report.endAt.millisecondsSinceEpoch}&week=${report.week}&seq=${report.seq}',
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: palette.tileBackground,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: palette.tileBorder),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    '${report.week}-${report.seq}.',
                    style: TextStyle(
                      color: palette.textMuted,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      report.title,
                      style: TextStyle(
                        color: palette.textSecondary,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'DIFFICULTY',
                  style: TextStyle(
                    color: palette.textMuted,
                    fontSize: 9,
                    letterSpacing: 0.7,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _difficultyText(report.level),
                  style: TextStyle(
                    color: _difficultyColor(report.level),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Icon(
              isDone
                  ? Icons.check_circle_rounded
                  : Icons.radio_button_unchecked_rounded,
              color: isDone ? const Color(0xFF22C55E) : palette.textMuted,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }

  String _difficultyText(Level level) {
    switch (level) {
      case Level.LOW:
        return 'LOW';
      case Level.MEDIUM:
        return 'MID';
      case Level.HIGH:
        return 'HIGH';
      case Level.VERYHIGH:
        return 'VERY HIGH';
    }
  }

  Color _difficultyColor(Level level) {
    switch (level) {
      case Level.LOW:
        return const Color(0xFF6B7280);
      case Level.MEDIUM:
        return const Color(0xFF16A34A);
      case Level.HIGH:
        return const Color(0xFF4B5563);
      case Level.VERYHIGH:
        return const Color(0xFFB91C1C);
    }
  }
}

class _FeedbackCard extends StatelessWidget {
  const _FeedbackCard({
    required this.palette,
    required this.message,
  });

  final _Palette palette;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: palette.cardBackground,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: palette.border),
      ),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: palette.textMuted,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required this.palette});

  final _Palette palette;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: palette.border, height: 1),
        const SizedBox(height: 24),
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

class _CourseSection {
  const _CourseSection({
    required this.title,
    required this.subtitle,
    required this.weekGroups,
  });

  final String title;
  final String subtitle;
  final List<_WeekGroup> weekGroups;
}

class _WeekGroup {
  const _WeekGroup({
    required this.week,
    required this.isProgress,
    required this.reports,
  });

  final int week;
  final bool isProgress;
  final List<ReportSummary> reports;
}

class _TypeMeta {
  const _TypeMeta({
    required this.type,
    required this.title,
    required this.subtitle,
  });

  final ReportType type;
  final String title;
  final String subtitle;
}

class _Palette {
  const _Palette({
    required this.pageBackground,
    required this.cardBackground,
    required this.border,
    required this.cardShadow,
    required this.tileBackground,
    required this.tileBorder,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.logoBackground,
    required this.logoForeground,
    required this.iconBackground,
    required this.activeBadgeBackground,
    required this.activeBadgeBorder,
    required this.activeBadgeText,
    required this.doneBadgeBackground,
    required this.doneBadgeBorder,
    required this.doneBadgeText,
    required this.footerLogoBackground,
    required this.footerLogoForeground,
  });

  final Color pageBackground;
  final Color cardBackground;
  final Color border;
  final Color cardShadow;
  final Color tileBackground;
  final Color tileBorder;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color logoBackground;
  final Color logoForeground;
  final Color iconBackground;
  final Color activeBadgeBackground;
  final Color activeBadgeBorder;
  final Color activeBadgeText;
  final Color doneBadgeBackground;
  final Color doneBadgeBorder;
  final Color doneBadgeText;
  final Color footerLogoBackground;
  final Color footerLogoForeground;

  factory _Palette.fromMode(bool isDarkMode) {
    if (isDarkMode) {
      return const _Palette(
        pageBackground: Color(0xFF0A0A0A),
        cardBackground: Color(0xFF18181B),
        border: Color(0xFF27272A),
        cardShadow: Color(0x33000000),
        tileBackground: Color(0xFF27272A),
        tileBorder: Color(0xFF3F3F46),
        textPrimary: Color(0xFFF5F5F5),
        textSecondary: Color(0xFFD4D4D8),
        textMuted: Color(0xFFA1A1AA),
        logoBackground: Color(0xFFF5F5F5),
        logoForeground: Color(0xFF111111),
        iconBackground: Color(0xFF18181B),
        activeBadgeBackground: Color(0xFF27272A),
        activeBadgeBorder: Color(0xFF3F3F46),
        activeBadgeText: Color(0xFFD4D4D8),
        doneBadgeBackground: Color(0xFF27272A),
        doneBadgeBorder: Color(0xFF3F3F46),
        doneBadgeText: Color(0xFFD4D4D8),
        footerLogoBackground: Color(0xFF18181B),
        footerLogoForeground: Color(0xFF71717A),
      );
    }

    return const _Palette(
      pageBackground: Color(0xFFF8F9FA),
      cardBackground: Color(0xFFFFFFFF),
      border: Color(0xFFE4E4E7),
      cardShadow: Color(0x14000000),
      tileBackground: Color(0xFFF8FAFC),
      tileBorder: Color(0xFFE5E7EB),
      textPrimary: Color(0xFF111111),
      textSecondary: Color(0xFF27272A),
      textMuted: Color(0xFF71717A),
      logoBackground: Color(0xFF111111),
      logoForeground: Color(0xFFFFFFFF),
      iconBackground: Color(0xFFFFFFFF),
      activeBadgeBackground: Color(0xFFF4F4F5),
      activeBadgeBorder: Color(0xFFE4E4E7),
      activeBadgeText: Color(0xFF71717A),
      doneBadgeBackground: Color(0xFFF4F4F5),
      doneBadgeBorder: Color(0xFFE4E4E7),
      doneBadgeText: Color(0xFF71717A),
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
