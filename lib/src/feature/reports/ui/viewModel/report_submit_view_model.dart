import 'package:hooks_riverpod/hooks_riverpod.dart';

enum SubmitLanguage { kotlin, dart, python }

enum SubmissionStatus { notSubmitted, passed, failed }

class ReportSubmitState {
  final SubmitLanguage selectedLanguage;
  final Map<SubmitLanguage, String> draftCodeByLanguage;
  final SubmissionStatus submissionStatus;
  final String latestSubmittedCode;
  final SubmitLanguage? latestSubmittedLanguage;
  final DateTime? submittedAt;
  final int submitCount;
  final int score;
  final List<String> feedbacks;

  const ReportSubmitState({
    required this.selectedLanguage,
    required this.draftCodeByLanguage,
    required this.submissionStatus,
    required this.latestSubmittedCode,
    required this.latestSubmittedLanguage,
    required this.submittedAt,
    required this.submitCount,
    required this.score,
    required this.feedbacks,
  });

  factory ReportSubmitState.initial() {
    return ReportSubmitState(
      selectedLanguage: SubmitLanguage.kotlin,
      draftCodeByLanguage: {
        SubmitLanguage.kotlin: SubmitLanguage.kotlin.template,
        SubmitLanguage.dart: SubmitLanguage.dart.template,
        SubmitLanguage.python: SubmitLanguage.python.template,
      },
      submissionStatus: SubmissionStatus.notSubmitted,
      latestSubmittedCode: '',
      latestSubmittedLanguage: null,
      submittedAt: null,
      submitCount: 0,
      score: 0,
      feedbacks: const [],
    );
  }

  ReportSubmitState copyWith({
    SubmitLanguage? selectedLanguage,
    Map<SubmitLanguage, String>? draftCodeByLanguage,
    SubmissionStatus? submissionStatus,
    String? latestSubmittedCode,
    SubmitLanguage? latestSubmittedLanguage,
    DateTime? submittedAt,
    int? submitCount,
    int? score,
    List<String>? feedbacks,
  }) {
    return ReportSubmitState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      draftCodeByLanguage: draftCodeByLanguage ?? this.draftCodeByLanguage,
      submissionStatus: submissionStatus ?? this.submissionStatus,
      latestSubmittedCode: latestSubmittedCode ?? this.latestSubmittedCode,
      latestSubmittedLanguage:
          latestSubmittedLanguage ?? this.latestSubmittedLanguage,
      submittedAt: submittedAt ?? this.submittedAt,
      submitCount: submitCount ?? this.submitCount,
      score: score ?? this.score,
      feedbacks: feedbacks ?? this.feedbacks,
    );
  }
}

class ReportSubmitViewModel extends StateNotifier<ReportSubmitState> {
  final String reportId;

  ReportSubmitViewModel(this.reportId) : super(ReportSubmitState.initial());

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

  bool submitCurrentDraft() {
    final lang = state.selectedLanguage;
    final code = (state.draftCodeByLanguage[lang] ?? '').trim();
    if (code.isEmpty) {
      return false;
    }

    final passed = _isPassed(lang, code);
    state = state.copyWith(
      latestSubmittedCode: code,
      latestSubmittedLanguage: lang,
      submittedAt: DateTime.now(),
      submitCount: state.submitCount + 1,
      submissionStatus:
          passed ? SubmissionStatus.passed : SubmissionStatus.failed,
      score: passed ? 92 : 58,
      feedbacks: _buildFeedbacks(lang: lang, code: code, passed: passed),
    );
    return true;
  }

  bool _isPassed(SubmitLanguage language, String code) {
    return switch (language) {
      SubmitLanguage.kotlin =>
        code.contains('fun main') && code.contains('println'),
      SubmitLanguage.dart =>
        code.contains('void main') && code.contains('print'),
      SubmitLanguage.python =>
        code.contains('def main') && code.contains('print('),
    };
  }

  List<String> _buildFeedbacks({
    required SubmitLanguage lang,
    required String code,
    required bool passed,
  }) {
    final hasInput = code.contains('readln') ||
        code.contains('stdin') ||
        code.contains('input(');
    final hasCondition = code.contains('if') || code.contains('when');

    if (passed) {
      return [
        '${lang.label} 기본 실행 구조가 확인되었습니다.',
        hasInput ? '입력 처리 코드가 포함되어 있습니다.' : '입력 처리 케이스를 추가하면 더 좋습니다.',
        hasCondition ? '조건 분기 로직이 포함되어 있습니다.' : '예외 입력 분기 처리를 보강해 보세요.',
      ];
    }

    return [
      '${lang.label} 필수 실행 진입점(main) 또는 출력 로직이 부족합니다.',
      '최소 실행 가능한 코드 형태로 제출해 주세요.',
      '템플릿을 불러온 뒤 핵심 로직을 추가하는 방식이 안전합니다.',
    ];
  }
}

final reportSubmitViewModelProvider = StateNotifierProvider.family<
    ReportSubmitViewModel, ReportSubmitState, String>(
  (ref, reportId) => ReportSubmitViewModel(reportId),
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
def main():
    command = input().strip()
    print(command)

if __name__ == "__main__":
    main()''',
      };
}
