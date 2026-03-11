import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import '../dtos/course_response_dto.dart';

part 'course_repository.g.dart';

/// Retrofit 사용하면 안되는 곳. DATASOURCE => API ENDPOINT
/// 나한테 연락을해서 물어봐야됨...
/// REPOSTIORY는 엔드포인트가 아닌거임??
///
/// 엔드포인트가 아님....
/// 서버쪽 통신 엔드포인트와, 로컬 캐싱, 로컬, JWT 같은 엔드포인트를 엮어주는곳. 강의는 한번 호출하면 일주일이상 안바뀜...

@RestApi()
abstract class CourseRepository {
  factory CourseRepository(Dio dio, {String baseUrl}) = _CourseRepository;

  @GET("/v1/courses/{courseSlug}")
  Future<CourseDetailResponseDto> getCourseBySlugFromCourses(
    @Header("Authorization") String authorization,
    @Path("courseSlug") String courseSlug,
  );

  @GET("/v1/courses")
  Future<CourseListResponseDto> getCourses(
    @Header("Authorization") String authorization,
    @Query("status") String? status,
    @Query("phase") String? phase,
    @Query("track") String? track,
  );
}
