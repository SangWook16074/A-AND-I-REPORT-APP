import 'package:freezed_annotation/freezed_annotation.dart';

part 'submission_response_dto.freezed.dart';
part 'submission_response_dto.g.dart';

/// 제출 접수 응답 DTO입니다.
@freezed
abstract class SubmissionResponseDto with _$SubmissionResponseDto {
  /// 제출 접수 응답 DTO를 생성합니다.
  const factory SubmissionResponseDto({
    required String submissionId,
    required String streamUrl,
  }) = _SubmissionResponseDto;

  /// JSON으로부터 DTO를 생성합니다.
  factory SubmissionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SubmissionResponseDtoFromJson(json);
}
