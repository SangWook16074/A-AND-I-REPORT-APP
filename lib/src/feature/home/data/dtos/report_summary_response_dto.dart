import 'package:a_and_i_report_web_server/src/feature/home/data/entities/report_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_summary_response_dto.freezed.dart';
part 'report_summary_response_dto.g.dart';

/// 과제 목록 API 응답 DTO입니다.
@freezed
abstract class ReportSummaryResponseDto with _$ReportSummaryResponseDto {
  const factory ReportSummaryResponseDto({
    required bool success,
    @Default(<ReportSummary>[]) List<ReportSummary> data,
    ReportSummaryApiErrorDto? error,
    String? timestamp,
  }) = _ReportSummaryResponseDto;

  factory ReportSummaryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ReportSummaryResponseDtoFromJson(json);
}

/// 과제 목록 API 에러 DTO입니다.
@freezed
abstract class ReportSummaryApiErrorDto with _$ReportSummaryApiErrorDto {
  const factory ReportSummaryApiErrorDto({
    String? code,
    String? message,
  }) = _ReportSummaryApiErrorDto;

  factory ReportSummaryApiErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ReportSummaryApiErrorDtoFromJson(json);
}
