import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import '../dtos/report_summary_response_dto.dart';

part 'report_summary_repository.g.dart';

/// 과제 목록 데이터를 가져오는 Retrofit 클라이언트입니다.
///
/// [Dio]를 사용하여 코스 주차/과제 목록 엔드포인트와 통신합니다.
@RestApi()
abstract class ReportSummaryRepository {
  factory ReportSummaryRepository(Dio dio, {String baseUrl}) =
      _ReportSummaryRepository;

  /// 서버로부터 코스의 주차 목록을 조회합니다.
  ///
  /// [authorization] 헤더에 Bearer 토큰을 포함하여 요청해야 합니다.
  @GET("/v1/courses/{courseSlug}/weeks")
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<WeekListResponseDto> getWeeks(
    @Header("Authorization") String authorization,
    @Path("courseSlug") String courseSlug,
  );

  /// 서버로부터 특정 주차의 과제 목록을 조회합니다.
  ///
  /// [authorization] 헤더에 Bearer 토큰을 포함하여 요청해야 합니다.
  @GET("/v1/courses/{courseSlug}/weeks/{weekNo}/assignments")
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<ReportSummaryResponseDto> getReportSummaries(
    @Header("Authorization") String authorization,
    @Path("courseSlug") String courseSlug,
    @Path("weekNo") int weekNo,
    @Query("status") String status,
  );
}
