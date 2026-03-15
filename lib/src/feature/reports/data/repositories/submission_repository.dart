import 'package:a_and_i_report_web_server/src/feature/reports/data/dtos/submission_request_dto.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/data/dtos/submission_response_dto.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/data/dtos/submission_result_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'submission_repository.g.dart';

/// 제출 및 채점 관련 API Repository입니다.
@RestApi()
abstract class SubmissionRepository {
  factory SubmissionRepository(Dio dio, {String baseUrl}) = _SubmissionRepository;

  /// 소스 코드 제출을 생성합니다.
  @POST('/v1/submissions')
  Future<SubmissionResponseDto> createSubmission(
    @Header('Authorization') String authorization,
    @Body() SubmissionRequestDto request,
  );

  /// 제출 최종 결과를 조회합니다.
  @GET('/v1/submissions/{submissionId}')
  Future<SubmissionResultResponseDto> getSubmissionResult(
    @Path('submissionId') String submissionId,
    @Header('Authorization') String authorization,
  );
}
