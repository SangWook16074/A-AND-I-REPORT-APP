import 'package:a_and_i_report_web_server/src/feature/activate/data/dtos/activate_request_dto.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/domain/models/activate_command.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/domain/models/activate_result.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/data/datasources/activate_remote_datasource.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/domain/repositories/activate_repository.dart';

class ActivateRepositoryImpl implements ActivateRepository {
  ActivateRepositoryImpl(this._remoteDatasource);

  final ActivateRemoteDatasource _remoteDatasource;

  @override
  Future<ActivateResult> activate(ActivateCommand command) async {
    try {
      final request = ActivateRequestDto(
        token: command.token,
        password: command.password,
      );
      await _remoteDatasource.activate(request);
      return const ActivateResult.success();
    } on ActivateNetworkException {
      return const ActivateResult.failure(ActivateFailureReason.networkError);
    } on ActivateInvalidTokenException {
      return const ActivateResult.failure(
        ActivateFailureReason.tokenInvalidOrExpired,
      );
    }
  }
}
