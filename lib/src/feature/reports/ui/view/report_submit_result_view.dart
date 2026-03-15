import 'package:a_and_i_report_web_server/src/feature/reports/data/entities/report.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/viewModel/report_submit_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReportSubmitResultView extends ConsumerWidget {
  final Report report;
  final bool isDarkMode;

  const ReportSubmitResultView({
    super.key,
    required this.report,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reportSubmitViewModelProvider(report.id));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '제출 결과',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Color(0xFFF5F5F5) : Color(0xFF000000),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '"${report.title}" 제출 상태를 확인할 수 있습니다.',
          style: TextStyle(
            fontSize: 14,
            color: isDarkMode ? Color(0xFFE5E7EB) : Color(0xFF000000),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),
        _SummaryCard(state: state, isDarkMode: isDarkMode),
        const SizedBox(height: 20),
        _FeedbackCard(state: state, isDarkMode: isDarkMode),
        if (state.latestSubmittedCode.isNotEmpty) ...[
          const SizedBox(height: 20),
          _SubmittedCodeCard(state: state, isDarkMode: isDarkMode),
        ],
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final ReportSubmitState state;
  final bool isDarkMode;

  const _SummaryCard({required this.state, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final statusMeta = _statusMeta(state.submissionStatus);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? const Color(0xFF3F3F46) : const Color(0xFFE5E7EB),
        ),
        color: isDarkMode ? const Color(0xFF27272A) : const Color(0xFFFCFCFD),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: statusMeta.backgroundColor,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  statusMeta.label,
                  style: TextStyle(
                    color: statusMeta.textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Spacer(),
              if (state.latestSubmittedLanguage != null)
                Text(
                  '언어: ${state.latestSubmittedLanguage!.label}',
                  style: TextStyle(
                    color:
                        isDarkMode ? const Color(0xFFE5E7EB) : const Color(0xFF000000),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _MetricTile(
                label: '점수',
                value: state.submissionStatus == SubmissionStatus.notSubmitted ||
                        state.submissionStatus == SubmissionStatus.submitting ||
                        state.submissionStatus == SubmissionStatus.queued ||
                        state.submissionStatus == SubmissionStatus.judging
                    ? '-'
                    : '${state.score}',
                isDarkMode: isDarkMode,
              ),
              const SizedBox(width: 12),
              _MetricTile(
                label: '제출 횟수',
                value: '${state.submitCount}',
                isDarkMode: isDarkMode,
              ),
              const SizedBox(width: 12),
              _MetricTile(
                label: '최근 제출',
                value: _formatDateTime(state.submittedAt),
                isDarkMode: isDarkMode,
              ),
            ],
          ),
          if ((state.submissionId ?? '').isNotEmpty) ...[
            const SizedBox(height: 14),
            Text(
              'Submission ID: ${state.submissionId}',
              style: TextStyle(
                fontSize: 12,
                color:
                    isDarkMode ? const Color(0xFFA1A1AA) : const Color(0xFF6B7280),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  final String label;
  final String value;
  final bool isDarkMode;

  const _MetricTile({
    required this.label,
    required this.value,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF18181B) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isDarkMode ? const Color(0xFF3F3F46) : const Color(0xFFE5E7EB),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color:
                    isDarkMode ? const Color(0xFFE5E7EB) : const Color(0xFF000000),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                fontSize: 13,
                color:
                    isDarkMode ? const Color(0xFFF5F5F5) : const Color(0xFF000000),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeedbackCard extends StatelessWidget {
  final ReportSubmitState state;
  final bool isDarkMode;

  const _FeedbackCard({required this.state, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final feedbacks = state.feedbacks;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? const Color(0xFF3F3F46) : const Color(0xFFE5E7EB),
        ),
        color: isDarkMode ? const Color(0xFF18181B) : Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '피드백',
            style: TextStyle(
              fontSize: 15,
              color: isDarkMode ? Color(0xFFF5F5F5) : Color(0xFF000000),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          if (feedbacks.isEmpty)
            Text(
              state.submissionStatus == SubmissionStatus.submitting ||
                      state.submissionStatus == SubmissionStatus.queued ||
                      state.submissionStatus == SubmissionStatus.judging
                  ? '채점 진행 중입니다. 잠시만 기다려 주세요.'
                  : '아직 제출 기록이 없습니다. 제출 탭에서 코드를 제출해 주세요.',
              style: TextStyle(
                  fontSize: 13,
                  color: isDarkMode ? Color(0xFFE5E7EB) : Color(0xFF000000),
                  height: 1.6),
            ),
          if (feedbacks.isNotEmpty)
            ...feedbacks.map(
              (feedback) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 7),
                      child: Icon(
                        Icons.circle,
                        size: 6,
                        color: isDarkMode ? const Color(0xFFE5E7EB) : const Color(0xFF000000),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        feedback,
                        style: TextStyle(
                          fontSize: 13,
                          color: isDarkMode ? Color(0xFFE5E7EB) : Color(0xFF000000),
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SubmittedCodeCard extends StatelessWidget {
  final ReportSubmitState state;
  final bool isDarkMode;

  const _SubmittedCodeCard({required this.state, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? const Color(0xFF3F3F46) : const Color(0xFFE5E7EB),
        ),
        color: isDarkMode ? const Color(0xFF27272A) : const Color(0xFFF9FAFB),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '최근 제출 코드',
            style: TextStyle(
              fontSize: 15,
              color: isDarkMode ? const Color(0xFFF5F5F5) : const Color(0xFF000000),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF111827),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SelectableText(
              state.latestSubmittedCode,
              style: const TextStyle(
                color: Color(0xFFE5E7EB),
                fontSize: 12,
                height: 1.6,
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_StatusMeta _statusMeta(SubmissionStatus status) {
  return switch (status) {
    SubmissionStatus.notSubmitted => const _StatusMeta(
        label: '미제출',
        backgroundColor: Color(0xFFF3F4F6),
        textColor: Color(0xFF4B5563),
      ),
    SubmissionStatus.submitting => const _StatusMeta(
        label: '제출 중',
        backgroundColor: Color(0xFFDBEAFE),
        textColor: Color(0xFF1D4ED8),
      ),
    SubmissionStatus.queued => const _StatusMeta(
        label: '대기 중',
        backgroundColor: Color(0xFFE0E7FF),
        textColor: Color(0xFF4338CA),
      ),
    SubmissionStatus.judging => const _StatusMeta(
        label: '채점 중',
        backgroundColor: Color(0xFFFEF3C7),
        textColor: Color(0xFF92400E),
      ),
    SubmissionStatus.accepted => const _StatusMeta(
        label: '통과',
        backgroundColor: Color(0xFFDCFCE7),
        textColor: Color(0xFF166534),
      ),
    SubmissionStatus.failed => const _StatusMeta(
        label: '보완 필요',
        backgroundColor: Color(0xFFFEE2E2),
        textColor: Color(0xFF991B1B),
      ),
    SubmissionStatus.error => const _StatusMeta(
        label: '오류',
        backgroundColor: Color(0xFFFEE2E2),
        textColor: Color(0xFF991B1B),
      ),
  };
}

class _StatusMeta {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const _StatusMeta({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });
}

String _formatDateTime(DateTime? dateTime) {
  if (dateTime == null) return '-';
  final y = dateTime.year.toString().padLeft(4, '0');
  final m = dateTime.month.toString().padLeft(2, '0');
  final d = dateTime.day.toString().padLeft(2, '0');
  final h = dateTime.hour.toString().padLeft(2, '0');
  final min = dateTime.minute.toString().padLeft(2, '0');
  return '$y-$m-$d $h:$min';
}
