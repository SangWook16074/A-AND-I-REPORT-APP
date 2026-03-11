import 'package:a_and_i_report_web_server/src/core/utils/api_error_mapper.dart';
import 'package:a_and_i_report_web_server/src/feature/home/providers/get_course_by_slug_usecase_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/ui/viewModel/course_by_slug_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_by_slug_view_model.g.dart';

/// 코스 슬러그별 과정을 조회하는 ViewModel Provider입니다.
@riverpod
class CourseBySlugViewModel extends _$CourseBySlugViewModel {
  @override
  CourseBySlugState build(String courseSlug) {
    Future.microtask(() => _load(courseSlug));
    return const CourseBySlugState();
  }

  Future<void> _load(String courseSlug) async {
    try {
      final course =
          await ref.read(getCourseBySlugUsecaseProvider).call(courseSlug);
      state = CourseBySlugState(
        status: CourseBySlugViewStatus.done,
        course: course,
      );
    } catch (e) {
      state = CourseBySlugState(
        status: CourseBySlugViewStatus.error,
        errorMsg: ApiErrorMapper.map(
          e,
          fallbackMessage: '코스 상세를 불러오지 못했습니다.',
        ),
      );
    }
  }
}
