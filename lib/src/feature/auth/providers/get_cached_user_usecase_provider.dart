import 'package:a_and_i_report_web_server/src/feature/auth/domain/usecases/get_cached_user_usecase.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/providers/auth_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_cached_user_usecase_provider.g.dart';

@riverpod
GetCachedUserUsecase getCachedUserUsecase(Ref ref) {
  return GetCachedUserUsecaseImpl(
    authRepository: ref.read(authRepositoryProvider),
  );
}
