import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
sealed class Course with _$Course {
  const factory Course({
    required String id,
    required String title,
    required String slug,
    required String description,
    required String phase,
    required String targetTrack,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}
