// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubmissionResult _$SubmissionResultFromJson(Map<String, dynamic> json) =>
    _SubmissionResult(
      submissionId: json['submissionId'] as String,
      status: json['status'] as String,
      testCases: (json['testCases'] as List<dynamic>?)
              ?.map((e) =>
                  SubmissionTestCaseResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SubmissionTestCaseResult>[],
    );

Map<String, dynamic> _$SubmissionResultToJson(_SubmissionResult instance) =>
    <String, dynamic>{
      'submissionId': instance.submissionId,
      'status': instance.status,
      'testCases': instance.testCases,
    };

_SubmissionTestCaseResult _$SubmissionTestCaseResultFromJson(
        Map<String, dynamic> json) =>
    _SubmissionTestCaseResult(
      caseId: (json['caseId'] as num?)?.toInt(),
      status: json['status'] as String?,
      timeMs: (json['timeMs'] as num?)?.toInt(),
      memoryMb: (json['memoryMb'] as num?)?.toDouble(),
      output: json['output'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$SubmissionTestCaseResultToJson(
        _SubmissionTestCaseResult instance) =>
    <String, dynamic>{
      'caseId': instance.caseId,
      'status': instance.status,
      'timeMs': instance.timeMs,
      'memoryMb': instance.memoryMb,
      'output': instance.output,
      'error': instance.error,
    };
