import 'package:a_and_i_report_web_server/src/feature/auth/domain/usecases/save_cached_user_usecase.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/providers/auth_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_cached_user_usecase_provider.g.dart';

@riverpod
SaveCachedUserUsecase saveCachedUserUsecase(Ref ref) {
  return SaveCachedUserUsecaseImpl(
    authRepository: ref.read(authRepositoryProvider),
  );
}
