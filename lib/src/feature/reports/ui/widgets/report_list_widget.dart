import 'package:a_and_i_report_web_server/src/feature/home/data/entities/report_summary.dart';
import 'package:a_and_i_report_web_server/src/core/widgets/responsive_layout.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/widgets/report_status_widget.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/widgets/report_title_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 전달받은 과제목록 렌더링
class ReportListWidget extends StatelessWidget {
  final String label;
  final List<ReportSummary> reports;
  const ReportListWidget(
      {super.key, required this.label, required this.reports});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_label(context), _reports(context)],
    );
  }

  Widget _label(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final weekStatus = reports.any(
      (report) =>
          ReportStatueType.fromEndAt(report.endAt) == ReportStatueType.progress,
    )
        ? ReportStatueType.progress
        : ReportStatueType.done;

    return Padding(
      padding:
          EdgeInsets.only(top: isMobile ? 8 : 10, bottom: isMobile ? 10 : 14),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: const Color(0xFF111827),
                fontSize: isMobile ? 18 : 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ReportStatus(type: weekStatus),
        ],
      ),
    );
  }

  Widget _reports(BuildContext context) => Column(
        children: List.generate(reports.length, (index) {
          final report = reports[index];
          final done =
              ReportStatueType.fromEndAt(report.endAt) == ReportStatueType.done;
          return Padding(
            padding:
                EdgeInsets.only(bottom: index == reports.length - 1 ? 0 : 10),
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () => context.go(
                  "/report/${report.id}?endAt=${report.endAt.millisecondsSinceEpoch}"),
              child: ReportTitleRow(
                reportSummary: report,
                indexLabel: "${report.week}-${report.seq}.",
                isDone: done,
              ),
            ),
          );
        }),
      );
}
