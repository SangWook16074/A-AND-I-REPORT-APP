import 'package:a_and_i_report_web_server/src/core/providers/study_theme_provider.dart';
import 'package:a_and_i_report_web_server/src/core/widgets/responsive_layout.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/view/problem_detail_view.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/viewModel/report_detail_state.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/viewModel/report_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReportDetailUI extends HookConsumerWidget {
  final String id;
  final DateTime? endAt;
  final int? week;
  final int? seq;

  const ReportDetailUI({
    super.key,
    required this.id,
    this.endAt,
    this.week,
    this.seq,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reportDetailViewModelProvider(id));
    final isDarkMode = ref.watch(studyDarkModeProvider);

    final backgroundColor =
        isDarkMode ? const Color(0xFF0A0A0A) : const Color(0xFFF8F9FA);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: isDarkMode ? Colors.white : const Color(0xFF111111),
          ),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
              return;
            }
            context.go('/report');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.contrast_rounded,
              color: isDarkMode ? Colors.white : const Color(0xFF111111),
            ),
            onPressed: () {
              ref.read(studyDarkModeProvider.notifier).state = !isDarkMode;
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: switch (state.status) {
        ViewStatus.success => SingleChildScrollView(
            child: ResponsiveLayout(
              mobile: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: ProblemDetailView(
                  report: state.report!,
                  endAt: endAt,
                  isDarkMode: isDarkMode,
                ),
              ),
              tablet: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 48, horizontal: 48),
                child: ProblemDetailView(
                  report: state.report!,
                  endAt: endAt,
                  isDarkMode: isDarkMode,
                ),
              ),
              desktop: Padding(
                padding: const EdgeInsets.only(
                    top: 48, left: 200, right: 200, bottom: 15),
                child: ProblemDetailView(
                  report: state.report!,
                  endAt: endAt,
                  isDarkMode: isDarkMode,
                ),
              ),
            ),
          ),
        ViewStatus.error => Center(
            child: Text(
              state.errorMsg,
              style: TextStyle(
                color: isDarkMode ? Colors.white70 : const Color(0xFF111111),
              ),
            ),
          ),
        ViewStatus.loading => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
      },
    );
  }
}
