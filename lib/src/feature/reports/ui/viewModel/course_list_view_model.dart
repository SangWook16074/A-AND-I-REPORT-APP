import 'package:a_and_i_report_web_server/src/feature/home/data/entities/course.dart';
import 'package:a_and_i_report_web_server/src/feature/home/providers/get_courses_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_list_view_model.g.dart';

/// 과정 목록을 조회하는 홈 화면 ViewModel입니다.
@riverpod
class CourseListViewModel extends _$CourseListViewModel {
  /// 과정 목록을 비동기로 불러옵니다.
  @override
  Future<List<Course>> build() async {
    return ref.read(getCoursesUsecaseProvider).call();
  }
}
