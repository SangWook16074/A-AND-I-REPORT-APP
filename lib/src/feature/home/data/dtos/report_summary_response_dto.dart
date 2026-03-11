import 'package:a_and_i_report_web_server/src/feature/home/data/entities/level.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/entities/report_summary.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/entities/report_type.dart';

/// 과제 목록 API 응답 DTO입니다.
class ReportSummaryResponseDto {
  /// 과제 목록 API 응답 DTO를 생성합니다.
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
      data: _parseSummaries(rawData),
      error: _parseError(json['error']),
      timestamp: json['timestamp'] as String?,
    );
  }

  static List<ReportSummary> _parseSummaries(Object? rawData) {
    if (rawData is! List) {
      return const <ReportSummary>[];
    }

    final summaries = <ReportSummary>[];

    for (final item in rawData) {
      if (item is! Map<String, dynamic>) {
        continue;
      }

      final weekSummary = _toWeekSummary(item);
      if (weekSummary != null) {
        summaries.add(weekSummary);
        continue;
      }

      // flat 목록 응답
      if (_looksLikeSummary(item)) {
        final summary = _toSummary(item);
        if (summary != null) {
          summaries.add(summary);
        }
        continue;
      }

      // week 그룹 응답
      final week = _asInt(item['week']) ?? _asInt(item['weekNumber']);
      final nestedReports = _extractNestedReports(item);
      for (final nested in nestedReports) {
        final merged = <String, dynamic>{
          ...nested,
          if (!nested.containsKey('week') && week != null) 'week': week,
        };
        final summary = _toSummary(merged);
        if (summary != null) {
          summaries.add(summary);
        }
      }
    }

    return summaries;
  }

  static ReportSummary? _toWeekSummary(Map<String, dynamic> json) {
    final id = json['id']?.toString();
    final week = _asInt(json['week']) ??
        _asInt(json['weekNo']) ??
        _asInt(json['weekNumber']);
    final title = json['title']?.toString();
    final endAt = _parseDateTimeFromDateOnly(json['endDate']);

    if (id == null || week == null || title == null || endAt == null) {
      return null;
    }

    final inferredType = _inferReportType(title);

    return ReportSummary(
      id: id,
      week: week,
      seq: 1,
      title: title,
      level: Level.LOW,
      reportType: inferredType,
      endAt: endAt,
    );
  }

  static bool _looksLikeSummary(Map<String, dynamic> json) {
    return json.containsKey('title') ||
        json.containsKey('reportType') ||
        json.containsKey('endAt') ||
        json.containsKey('deadline');
  }

  static List<Map<String, dynamic>> _extractNestedReports(
    Map<String, dynamic> json,
  ) {
    const nestedKeys = <String>[
      'reports',
      'reportSummaries',
      'items',
      'missions',
      'assignments',
    ];

    for (final key in nestedKeys) {
      final value = json[key];
      if (value is List) {
        return value.whereType<Map<String, dynamic>>().toList(growable: false);
      }
    }

    return const <Map<String, dynamic>>[];
  }

  static ReportSummary? _toSummary(Map<String, dynamic> json) {
    final id = (json['id'] ?? json['reportId'])?.toString();
    final week = _asInt(json['week']) ?? _asInt(json['weekNumber']);
    final seq = _asInt(json['seq']) ?? _asInt(json['order']) ?? 0;
    final title = (json['title'] ?? json['name'])?.toString();
    final level = _parseLevel(json['level']);
    final reportType = _parseReportType(json['reportType']);
    final endAt = _parseDateTime(json['endAt'] ?? json['deadline']);

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

  static int? _asInt(Object? value) {
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

  static DateTime? _parseDateTime(Object? value) {
    if (value is String && value.isNotEmpty) {
      return DateTime.tryParse(value);
    }
    return null;
  }

  static DateTime? _parseDateTimeFromDateOnly(Object? value) {
    if (value is! String || value.isEmpty) {
      return null;
    }

    final parsed = DateTime.tryParse(value);
    if (parsed == null) {
      return null;
    }

    return DateTime(parsed.year, parsed.month, parsed.day, 23, 59, 59);
  }

  static Level? _parseLevel(Object? value) {
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

  static ReportType? _parseReportType(Object? value) {
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

  static ReportType _inferReportType(String title) {
    final normalized = title.toLowerCase();
    if (normalized.contains('cs')) {
      return ReportType.CS;
    }

    return ReportType.BASIC;
  }

  static ReportSummaryApiErrorDto? _parseError(Object? rawError) {
    if (rawError is! Map<String, dynamic>) {
      return null;
    }

    return ReportSummaryApiErrorDto(
      code: rawError['code']?.toString(),
      message: rawError['message']?.toString(),
    );
  }
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
