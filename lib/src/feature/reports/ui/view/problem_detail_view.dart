import 'dart:async';

import 'package:a_and_i_report_web_server/src/core/widgets/bottom_logo.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/widgets/report_status_widget.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/data/entities/report.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/view/problem_bullet_list.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/view/problem_io_view.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/view/problem_nav_tabs.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/view/problem_section_header.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/view/report_submit_result_view.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/view/source_code_submit_view.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/widgets/problem_level_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProblemDetailView extends HookWidget {
  final Report report;
  final DateTime? endAt;
  final bool isDarkMode;
  const ProblemDetailView({
    super.key,
    required this.report,
    this.endAt,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final selectedTab = useState(0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _HeaderCard(
          report: report,
          selectedTab: selectedTab,
          endAt: endAt,
          isDarkMode: isDarkMode,
        ),
        _ContentCard(
          report: report,
          selectedTab: selectedTab.value,
          isDarkMode: isDarkMode,
        ),
        const SizedBox(height: 64),
        const BottomLogo(),
      ],
    );
  }
}

class _HeaderCard extends StatelessWidget {
  final Report report;
  final ValueNotifier<int> selectedTab;
  final DateTime? endAt;
  final bool isDarkMode;

  const _HeaderCard({
    required this.report,
    required this.selectedTab,
    this.endAt,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(48, 40, 48, 0),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF18181B) : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        border: Border(
          top: BorderSide(
              color: isDarkMode
                  ? const Color(0xFF27272A)
                  : const Color(0xFFE5E7EB)),
          left: BorderSide(
              color: isDarkMode
                  ? const Color(0xFF27272A)
                  : const Color(0xFFE5E7EB)),
          right: BorderSide(
              color: isDarkMode
                  ? const Color(0xFF27272A)
                  : const Color(0xFFE5E7EB)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        report.title,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Color(0xFF000000),
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ProblemLevelBadge(level: report.level),
                  ],
                ),
              ),
              if (endAt != null) ...[
                const SizedBox(width: 20),
                _DeadlineTimer(endAt: endAt!, isDarkMode: isDarkMode),
              ],
            ],
          ),
          const SizedBox(height: 32),
          ProblemNavTabs(selectedTab: selectedTab, isDarkMode: isDarkMode),
        ],
      ),
    );
  }
}

class _ContentCard extends StatelessWidget {
  final Report report;
  final int selectedTab;
  final bool isDarkMode;

  const _ContentCard({
    required this.report,
    required this.selectedTab,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF18181B) : Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        border: Border.all(
          color:
              isDarkMode ? const Color(0xFF27272A) : const Color(0xFFE5E7EB),
        ),
      ),
      child: switch (selectedTab) {
        0 => _ProblemTab(report: report, isDarkMode: isDarkMode),
        1 => SourceCodeSubmitView(report: report, isDarkMode: isDarkMode),
        2 => ReportSubmitResultView(report: report, isDarkMode: isDarkMode),
        _ => _ComingSoon(isDarkMode: isDarkMode),
      },
    );
  }
}

class _ProblemTab extends StatelessWidget {
  final Report report;
  final bool isDarkMode;
  const _ProblemTab({required this.report, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProblemSectionHeader(label: '문제 설명', isDarkMode: isDarkMode),
        const SizedBox(height: 24),
        Text(
          report.content,
          style: TextStyle(
            fontSize: 14,
            color: isDarkMode ? const Color(0xFFE5E7EB) : const Color(0xFF000000),
            height: 1.7,
          ),
        ),
        const SizedBox(height: 48),
        ProblemSectionHeader(label: '문제 요구 사항', isDarkMode: isDarkMode),
        const SizedBox(height: 24),
        ProblemBulletList(
          items: report.requirement.map((r) => r.content).toList(),
          isDarkMode: isDarkMode,
        ),
        const SizedBox(height: 48),
        ProblemSectionHeader(label: '학습 정리 목표', isDarkMode: isDarkMode),
        const SizedBox(height: 24),
        ProblemBulletList(
          items: report.objects.map((o) => o.content).toList(),
          isDarkMode: isDarkMode,
        ),
        const SizedBox(height: 48),
        ProblemSectionHeader(label: '예제 입출력', isDarkMode: isDarkMode),
        const SizedBox(height: 32),
        ProblemIOView(
          contents:
              report.exampleIo.map((io) => (io.input, io.output)).toList(),
          isDarkMode: isDarkMode,
        ),
      ],
    );
  }
}

class _ComingSoon extends StatelessWidget {
  final bool isDarkMode;
  const _ComingSoon({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Text(
          '준비 중입니다.',
          style: TextStyle(
            fontSize: 14,
            color: isDarkMode ? const Color(0xFFE5E7EB) : const Color(0xFF000000),
          ),
        ),
      ),
    );
  }
}

class _DeadlineTimer extends HookWidget {
  final DateTime endAt;
  final bool isDarkMode;
  const _DeadlineTimer({required this.endAt, required this.isDarkMode});

  Duration _remaining() {
    final now = DateTime.now().add(const Duration(hours: 9)).toUtc();
    final diff = endAt.difference(now);
    return diff.isNegative ? Duration.zero : diff;
  }

  @override
  Widget build(BuildContext context) {
    final isDone = ReportStatueType.fromEndAt(endAt) == ReportStatueType.done;
    final remaining = useState(_remaining());

    useEffect(() {
      if (isDone) return null;
      final timer = Timer.periodic(const Duration(seconds: 1), (_) {
        remaining.value = _remaining();
      });
      return timer.cancel;
    }, []);

    if (isDone) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.schedule,
            size: 15,
            color: isDarkMode ? const Color(0xFFA1A1AA) : const Color(0xFF9CA3AF),
          ),
          const SizedBox(width: 5),
          Text(
            '종료됨',
            style: TextStyle(
              fontSize: 13,
              color:
                  isDarkMode ? const Color(0xFFA1A1AA) : const Color(0xFF9CA3AF),
            ),
          ),
        ],
      );
    }

    final h = remaining.value.inHours.toString().padLeft(2, '0');
    final m = (remaining.value.inMinutes % 60).toString().padLeft(2, '0');
    final s = (remaining.value.inSeconds % 60).toString().padLeft(2, '0');

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.schedule,
          size: 15,
          color: isDarkMode ? const Color(0xFFA1A1AA) : const Color(0xFF6B7280),
        ),
        const SizedBox(width: 5),
        Text.rich(
          TextSpan(
            text: '마감까지 ',
            style: TextStyle(
              fontSize: 13,
              color:
                  isDarkMode ? const Color(0xFFA1A1AA) : const Color(0xFF6B7280),
            ),
            children: [
              TextSpan(
                text: '$h:$m:$s',
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.w600,
                  color:
                      isDarkMode ? const Color(0xFFE5E7EB) : const Color(0xFF000000),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
