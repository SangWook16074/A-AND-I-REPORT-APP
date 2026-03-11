import 'package:a_and_i_report_web_server/src/feature/reports/data/dtos/report_detail_response_dto.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'report_repository.g.dart';

/// 과제 상세 데이터를 가져오는 Retrofit 클라이언트입니다.
///
/// [Dio]를 사용하여 `/api/report/{id}` 엔드포인트와 통신합니다.
@RestApi()
abstract class ReportRepository {
  factory ReportRepository(Dio dio, {String baseUrl}) = _ReportRepository;

  /// 특정 ID의 과제 상세 정보를 조회합니다.
  ///
  /// [id]는 과제의 UUID이며, [authorization] 헤더가 필요합니다.
  @GET("/v1/report/{id}")
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<ReportDetailResponseDto> getReportDetailById(
      @Path("id") String id, @Header("Authorization") String authorization);
}
