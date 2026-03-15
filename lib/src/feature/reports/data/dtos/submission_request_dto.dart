import 'package:freezed_annotation/freezed_annotation.dart';

part 'submission_request_dto.freezed.dart';

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
}

/// 제출 옵션 DTO입니다.
@freezed
abstract class SubmissionOptionsDto with _$SubmissionOptionsDto {
  /// 제출 옵션 DTO를 생성합니다.
  const factory SubmissionOptionsDto({
    required bool realtimeFeedback,
  }) = _SubmissionOptionsDto;
}

/// 제출 요청 DTO 직렬화 확장입니다.
extension SubmissionRequestDtoX on SubmissionRequestDto {
  /// DTO를 JSON으로 변환합니다.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'problemId': problemId,
        'language': language,
        'code': code,
        'options': options.toJson(),
      };
}

/// 제출 옵션 DTO 직렬화 확장입니다.
extension SubmissionOptionsDtoX on SubmissionOptionsDto {
  /// DTO를 JSON으로 변환합니다.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'realtimeFeedback': realtimeFeedback,
      };
}
