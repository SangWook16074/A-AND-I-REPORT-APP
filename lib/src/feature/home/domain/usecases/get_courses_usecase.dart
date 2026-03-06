import 'package:a_and_i_report_web_server/src/feature/auth/domain/repositories/auth_repository.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/entities/course.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/repositories/course_repository.dart';

/// 코스 목록 조회 UseCase 인터페이스입니다.
abstract class GetCoursesUsecase {
  Future<List<Course>> call();
}

/// 코스 목록을 조회하는 UseCase 구현체입니다.
final class GetCoursesUsecaseImpl implements GetCoursesUsecase {
  final CourseRepository courseRepository;
  final AuthRepository authRepository;

  const GetCoursesUsecaseImpl({
    required this.courseRepository,
    required this.authRepository,
  });

  @override
  Future<List<Course>> call() async {
    final token = await authRepository.getToken();

    if (token == null || token.isEmpty) {
      throw Exception('인증되지 않은 사용자입니다. 로그인이 필요합니다.');
    }

    final authorization = 'Bearer $token';
    return await courseRepository.getCourses(authorization);
  }
}
