// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activate_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActivateRequestDto _$ActivateRequestDtoFromJson(Map<String, dynamic> json) =>
    _ActivateRequestDto(
      token: json['token'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$ActivateRequestDtoToJson(_ActivateRequestDto instance) =>
    <String, dynamic>{
      'token': instance.token,
      'password': instance.password,
    };
