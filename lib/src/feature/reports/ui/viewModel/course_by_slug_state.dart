import 'package:a_and_i_report_web_server/src/feature/home/data/entities/course.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_by_slug_state.freezed.dart';

/// 코스 상세 조회 화면의 상태를 나타내는 열거형입니다.
enum CourseBySlugViewStatus { loading, done, error }

/// 코스 슬러그 기반 조회 상태를 담는 ViewModel 상태 모델입니다.
@freezed
abstract class CourseBySlugState with _$CourseBySlugState {
  const factory CourseBySlugState({
    @Default(CourseBySlugViewStatus.loading) CourseBySlugViewStatus status,
    Course? course,
    @Default('') String errorMsg,
  }) = _CourseBySlugState;
}
