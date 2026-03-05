import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
sealed class Course with _$Course {
  const factory Course({
    required String id,
    required String slug,
    required String fieldTag,
    required String startDate,
    required String endDate,
    required CourseMetadata metadata,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,

    // 아래는 응답에 같이 오긴 하는데 값이 placeholder일 수 있어서 optional 처리
    String? title,
    String? description,
    String? phase,
    String? targetTrack,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}

@freezed
sealed class CourseMetadata with _$CourseMetadata {
  const factory CourseMetadata({
    required String title,
    required String description,
    required String phase,
    Map<String, dynamic>? attributes,
  }) = _CourseMetadata;

  factory CourseMetadata.fromJson(Map<String, dynamic> json) =>
      _$CourseMetadataFromJson(json);
}
