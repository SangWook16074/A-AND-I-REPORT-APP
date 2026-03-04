import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import '../entities/course.dart';

part 'course_repository.g.dart';

@RestApi()
abstract class CourseRepository {
  factory CourseRepository(Dio dio, {String baseUrl}) = _CourseRepository;

  @GET("/v2/report/v1/courses")
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<List<Course>> getCourses();
}
