// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_detail_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportDetailResponseDto _$ReportDetailResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _ReportDetailResponseDto(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : Report.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : ReportDetailApiErrorDto.fromJson(
              json['error'] as Map<String, dynamic>),
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$ReportDetailResponseDtoToJson(
        _ReportDetailResponseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
      'timestamp': instance.timestamp,
    };

_ReportDetailApiErrorDto _$ReportDetailApiErrorDtoFromJson(
        Map<String, dynamic> json) =>
    _ReportDetailApiErrorDto(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ReportDetailApiErrorDtoToJson(
        _ReportDetailApiErrorDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
