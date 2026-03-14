import 'package:a_and_i_report_web_server/src/feature/home/data/entities/level.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/entities/report_summary.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/entities/report_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_summary_response_dto.freezed.dart';
part 'report_summary_response_dto.g.dart';

/// 주차 목록 API 응답 DTO입니다.
@freezed
abstract class WeekListResponseDto with _$WeekListResponseDto {
  /// 주차 목록 API 응답 DTO를 생성합니다.
  const factory WeekListResponseDto({
    required bool success,
    required List<CourseWeekDto> data,
    ErrorData? error,
    String? timestamp,
  }) = _WeekListResponseDto;

  factory WeekListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$WeekListResponseDtoFromJson(json);
}

/// 주차 정보 DTO입니다.
@freezed
abstract class CourseWeekDto with _$CourseWeekDto {
  /// 주차 정보 DTO를 생성합니다.
  const factory CourseWeekDto({
    required String id,
    required int weekNo,
    required String title,
    required DateTime? startDate,
    required DateTime? endDate,
  }) = _CourseWeekDto;

  /// JSON 응답을 DTO로 변환합니다.
  factory CourseWeekDto.fromJson(Map<String, dynamic> json) =>
      _$CourseWeekDtoFromJson(json);
}

/// 주차별 과제 목록 API 응답 DTO입니다.
@freezed
abstract class ReportSummaryResponseDto with _$ReportSummaryResponseDto {
  /// 주차별 과제 목록 API 응답 DTO를 생성합니다.
  const factory ReportSummaryResponseDto({
    required bool success,
    required List<ReportSummary> data,
    ErrorData? error,
    String? timestamp,
  }) = _ReportSummaryResponseDto;

  const ReportSummaryResponseDto._();

  /// JSON 응답을 DTO로 변환합니다.
  factory ReportSummaryResponseDto.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];

    return ReportSummaryResponseDto(
      success: json['success'] == true,
      data: rawData is List
          ? rawData
              .whereType<Map<String, dynamic>>()
              .map(_toSummary)
              .whereType<ReportSummary>()
              .toList(growable: false)
          : const <ReportSummary>[],
      error: json['error'] is Map<String, dynamic>
          ? ErrorData.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      timestamp: json['timestamp']?.toString(),
    );
  }

  static ReportSummary? _toSummary(Map<String, dynamic> json) {
    final metadata = json['metadata'];
    final attributes =
        metadata is Map<String, dynamic> ? metadata['attributes'] : null;

    final id = json['id']?.toString();
    final week = _asInt(json['weekNo']);
    final seq = _asInt(json['orderInWeek']) ?? 0;
    final title =
        metadata is Map<String, dynamic> ? metadata['title']?.toString() : null;
    final level = _parseLevel(
      metadata is Map<String, dynamic> ? metadata['difficulty'] : null,
    );
    final reportType = _parseReportType(
      attributes is Map<String, dynamic> ? attributes['reportType'] : null,
    );
    final endAt = _parseDateTime(json['endAt']);

    if (id == null ||
        week == null ||
        title == null ||
        level == null ||
        reportType == null ||
        endAt == null) {
      return null;
    }

    return ReportSummary(
      id: id,
      week: week,
      seq: seq,
      title: title,
      level: level,
      reportType: reportType,
      endAt: endAt,
    );
  }
}

int? _asInt(Object? value) {
  if (value is int) {
    return value;
  }
  if (value is num) {
    return value.toInt();
  }
  if (value is String) {
    return int.tryParse(value);
  }
  return null;
}

DateTime? _parseDateTime(Object? value) {
  if (value is String && value.isNotEmpty) {
    return DateTime.tryParse(value);
  }
  return null;
}

Level? _parseLevel(Object? value) {
  final normalized = value?.toString().trim().toUpperCase();
  if (normalized == null || normalized.isEmpty) {
    return null;
  }

  return switch (normalized) {
    'VERYHIGH' => Level.VERYHIGH,
    'HIGH' => Level.HIGH,
    'MEDIUM' => Level.MEDIUM,
    'LOW' => Level.LOW,
    _ => null,
  };
}

ReportType? _parseReportType(Object? value) {
  final normalized = value?.toString().trim().toUpperCase();
  if (normalized == null || normalized.isEmpty) {
    return null;
  }

  return switch (normalized) {
    'CS' => ReportType.CS,
    'BASIC' => ReportType.BASIC,
    _ => null,
  };
}

typedef JsonMap = Map<String, dynamic>;

@freezed
abstract class ErrorData with _$ErrorData {
  const factory ErrorData({
    required String code,
    required String message,
  }) = _ErrorData;

  factory ErrorData.fromJson(JsonMap json) => _$ErrorDataFromJson(json);
}
