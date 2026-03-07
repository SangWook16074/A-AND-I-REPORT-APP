import 'package:a_and_i_report_web_server/src/feature/home/providers/get_courses_usecase_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/viewModel/course_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_list_view_model.g.dart';

/// 과정 목록을 조회하는 홈 화면 ViewModel입니다.
@riverpod
class CourseListViewModel extends _$CourseListViewModel {
  @override
  CourseListState build() {
    Future.microtask(_load);
    return const CourseListState();
  }

  Future<void> _load() async {
    try {
      final courses = await ref.read(getCoursesUsecaseProvider).call();
      state = CourseListState(
        status: CourseListViewStatus.done,
        courses: courses,
      );
    } catch (e) {
      state = CourseListState(
        status: CourseListViewStatus.error,
        errorMsg: e.toString(),
      );
    }
  }
}
