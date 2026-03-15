// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubmissionRequestDto _$SubmissionRequestDtoFromJson(
        Map<String, dynamic> json) =>
    _SubmissionRequestDto(
      problemId: json['problemId'] as String,
      language: json['language'] as String,
      code: json['code'] as String,
      options: SubmissionOptionsDto.fromJson(
          json['options'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubmissionRequestDtoToJson(
        _SubmissionRequestDto instance) =>
    <String, dynamic>{
      'problemId': instance.problemId,
      'language': instance.language,
      'code': instance.code,
      'options': instance.options,
    };

_SubmissionOptionsDto _$SubmissionOptionsDtoFromJson(
        Map<String, dynamic> json) =>
    _SubmissionOptionsDto(
      realtimeFeedback: json['realtimeFeedback'] as bool,
    );

Map<String, dynamic> _$SubmissionOptionsDtoToJson(
        _SubmissionOptionsDto instance) =>
    <String, dynamic>{
      'realtimeFeedback': instance.realtimeFeedback,
    };
