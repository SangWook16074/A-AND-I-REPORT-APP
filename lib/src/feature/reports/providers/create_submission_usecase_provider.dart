import 'package:a_and_i_report_web_server/src/feature/auth/providers/auth_repository_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/domain/usecases/create_submission_usecase.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/providers/submission_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_submission_usecase_provider.g.dart';

/// 제출 생성 UseCase Provider입니다.
@riverpod
CreateSubmissionUsecase createSubmissionUsecase(Ref ref) {
  return CreateSubmissionUsecaseImpl(
    submissionRepository: ref.read(submissionRepositoryProvider),
    authRepository: ref.read(authRepositoryProvider),
  );
}
