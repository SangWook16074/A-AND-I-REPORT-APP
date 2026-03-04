import 'package:a_and_i_report_web_server/src/feature/auth/domain/repositories/auth_repository.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/entities/report_summary.dart';
import 'package:a_and_i_report_web_server/src/feature/home/data/repositories/report_summary_repository.dart';

/// 과제 목록을 조회하는 UseCase 구현체입니다.
///
/// **동작 순서:**
/// 1. [AuthRepository]를 통해 로컬 저장소의 토큰을 확인합니다.
/// 2. 토큰이 없으면 예외를 발생시킵니다 (로그인 필요).
/// 3. 토큰을 `Authorization` 헤더 포맷(`Bearer ...`)으로 가공합니다.
/// 4. [ReportSummaryRepository]를 호출하여 데이터를 받아옵니다.
final class GetReportSummaryUsecaseImpl implements GetReportSummaryUsecase {
  final AuthRepository authRepository;
  final ReportSummaryRepository reportSummaryRepository;
  const GetReportSummaryUsecaseImpl({
    required this.authRepository,
    required this.reportSummaryRepository,
  });

  @override
  Future<List<ReportSummary>> call() async {
    // 세션 스토리지에서 토큰 가져오기
    final token = await authRepository.getToken();

    /// 조회 API는 인증 없이도 호출 가능하므로
    /// 토큰이 없더라도 예외를 발생시키지 않고 진행합니다.
    /// 토큰이 존재하는 경우에만 Authorization 헤더에 Bearer 토큰을 포함합니다.
    final authorization =
        (token != null && token.isNotEmpty) ? 'Bearer $token' : null;

    /// ReportSummaryRepository를 호출하여 과제 목록 데이터를 가져옵니다.
    /// authorization이 null인 경우 Authorization 헤더 없이 요청됩니다.
    return await reportSummaryRepository.getReportSummaries(authorization);
  }
}

/// 과제 목록 조회 UseCase 인터페이스입니다.
abstract class GetReportSummaryUsecase {
  Future<List<ReportSummary>> call();
}
