import 'package:a_and_i_report_web_server/src/feature/home/data/entities/course.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/repositories/course_repository.dart';

abstract class GetCoursesUsecase {
  Future<List<Course>> call();
}

final class GetCoursesUsecaseImpl implements GetCoursesUsecase {
  final CourseRepository courseRepository;

  const GetCoursesUsecaseImpl({required this.courseRepository});

  @override
  Future<List<Course>> call() {
    return courseRepository.getCourses();
  }
}
