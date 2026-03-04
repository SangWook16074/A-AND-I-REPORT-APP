// import 'package:dio/dio.dart' hide Headers;
// import 'package:retrofit/retrofit.dart';

// part 'course_repository.g.dart';

// @RestApi()
// abstract class CourseRepository {
//   factory CourseRepository(Dio dio, {String baseUrl}) = _CourseRepository;

//   // 3.1 코스 목록 조회
//   @GET('/courses')
//   Future<List<CourseResponse>> getCourses({
//     @Query('status') String? status,  // ACTIVE
//     @Query('phase') String? phase,    // BASIC
//     @Query('track') String? track,    // FL / SP
//   });

//   // 3.2 코스 상세
//   @GET('/courses/{courseSlug}')
//   Future<CourseResponse> getCourseDetail(@Path('courseSlug') String courseSlug);

//   // 3.3 주차 목록
//   @GET('/courses/{courseSlug}/weeks')
//   Future<List<CourseWeekResponse>> getWeeks(@Path('courseSlug') String courseSlug);

//   // 3.5 주차별 과제 목록
//   @GET('/courses/{courseSlug}/weeks/{weekNo}/assignments')
//   Future<List<AssignmentSummaryResponse>> getAssignmentsByWeek(
//     @Path('courseSlug') String courseSlug,
//     @Path('weekNo') int weekNo, {
//     @Query('status') String? status, // PUBLISHED
//   });

//   // 3.6 과제 상세
//   @GET('/courses/{courseSlug}/assignments/{assignmentId}')
//   Future<AssignmentDetailResponse> getAssignmentDetail(
//     @Path('courseSlug') String courseSlug,
//     @Path('assignmentId') String assignmentId,
//   );
// }
