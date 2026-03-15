import 'package:a_and_i_report_web_server/src/core/utils/api_error_mapper.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/domain/repositories/auth_repository.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/data/dtos/submission_request_dto.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/data/dtos/submission_response_dto.dart';
import 'package:a_and_i_report_web_server/src/feature/reports/data/repositories/submission_repository.dart';

/// 제출 생성 UseCase 구현체입니다.
final class CreateSubmissionUsecaseImpl implements CreateSubmissionUsecase {
  final SubmissionRepository submissionRepository;
  final AuthRepository authRepository;

  const CreateSubmissionUsecaseImpl({
    required this.submissionRepository,
    required this.authRepository,
  });

  @override
  Future<SubmissionResponseDto> call({
    required String problemId,
    required String language,
    required String code,
  }) async {
    final token = await authRepository.getToken();

    if (token == null || token.isEmpty) {
      throw Exception('인증되지 않은 사용자입니다. 로그인이 필요합니다.');
    }

    try {
      return await submissionRepository.createSubmission(
        'Bearer $token',
        SubmissionRequestDto(
          problemId: problemId,
          language: language,
          code: code,
          options: const SubmissionOptionsDto(
            realtimeFeedback: true,
          ),
        ),
      );
    } catch (error) {
      throw Exception(
        ApiErrorMapper.map(
          error,
          fallbackMessage: '소스 코드 제출에 실패했습니다.',
        ),
      );
    }
  }
}

/// 제출 생성 UseCase 인터페이스입니다.
abstract class CreateSubmissionUsecase {
  Future<SubmissionResponseDto> call({
    required String problemId,
    required String language,
    required String code,
  });
}
