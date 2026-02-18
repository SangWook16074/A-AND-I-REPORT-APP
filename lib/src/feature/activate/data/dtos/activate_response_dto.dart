import 'package:freezed_annotation/freezed_annotation.dart';

part 'activate_response_dto.freezed.dart';
part 'activate_response_dto.g.dart';

/// 계정 활성화 API 응답 DTO입니다.
@freezed
abstract class ActivateResponseDto with _$ActivateResponseDto {
  const factory ActivateResponseDto({
    /// API 호출 성공 여부
    required bool success,

    /// 내부 data.success 값
    ActivateResponseDataDto? data,
    ActivateErrorDto? error,
    String? timestamp,
  }) = _ActivateResponseDto;

  factory ActivateResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ActivateResponseDtoFromJson(json);
}

/// 계정 활성화 API의 data 필드 DTO입니다.
@freezed
abstract class ActivateResponseDataDto with _$ActivateResponseDataDto {
  const factory ActivateResponseDataDto({
    @Default(false) bool success,
  }) = _ActivateResponseDataDto;

  factory ActivateResponseDataDto.fromJson(Map<String, dynamic> json) =>
      _$ActivateResponseDataDtoFromJson(json);
}

/// 계정 활성화 공통 API 에러 DTO입니다.
@freezed
abstract class ActivateErrorDto with _$ActivateErrorDto {
  const factory ActivateErrorDto({
    String? code,
    String? message,
  }) = _ActivateErrorDto;

  factory ActivateErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ActivateErrorDtoFromJson(json);
}
