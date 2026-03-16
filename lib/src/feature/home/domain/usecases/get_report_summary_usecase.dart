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
  Future<List<ReportSummary>> call(String courseSlug) async {
    if (courseSlug.trim().isEmpty) {
      throw Exception('코스 슬러그가 없어 과제 목록을 조회할 수 없습니다.');
    }

    // 세션 스토리지에서 토큰 가져오기
    final token = await authRepository.getToken();
    // 토큰이 없으면 인증되지 않은 사용자
    if (token == null || token.isEmpty) {
      throw Exception('인증되지 않은 사용자입니다. 로그인이 필요합니다.');
    }

    final authorization = 'Bearer $token';
    final weekResponse = await reportSummaryRepository.getWeeks(
      authorization,
      courseSlug,
    );

    if (!weekResponse.success) {
      throw Exception(weekResponse.error?.message ?? '주차 목록 조회에 실패했습니다.');
    }

    final weekNumbers = weekResponse.data
        .map((week) => week.weekNo)
        .where((weekNo) => weekNo > 0)
        .toList(growable: false);

    if (weekNumbers.isEmpty) {
      return const <ReportSummary>[];
    }

    final assignmentResponses = await Future.wait(
      weekNumbers.map(
        (weekNo) => reportSummaryRepository.getReportSummaries(
          authorization,
          courseSlug,
          weekNo,
          'PUBLISHED',
        ),
      ),
    );

    final reports = <ReportSummary>[];

    for (final response in assignmentResponses) {
      if (!response.success) {
        throw Exception(response.error?.message ?? '과제 목록 조회에 실패했습니다.');
      }

      reports.addAll(response.data);
    }

    reports.sort((a, b) {
      final weekCompare = a.week.compareTo(b.week);
      if (weekCompare != 0) {
        return weekCompare;
      }

      return a.seq.compareTo(b.seq);
    });

    return reports;
  }
}

/// 과제 목록 조회 UseCase 인터페이스입니다.
abstract class GetReportSummaryUsecase {
  Future<List<ReportSummary>> call(String courseSlug);
}
