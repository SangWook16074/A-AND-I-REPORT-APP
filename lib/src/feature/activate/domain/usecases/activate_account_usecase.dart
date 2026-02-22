import 'package:a_and_i_report_web_server/src/feature/activate/domain/models/activate_command.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/domain/models/activate_result.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/domain/repositories/activate_repository.dart';

class ActivateAccountUsecase {
  ActivateAccountUsecase(this._repository);

  final ActivateRepository _repository;

  Future<ActivateResult> call({
    required String? token,
    required String username,
    required String password,
  }) async {
    if (token == null || token.isEmpty) {
      return const ActivateResult.failure(ActivateFailureReason.tokenMissing);
    }

    final command = ActivateCommand(
      token: token,
      username: username,
      password: password,
    );
    return _repository.activate(command);
  }
}
