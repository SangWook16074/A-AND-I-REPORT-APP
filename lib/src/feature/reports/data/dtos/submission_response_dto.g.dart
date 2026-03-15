// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubmissionResponseDto _$SubmissionResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _SubmissionResponseDto(
      submissionId: json['submissionId'] as String,
      streamUrl: json['streamUrl'] as String,
    );

Map<String, dynamic> _$SubmissionResponseDtoToJson(
        _SubmissionResponseDto instance) =>
    <String, dynamic>{
      'submissionId': instance.submissionId,
      'streamUrl': instance.streamUrl,
    };
