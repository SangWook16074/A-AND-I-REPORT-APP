import 'package:a_and_i_report_web_server/src/feature/reports/data/entities/report.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_detail_response_dto.freezed.dart';
part 'report_detail_response_dto.g.dart';

/// 과제 상세 API 응답 DTO입니다.
@freezed
abstract class ReportDetailResponseDto with _$ReportDetailResponseDto {
  const factory ReportDetailResponseDto({
    required bool success,
    Report? data,
    ReportDetailApiErrorDto? error,
    String? timestamp,
  }) = _ReportDetailResponseDto;

  factory ReportDetailResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ReportDetailResponseDtoFromJson(json);
}

/// 과제 상세 API 에러 DTO입니다.
@freezed
abstract class ReportDetailApiErrorDto with _$ReportDetailApiErrorDto {
  const factory ReportDetailApiErrorDto({
    String? code,
    String? message,
  }) = _ReportDetailApiErrorDto;

  factory ReportDetailApiErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ReportDetailApiErrorDtoFromJson(json);
}
