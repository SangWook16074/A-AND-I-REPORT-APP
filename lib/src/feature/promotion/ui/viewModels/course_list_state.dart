import 'package:a_and_i_report_web_server/src/feature/home/data/entities/course.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_list_state.freezed.dart';

@freezed
sealed class CourseListState with _$CourseListState {
  const factory CourseListState({
    @Default([]) List<Course> courses,
    String? errorMsg,
  }) = _CourseListState;
}
