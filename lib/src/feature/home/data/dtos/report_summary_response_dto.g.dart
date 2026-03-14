// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_summary_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeekListResponseDto _$WeekListResponseDtoFromJson(Map<String, dynamic> json) =>
    _WeekListResponseDto(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => CourseWeekDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] == null
          ? null
          : ErrorData.fromJson(json['error'] as Map<String, dynamic>),
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$WeekListResponseDtoToJson(
        _WeekListResponseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
      'timestamp': instance.timestamp,
    };

_CourseWeekDto _$CourseWeekDtoFromJson(Map<String, dynamic> json) =>
    _CourseWeekDto(
      id: json['id'] as String,
      weekNo: (json['weekNo'] as num).toInt(),
      title: json['title'] as String,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$CourseWeekDtoToJson(_CourseWeekDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weekNo': instance.weekNo,
      'title': instance.title,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
    };

_ErrorData _$ErrorDataFromJson(Map<String, dynamic> json) => _ErrorData(
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorDataToJson(_ErrorData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
