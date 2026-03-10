import 'package:a_and_i_report_web_server/src/feature/home/data/entities/course.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_list_state.freezed.dart';

/// 과정 목록 조회 상태를 나타내는 열거형입니다.
enum CourseListViewStatus { loading, done, error }

/// 과정 목록 화면 상태를 담는 ViewModel 모델입니다.
@freezed
abstract class CourseListState with _$CourseListState {
  const factory CourseListState({
    @Default(CourseListViewStatus.loading) CourseListViewStatus status,
    @Default([]) List<Course> courses,
    @Default('') String errorMsg,
  }) = _CourseListState;
}
