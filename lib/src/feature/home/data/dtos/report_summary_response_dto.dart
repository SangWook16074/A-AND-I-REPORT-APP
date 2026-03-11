import 'package:a_and_i_report_web_server/src/feature/home/data/entities/level.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/entities/report_summary.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/entities/report_type.dart';

/// 주차 목록 API 응답 DTO입니다.
class WeekListResponseDto {
  /// 주차 목록 API 응답 DTO를 생성합니다.
  const WeekListResponseDto({
    required this.success,
    required this.data,
    this.error,
    this.timestamp,
  });

  /// 요청 성공 여부입니다.
  final bool success;

  /// 주차 목록입니다.
  final List<CourseWeekDto> data;

  /// 에러 정보입니다.
  final ReportSummaryApiErrorDto? error;

  /// 응답 시각입니다.
  final String? timestamp;

  /// JSON 응답을 DTO로 변환합니다.
  factory WeekListResponseDto.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];

    return WeekListResponseDto(
      success: json['success'] == true,
      data: rawData is List
          ? rawData
                .whereType<Map<String, dynamic>>()
                .map(CourseWeekDto.fromJson)
                .toList(growable: false)
          : const <CourseWeekDto>[],
      error: _parseError(json['error']),
      timestamp: json['timestamp'] as String?,
    );
  }
}

/// 주차 정보 DTO입니다.
class CourseWeekDto {
  /// 주차 정보 DTO를 생성합니다.
  const CourseWeekDto({
    required this.id,
    required this.weekNo,
    required this.title,
    required this.startDate,
    required this.endDate,
  });

  /// 주차 ID입니다.
  final String id;

  /// 주차 번호입니다.
  final int weekNo;

  /// 주차 제목입니다.
  final String title;

  /// 시작일입니다.
  final DateTime? startDate;

  /// 종료일입니다.
  final DateTime? endDate;

  /// JSON 응답을 DTO로 변환합니다.
  factory CourseWeekDto.fromJson(Map<String, dynamic> json) {
    return CourseWeekDto(
      id: json['id']?.toString() ?? '',
      weekNo: _asInt(json['weekNo']) ?? 0,
      title: json['title']?.toString() ?? '',
      startDate: _parseDateTime(json['startDate']),
      endDate: _parseDateTime(json['endDate']),
    );
  }
}

/// 주차별 과제 목록 API 응답 DTO입니다.
class ReportSummaryResponseDto {
  /// 주차별 과제 목록 API 응답 DTO를 생성합니다.
  const ReportSummaryResponseDto({
    required this.success,
    required this.data,
    this.error,
    this.timestamp,
  });

  /// 요청 성공 여부입니다.
  final bool success;

  /// 파싱된 과제 목록입니다.
  final List<ReportSummary> data;

  /// 에러 정보입니다.
  final ReportSummaryApiErrorDto? error;

  /// 응답 시각입니다.
  final String? timestamp;

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
      error: _parseError(json['error']),
      timestamp: json['timestamp'] as String?,
    );
  }

  static ReportSummary? _toSummary(Map<String, dynamic> json) {
    final metadata = json['metadata'];
    final attributes = metadata is Map<String, dynamic>
        ? metadata['attributes']
        : null;

    final id = json['id']?.toString();
    final week = _asInt(json['weekNo']);
    final seq = _asInt(json['orderInWeek']) ?? 0;
    final title = metadata is Map<String, dynamic>
        ? metadata['title']?.toString()
        : null;
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

ReportSummaryApiErrorDto? _parseError(Object? rawError) {
  if (rawError is! Map<String, dynamic>) {
    return null;
  }

  return ReportSummaryApiErrorDto(
    code: rawError['code']?.toString(),
    message: rawError['message']?.toString(),
  );
}

/// 과제 목록 API 에러 DTO입니다.
class ReportSummaryApiErrorDto {
  /// 과제 목록 API 에러 DTO를 생성합니다.
  const ReportSummaryApiErrorDto({
    this.code,
    this.message,
  });

  /// 에러 코드입니다.
  final String? code;

  /// 에러 메시지입니다.
  final String? message;
}
