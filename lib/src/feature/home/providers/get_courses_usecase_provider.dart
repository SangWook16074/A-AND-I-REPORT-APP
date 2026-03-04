import 'package:a_and_i_report_web_server/src/feature/home/domain/usecases/get_courses_usecase.dart';
import 'package:a_and_i_report_web_server/src/feature/home/providers/course_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_courses_usecase_provider.g.dart';

@riverpod
GetCoursesUsecase getCoursesUsecase(Ref ref) {
  return GetCoursesUsecaseImpl(
    courseRepository: ref.read(courseRepositoryProvider),
  );
}
