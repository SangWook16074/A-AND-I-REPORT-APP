import 'package:a_and_i_report_web_server/src/core/constants/api_url.dart';
import 'package:a_and_i_report_web_server/src/core/providers/dio_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/repositories/course_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_repository_provider.g.dart';

@riverpod
CourseRepository courseRepository(Ref ref) {
  return CourseRepository(ref.read(dioProvider), baseUrl: baseUrl);
}
