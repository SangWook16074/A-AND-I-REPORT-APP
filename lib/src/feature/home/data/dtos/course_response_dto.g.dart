// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CourseListResponseDto _$CourseListResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _CourseListResponseDto(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Course>[],
      error: json['error'] == null
          ? null
          : CourseApiErrorDto.fromJson(json['error'] as Map<String, dynamic>),
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$CourseListResponseDtoToJson(
        _CourseListResponseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
      'timestamp': instance.timestamp,
    };

_CourseDetailResponseDto _$CourseDetailResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _CourseDetailResponseDto(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : Course.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : CourseApiErrorDto.fromJson(json['error'] as Map<String, dynamic>),
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$CourseDetailResponseDtoToJson(
        _CourseDetailResponseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
      'timestamp': instance.timestamp,
    };

_CourseApiErrorDto _$CourseApiErrorDtoFromJson(Map<String, dynamic> json) =>
    _CourseApiErrorDto(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CourseApiErrorDtoToJson(_CourseApiErrorDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
