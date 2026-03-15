import 'package:a_and_i_report_web_server/src/feature/reports/data/entities/submission_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submission_result_response_dto.freezed.dart';

/// 제출 최종 결과 응답 DTO입니다.
@freezed
abstract class SubmissionResultResponseDto with _$SubmissionResultResponseDto {
  /// 제출 최종 결과 응답 DTO를 생성합니다.
  const factory SubmissionResultResponseDto({
    required String submissionId,
    required String status,
    @Default(<SubmissionTestCaseResult>[]) List<SubmissionTestCaseResult> testCases,
  }) = _SubmissionResultResponseDto;

  const SubmissionResultResponseDto._();

  /// JSON으로부터 DTO를 생성합니다.
  factory SubmissionResultResponseDto.fromJson(Map<String, dynamic> json) {
    return SubmissionResultResponseDto(
      submissionId: json['submissionId']?.toString() ?? '',
      status: json['status']?.toString() ?? 'UNKNOWN',
      testCases: _parseTestCases(json['testCases']),
    );
  }

  /// 엔티티로 변환합니다.
  SubmissionResult toEntity() {
    return SubmissionResult(
      submissionId: submissionId,
      status: status,
      testCases: testCases,
    );
  }
}

List<SubmissionTestCaseResult> _parseTestCases(Object? rawValue) {
  if (rawValue is! List) {
    return const <SubmissionTestCaseResult>[];
  }

  return rawValue
      .whereType<Map<String, dynamic>>()
      .map(SubmissionTestCaseResult.fromJson)
      .toList(growable: false);
}
