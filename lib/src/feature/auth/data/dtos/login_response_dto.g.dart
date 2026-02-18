// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponseDto _$LoginResponseDtoFromJson(Map<String, dynamic> json) =>
    _LoginResponseDto(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : LoginDataDto.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : ApiErrorDto.fromJson(json['error'] as Map<String, dynamic>),
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$LoginResponseDtoToJson(_LoginResponseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
      'timestamp': instance.timestamp,
    };

_LoginDataDto _$LoginDataDtoFromJson(Map<String, dynamic> json) =>
    _LoginDataDto(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: (json['expiresIn'] as num).toInt(),
      tokenType: json['tokenType'] as String,
      forcePasswordChange: json['forcePasswordChange'] as bool,
      user: LoginUserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginDataDtoToJson(_LoginDataDto instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
      'tokenType': instance.tokenType,
      'forcePasswordChange': instance.forcePasswordChange,
      'user': instance.user,
    };

_LoginUserDto _$LoginUserDtoFromJson(Map<String, dynamic> json) =>
    _LoginUserDto(
      id: json['id'] as String,
      username: json['username'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$LoginUserDtoToJson(_LoginUserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'role': instance.role,
    };

_ApiErrorDto _$ApiErrorDtoFromJson(Map<String, dynamic> json) => _ApiErrorDto(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ApiErrorDtoToJson(_ApiErrorDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
