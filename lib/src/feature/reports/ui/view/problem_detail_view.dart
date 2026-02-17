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
  const ProblemDetailView({super.key, required this.report, this.endAt});

  @override
  Widget build(BuildContext context) {
    final selectedTab = useState(0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _HeaderCard(report: report, selectedTab: selectedTab, endAt: endAt),
        _ContentCard(report: report, selectedTab: selectedTab.value),
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

  const _HeaderCard({required this.report, required this.selectedTab, this.endAt});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(48, 40, 48, 0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        border: Border(
          top: BorderSide(color: Color(0xFFE5E7EB)),
          left: BorderSide(color: Color(0xFFE5E7EB)),
          right: BorderSide(color: Color(0xFFE5E7EB)),
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
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000000),
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
                _DeadlineTimer(endAt: endAt!),
              ],
            ],
          ),
          const SizedBox(height: 32),
          ProblemNavTabs(selectedTab: selectedTab),
        ],
      ),
    );
  }
}

class _ContentCard extends StatelessWidget {
  final Report report;
  final int selectedTab;

  const _ContentCard({required this.report, required this.selectedTab});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: switch (selectedTab) {
        0 => _ProblemTab(report: report),
        1 => SourceCodeSubmitView(report: report),
        2 => ReportSubmitResultView(report: report),
        _ => const _ComingSoon(),
      },
    );
  }
}

class _ProblemTab extends StatelessWidget {
  final Report report;
  const _ProblemTab({required this.report});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProblemSectionHeader(label: '문제 설명'),
        const SizedBox(height: 24),
        Text(
          report.content,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF000000),
            height: 1.7,
          ),
        ),
        const SizedBox(height: 48),
        const ProblemSectionHeader(label: '문제 요구 사항'),
        const SizedBox(height: 24),
        ProblemBulletList(
          items: report.requirement.map((r) => r.content).toList(),
        ),
        const SizedBox(height: 48),
        const ProblemSectionHeader(label: '학습 정리 목표'),
        const SizedBox(height: 24),
        ProblemBulletList(
          items: report.objects.map((o) => o.content).toList(),
        ),
        const SizedBox(height: 48),
        const ProblemSectionHeader(label: '예제 입출력'),
        const SizedBox(height: 32),
        ProblemIOView(
          contents:
              report.exampleIo.map((io) => (io.input, io.output)).toList(),
        ),
      ],
    );
  }
}

class _ComingSoon extends StatelessWidget {
  const _ComingSoon();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 48),
        child: Text(
          '준비 중입니다.',
          style: TextStyle(fontSize: 14, color: Color(0xFF000000)),
        ),
      ),
    );
  }
}

class _DeadlineTimer extends HookWidget {
  final DateTime endAt;
  const _DeadlineTimer({required this.endAt});

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
      return const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.schedule, size: 15, color: Color(0xFF9CA3AF)),
          SizedBox(width: 5),
          Text(
            '종료됨',
            style: TextStyle(fontSize: 13, color: Color(0xFF9CA3AF)),
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
        const Icon(Icons.schedule, size: 15, color: Color(0xFF6B7280)),
        const SizedBox(width: 5),
        Text.rich(
          TextSpan(
            text: '마감까지 ',
            style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
            children: [
              TextSpan(
                text: '$h:$m:$s',
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF000000),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
