import 'dart:async';

import 'package:a_and_i_report_web_server/src/feature/reports/data/entities/submission_result.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/providers/create_submission_usecase_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/providers/get_submission_result_usecase_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'report_submit_view_model.freezed.dart';

enum SubmitLanguage { kotlin, dart, python }

enum SubmissionStatus {
  notSubmitted,
  submitting,
  queued,
  judging,
  accepted,
  failed,
  error,
}

@freezed
abstract class ReportSubmitState with _$ReportSubmitState {
  const factory ReportSubmitState({
    required SubmitLanguage selectedLanguage,
    required Map<SubmitLanguage, String> draftCodeByLanguage,
    @Default(SubmissionStatus.notSubmitted) SubmissionStatus submissionStatus,
    @Default('') String latestSubmittedCode,
    SubmitLanguage? latestSubmittedLanguage,
    DateTime? submittedAt,
    @Default(0) int submitCount,
    @Default(0) int score,
    @Default(<String>[]) List<String> feedbacks,
    String? submissionId,
    String? streamUrl,
    String? latestVerdict,
    @Default(false) bool isSubmitting,
    @Default(false) bool isPolling,
    @Default('') String errorMsg,
  }) = _ReportSubmitState;

  factory ReportSubmitState.initial() {
    return ReportSubmitState(
      selectedLanguage: SubmitLanguage.python,
      draftCodeByLanguage: {
        SubmitLanguage.kotlin: SubmitLanguage.kotlin.template,
        SubmitLanguage.dart: SubmitLanguage.dart.template,
        SubmitLanguage.python: SubmitLanguage.python.template,
      },
    );
  }
}

class ReportSubmitViewModel extends StateNotifier<ReportSubmitState> {
  final String reportId;
  final Ref ref;
  Timer? _pollingTimer;

  ReportSubmitViewModel({
    required this.reportId,
    required this.ref,
  }) : super(ReportSubmitState.initial());

  void selectLanguage(SubmitLanguage language) {
    state = state.copyWith(selectedLanguage: language);
  }

  void updateDraft(SubmitLanguage language, String code) {
    state = state.copyWith(
      draftCodeByLanguage: {
        ...state.draftCodeByLanguage,
        language: code,
      },
    );
  }

  void loadTemplateForCurrentLanguage() {
    final lang = state.selectedLanguage;
    updateDraft(lang, lang.template);
  }

  Future<bool> submitCurrentDraft({String? problemId}) async {
    final lang = state.selectedLanguage;
    final code = (state.draftCodeByLanguage[lang] ?? '').trim();
    if (code.isEmpty) {
      return false;
    }

    // TODO(choseoungeun): assignment detail 응답에 problemId가 항상 내려오면 fallback을 제거합니다.
    final resolvedProblemId = problemId?.trim().isNotEmpty == true
        ? problemId!.trim()
        : 'quiz-101';

    state = state.copyWith(
      isSubmitting: true,
      errorMsg: '',
      latestSubmittedCode: code,
      latestSubmittedLanguage: lang,
      submittedAt: DateTime.now(),
      submitCount: state.submitCount + 1,
      submissionStatus: SubmissionStatus.submitting,
      feedbacks: const <String>['제출 요청을 전송하고 있습니다.'],
    );

    try {
      final response = await ref.read(createSubmissionUsecaseProvider).call(
            problemId: resolvedProblemId,
            language: lang.apiValue,
            code: code,
          );

      state = state.copyWith(
        isSubmitting: false,
        isPolling: true,
        submissionId: response.submissionId,
        streamUrl: response.streamUrl,
        submissionStatus: SubmissionStatus.queued,
        feedbacks: const <String>['채점 대기열에 등록되었습니다. 결과를 조회 중입니다.'],
      );

      _startPolling(response.submissionId);
      return true;
    } catch (error) {
      state = state.copyWith(
        isSubmitting: false,
        isPolling: false,
        submissionStatus: SubmissionStatus.error,
        errorMsg: error.toString().replaceFirst('Exception: ', ''),
        feedbacks: <String>[
          error.toString().replaceFirst('Exception: ', ''),
        ],
      );
      return false;
    }
  }

  void _startPolling(String submissionId) {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(const Duration(seconds: 2), (_) async {
      await refreshSubmissionResult(submissionId);
    });
  }

  Future<void> refreshSubmissionResult([String? submissionId]) async {
    final targetSubmissionId = submissionId ?? state.submissionId;
    if (targetSubmissionId == null || targetSubmissionId.isEmpty) {
      return;
    }

    try {
      final result =
          await ref.read(getSubmissionResultUsecaseProvider).call(targetSubmissionId);
      if (result == null) {
        state = state.copyWith(
          isPolling: true,
          submissionStatus: SubmissionStatus.judging,
          feedbacks: const <String>['채점이 진행 중입니다. 잠시만 기다려주세요.'],
        );
        return;
      }

      _applyResult(result);
    } catch (error) {
      _pollingTimer?.cancel();
      state = state.copyWith(
        isPolling: false,
        submissionStatus: SubmissionStatus.error,
        errorMsg: error.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  void _applyResult(SubmissionResult result) {
    final nextStatus = _mapSubmissionStatus(result.status);
    final passedCount =
        result.testCases.where((testCase) => testCase.status == 'ACCEPTED').length;
    final totalCount = result.testCases.length;
    final score = totalCount == 0 ? 0 : ((passedCount / totalCount) * 100).round();

    if (_isTerminal(nextStatus)) {
      _pollingTimer?.cancel();
    }

    state = state.copyWith(
      isPolling: !_isTerminal(nextStatus),
      submissionStatus: nextStatus,
      latestVerdict: result.status,
      score: score,
      feedbacks: _buildFeedbacks(result),
      errorMsg: '',
    );
  }

  SubmissionStatus _mapSubmissionStatus(String rawStatus) {
    final normalized = rawStatus.trim().toUpperCase();
    return switch (normalized) {
      'QUEUED' => SubmissionStatus.queued,
      'PENDING' => SubmissionStatus.queued,
      'RUNNING' => SubmissionStatus.judging,
      'JUDGING' => SubmissionStatus.judging,
      'ACCEPTED' => SubmissionStatus.accepted,
      'PASSED' => SubmissionStatus.accepted,
      'COMPILE_ERROR' => SubmissionStatus.failed,
      'WRONG_ANSWER' => SubmissionStatus.failed,
      'RUNTIME_ERROR' => SubmissionStatus.failed,
      'TIME_LIMIT_EXCEEDED' => SubmissionStatus.failed,
      'MEMORY_LIMIT_EXCEEDED' => SubmissionStatus.failed,
      _ => SubmissionStatus.failed,
    };
  }

  bool _isTerminal(SubmissionStatus status) {
    return switch (status) {
      SubmissionStatus.accepted ||
      SubmissionStatus.failed ||
      SubmissionStatus.error ||
      SubmissionStatus.notSubmitted => true,
      SubmissionStatus.submitting ||
      SubmissionStatus.queued ||
      SubmissionStatus.judging => false,
    };
  }

  List<String> _buildFeedbacks(SubmissionResult result) {
    if (result.testCases.isEmpty) {
      return <String>['채점 결과를 확인했습니다.'];
    }

    final feedbacks = <String>[];
    for (final testCase in result.testCases) {
      final status = testCase.status ?? 'UNKNOWN';
      if (status == 'ACCEPTED') {
        feedbacks.add(
          '${testCase.caseId ?? '-'}번 테스트 케이스를 통과했습니다.',
        );
        continue;
      }

      if ((testCase.error ?? '').isNotEmpty) {
        feedbacks.add(testCase.error!);
        continue;
      }

      if ((testCase.output ?? '').isNotEmpty) {
        feedbacks.add(
          '${testCase.caseId ?? '-'}번 테스트 케이스 출력: ${testCase.output}',
        );
        continue;
      }

      feedbacks.add('${testCase.caseId ?? '-'}번 테스트 케이스 결과: $status');
    }
    return feedbacks;
  }

  @override
  void dispose() {
    _pollingTimer?.cancel();
    super.dispose();
  }
}

final reportSubmitViewModelProvider =
    StateNotifierProvider.family<ReportSubmitViewModel, ReportSubmitState, String>(
  (ref, reportId) => ReportSubmitViewModel(
    reportId: reportId,
    ref: ref,
  ),
);

extension SubmitLanguageX on SubmitLanguage {
  String get label => switch (this) {
        SubmitLanguage.kotlin => 'Kotlin',
        SubmitLanguage.dart => 'Dart',
        SubmitLanguage.python => 'Python',
      };

  String get key => switch (this) {
        SubmitLanguage.kotlin => 'kotlin',
        SubmitLanguage.dart => 'dart',
        SubmitLanguage.python => 'python',
      };

  String get apiValue => switch (this) {
        SubmitLanguage.kotlin => 'KOTLIN',
        SubmitLanguage.dart => 'DART',
        SubmitLanguage.python => 'PYTHON',
      };

  String get template => switch (this) {
        SubmitLanguage.kotlin => '''
fun main() {
    val command = readln()
    println(command)
}''',
        SubmitLanguage.dart => '''
void main() {
    final command = 'ADD 1';
    print(command);
}''',
        SubmitLanguage.python => '''
def solution(a, b):
    return a + b''',
      };
}
