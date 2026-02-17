import 'package:a_and_i_report_web_server/src/core/widgets/responsive_layout.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/view/problem_detail_view.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/viewModel/report_detail_state.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/viewModel/report_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReportDetailUI extends HookConsumerWidget {
  final String id;
  final DateTime? endAt;
  const ReportDetailUI({super.key, required this.id, this.endAt});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reportDetailViewModelProvider(id));

    return Scaffold(
      body: switch (state.status) {
        ViewStatus.success => SingleChildScrollView(
            child: ResponsiveLayout(
              mobile: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: ProblemDetailView(report: state.report!, endAt: endAt),
              ),
              tablet: Padding(
                padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 48),
                child: ProblemDetailView(report: state.report!, endAt: endAt),
              ),
              desktop: Padding(
                padding: const EdgeInsets.only(
                    top: 48, left: 200, right: 200, bottom: 15),
                child: ProblemDetailView(report: state.report!, endAt: endAt),
              ),
            ),
          ),
        ViewStatus.error => Center(
            child: Text(state.errorMsg),
          ),
        ViewStatus.loading => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
      },
    );
  }
}
