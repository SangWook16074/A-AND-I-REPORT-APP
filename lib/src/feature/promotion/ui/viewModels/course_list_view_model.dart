import 'package:a_and_i_report_web_server/src/feature/home/providers/get_courses_usecase_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/promotion/ui/viewModels/course_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_list_view_model.g.dart';

@riverpod
class CourseListViewModel extends _$CourseListViewModel {
  @override
  Future<CourseListState> build() async {
    try {
      final courses = await ref.read(getCoursesUsecaseProvider).call();
      return CourseListState(courses: courses);
    } catch (e) {
      return CourseListState(errorMsg: e.toString());
    }
  }
}
