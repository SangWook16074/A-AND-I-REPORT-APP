import 'package:a_and_i_report_web_server/src/feature/home/data/entities/course.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_response_dto.freezed.dart';
part 'course_response_dto.g.dart';

@freezed
abstract class CourseListResponseDto with _$CourseListResponseDto {
  const factory CourseListResponseDto({
    required bool success,
    @Default(<Course>[]) List<Course> data,
    CourseApiErrorDto? error,
    String? timestamp,
  }) = _CourseListResponseDto;

  factory CourseListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CourseListResponseDtoFromJson(json);
}

@freezed
abstract class CourseDetailResponseDto with _$CourseDetailResponseDto {
  const factory CourseDetailResponseDto({
    required bool success,
    Course? data,
    CourseApiErrorDto? error,
    String? timestamp,
  }) = _CourseDetailResponseDto;

  factory CourseDetailResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailResponseDtoFromJson(json);
}

@freezed
abstract class CourseApiErrorDto with _$CourseApiErrorDto {
  const factory CourseApiErrorDto({
    String? code,
    String? message,
  }) = _CourseApiErrorDto;

  factory CourseApiErrorDto.fromJson(Map<String, dynamic> json) =>
      _$CourseApiErrorDtoFromJson(json);
}
