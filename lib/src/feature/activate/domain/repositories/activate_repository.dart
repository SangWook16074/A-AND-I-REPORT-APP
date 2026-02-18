import 'package:a_and_i_report_web_server/src/feature/activate/domain/models/activate_command.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/domain/models/activate_result.dart';

abstract class ActivateRepository {
  Future<ActivateResult> activate(ActivateCommand command);
}
