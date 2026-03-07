import 'package:a_and_i_report_web_server/src/feature/home/providers/get_courses_usecase_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/promotion/ui/viewModels/course_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_list_view_model.g.dart';

@riverpod
class CourseListViewModel extends _$CourseListViewModel {
  @override
  CourseListState build() {
    Future.microtask(_init);
    return const CourseListState();
  }

  Future<void> _init() async {
    state = state.copyWith(status: CourseListViewStatus.loading, errorMsg: null);

    try {
      final courses = await ref.read(getCoursesUsecaseProvider).call();
      state = state.copyWith(
        status: CourseListViewStatus.done,
        courses: courses,
        errorMsg: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: CourseListViewStatus.error,
        errorMsg: e.toString(),
      );
    }
  }
}
