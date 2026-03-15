import 'package:a_and_i_report_web_server/src/feature/auth/providers/auth_repository_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/domain/usecases/get_submission_result_usecase.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/providers/submission_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_submission_result_usecase_provider.g.dart';

/// 제출 결과 조회 UseCase Provider입니다.
@riverpod
GetSubmissionResultUsecase getSubmissionResultUsecase(Ref ref) {
  return GetSubmissionResultUsecaseImpl(
    submissionRepository: ref.read(submissionRepositoryProvider),
    authRepository: ref.read(authRepositoryProvider),
  );
}
