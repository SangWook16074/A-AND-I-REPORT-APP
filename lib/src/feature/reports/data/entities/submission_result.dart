import 'package:freezed_annotation/freezed_annotation.dart';

part 'submission_result.freezed.dart';
part 'submission_result.g.dart';

/// 제출 채점 결과 엔티티입니다.
@freezed
sealed class SubmissionResult with _$SubmissionResult {
  const factory SubmissionResult({
    required String submissionId,
    required String status,
    @Default(<SubmissionTestCaseResult>[]) List<SubmissionTestCaseResult> testCases,
  }) = _SubmissionResult;

  factory SubmissionResult.fromJson(Map<String, dynamic> json) =>
      _$SubmissionResultFromJson(json);
}

/// 테스트 케이스별 채점 결과 엔티티입니다.
@freezed
sealed class SubmissionTestCaseResult with _$SubmissionTestCaseResult {
  const factory SubmissionTestCaseResult({
    int? caseId,
    String? status,
    int? timeMs,
    double? memoryMb,
    String? output,
    String? error,
  }) = _SubmissionTestCaseResult;

  factory SubmissionTestCaseResult.fromJson(Map<String, dynamic> json) =>
      _$SubmissionTestCaseResultFromJson(json);
}
