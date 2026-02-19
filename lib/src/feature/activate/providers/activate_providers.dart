import 'package:a_and_i_report_web_server/src/core/providers/dio_provider.dart';
import 'package:a_and_i_report_web_server/src/core/constants/api_url.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/data/datasources/activate_remote_datasource.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/data/repositories/activate_repository_impl.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/domain/repositories/activate_repository.dart';
import 'package:a_and_i_report_web_server/src/feature/activate/domain/usecases/activate_account_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final activateRemoteDatasourceProvider = Provider<ActivateRemoteDatasource>(
  (ref) => ActivateRemoteDatasource(
    ref.read(dioProvider),
    baseUrl: baseUrl,
  ),
);

final activateRepositoryProvider = Provider<ActivateRepository>(
  (ref) => ActivateRepositoryImpl(ref.read(activateRemoteDatasourceProvider)),
);

final activateAccountUsecaseProvider = Provider<ActivateAccountUsecase>(
  (ref) => ActivateAccountUsecase(ref.read(activateRepositoryProvider)),
);
