import 'package:a_and_i_report_web_server/src/feature/auth/domain/repositories/auth_repository.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/entities/course.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/repositories/course_repository.dart';

/// 코스 슬러그로 코스 상세 정보를 조회하는 UseCase 인터페이스입니다.
abstract class GetCourseBySlugUsecase {
  Future<Course> call(String courseSlug);
}

/// 코스 슬러그로 코스 상세 정보를 조회하는 UseCase 구현체입니다.
final class GetCourseBySlugUsecaseImpl implements GetCourseBySlugUsecase {
  final CourseRepository _courseRepository;
  final AuthRepository _authRepository;

  const GetCourseBySlugUsecaseImpl({
    required CourseRepository courseRepository,
    required AuthRepository authRepository,
  })  : _courseRepository = courseRepository,
        _authRepository = authRepository;

  @override
  Future<Course> call(String courseSlug) async {
    final token = await _authRepository.getToken();

    if (token == null || token.isEmpty) {
      throw Exception('인증되지 않은 사용자입니다. 로그인이 필요합니다.');
    }

    final authorization = 'Bearer $token';
    final response = await _courseRepository.getCourseBySlugFromCourses(
      authorization,
      courseSlug,
    );

    if (!response.success || response.data == null) {
      throw Exception(response.error?.message ?? '코스 정보를 불러오지 못했습니다.');
    }

    return response.data!;
  }
}
