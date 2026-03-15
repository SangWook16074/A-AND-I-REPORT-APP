import 'package:freezed_annotation/freezed_annotation.dart';

part 'submission_request_dto.freezed.dart';
part 'submission_request_dto.g.dart';

/// 제출 생성 요청 DTO입니다.
@freezed
abstract class SubmissionRequestDto with _$SubmissionRequestDto {
  /// 제출 생성 요청 DTO를 생성합니다.
  const factory SubmissionRequestDto({
    required String problemId,
    required String language,
    required String code,
    required SubmissionOptionsDto options,
  }) = _SubmissionRequestDto;

  /// JSON으로부터 DTO를 생성합니다.
  factory SubmissionRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SubmissionRequestDtoFromJson(json);

  /// DTO를 JSON으로 변환합니다.
  @override
  Map<String, dynamic> toJson();
}

/// 제출 옵션 DTO입니다.
@freezed
abstract class SubmissionOptionsDto with _$SubmissionOptionsDto {
  /// 제출 옵션 DTO를 생성합니다.
  const factory SubmissionOptionsDto({
    required bool realtimeFeedback,
  }) = _SubmissionOptionsDto;

  /// JSON으로부터 DTO를 생성합니다.
  factory SubmissionOptionsDto.fromJson(Map<String, dynamic> json) =>
      _$SubmissionOptionsDtoFromJson(json);

  /// DTO를 JSON으로 변환합니다.
  @override
  Map<String, dynamic> toJson();
}
