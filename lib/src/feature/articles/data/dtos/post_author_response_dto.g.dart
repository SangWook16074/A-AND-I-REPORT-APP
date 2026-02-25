// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_author_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostAuthorResponseDto _$PostAuthorResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _PostAuthorResponseDto(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      profileImage: _readProfileImage(json, 'profileImage') as String?,
    );

Map<String, dynamic> _$PostAuthorResponseDtoToJson(
        _PostAuthorResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'profileImage': instance.profileImage,
    };
