import 'package:a_and_i_report_web_server/src/core/constants/api_url.dart';
import 'package:a_and_i_report_web_server/src/core/providers/dio_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/providers/auth_repository_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/user/data/datasources/user_profile_remote_datasource.dart';
import 'package:a_and_i_report_web_server/src/feature/user/data/repositories/user_profile_repository_impl.dart';
import 'package:a_and_i_report_web_server/src/feature/user/domain/repositories/user_profile_repository.dart';
import 'package:a_and_i_report_web_server/src/feature/user/domain/usecases/change_password_usecase.dart';
import 'package:a_and_i_report_web_server/src/feature/user/domain/usecases/update_my_profile_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 내 정보 수정 원격 데이터소스 Provider다.
final userProfileRemoteDatasourceProvider =
    Provider<UserProfileRemoteDatasource>(
  (ref) => UserProfileRemoteDatasource(
    ref.read(dioProvider),
    baseUrl: baseUrl,
  ),
);

/// 내 정보 수정 저장소 Provider다.
final userProfileRepositoryProvider = Provider<UserProfileRepository>(
  (ref) => UserProfileRepositoryImpl(
    ref.read(userProfileRemoteDatasourceProvider),
    ref.read(authRepositoryProvider),
  ),
);

/// 내 정보 수정 유스케이스 Provider다.
final updateMyProfileUsecaseProvider = Provider<UpdateMyProfileUsecase>(
  (ref) => UpdateMyProfileUsecase(ref.read(userProfileRepositoryProvider)),
);

/// 비밀번호 변경 유스케이스 Provider다.
final changePasswordUsecaseProvider = Provider<ChangePasswordUsecase>(
  (ref) => ChangePasswordUsecase(ref.read(userProfileRepositoryProvider)),
);
