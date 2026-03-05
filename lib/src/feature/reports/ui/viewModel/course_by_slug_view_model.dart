import 'package:a_and_i_report_web_server/src/feature/home/data/entities/course.dart';
import 'package:a_and_i_report_web_server/src/feature/home/providers/get_course_by_slug_usecase_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_by_slug_view_model.g.dart';

/// 코스 슬러그별 과정을 조회하는 ViewModel Provider입니다.
@riverpod
Future<Course> courseBySlugViewModel(Ref ref, String courseSlug) async {
  return ref.read(getCourseBySlugUsecaseProvider).call(courseSlug);
}
