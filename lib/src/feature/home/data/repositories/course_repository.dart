import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import '../entities/course.dart';

part 'course_repository.g.dart';

@RestApi()
abstract class CourseRepository {
  factory CourseRepository(Dio dio, {String baseUrl}) = _CourseRepository;

  @GET("/v1/courses")
  Future<List<Course>> getCourses(
    @Header("Authorization") String authorization,
  );
}
