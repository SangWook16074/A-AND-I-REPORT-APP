// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_summary_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportSummaryResponseDto _$ReportSummaryResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _ReportSummaryResponseDto(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ReportSummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ReportSummary>[],
      error: json['error'] == null
          ? null
          : ReportSummaryApiErrorDto.fromJson(
              json['error'] as Map<String, dynamic>),
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$ReportSummaryResponseDtoToJson(
        _ReportSummaryResponseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
      'timestamp': instance.timestamp,
    };

_ReportSummaryApiErrorDto _$ReportSummaryApiErrorDtoFromJson(
        Map<String, dynamic> json) =>
    _ReportSummaryApiErrorDto(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ReportSummaryApiErrorDtoToJson(
        _ReportSummaryApiErrorDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
