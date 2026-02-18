// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activate_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActivateResponseDto _$ActivateResponseDtoFromJson(Map<String, dynamic> json) =>
    _ActivateResponseDto(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : ActivateResponseDataDto.fromJson(
              json['data'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : ActivateErrorDto.fromJson(json['error'] as Map<String, dynamic>),
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$ActivateResponseDtoToJson(
        _ActivateResponseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
      'timestamp': instance.timestamp,
    };

_ActivateResponseDataDto _$ActivateResponseDataDtoFromJson(
        Map<String, dynamic> json) =>
    _ActivateResponseDataDto(
      success: json['success'] as bool? ?? false,
    );

Map<String, dynamic> _$ActivateResponseDataDtoToJson(
        _ActivateResponseDataDto instance) =>
    <String, dynamic>{
      'success': instance.success,
    };

_ActivateErrorDto _$ActivateErrorDtoFromJson(Map<String, dynamic> json) =>
    _ActivateErrorDto(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ActivateErrorDtoToJson(_ActivateErrorDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
