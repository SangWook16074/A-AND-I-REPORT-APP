import 'package:a_and_i_report_web_server/src/feature/auth/providers/auth_repository_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/providers/delete_cached_user_usecase_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/providers/get_cached_user_usecase_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/providers/get_user_access_token_usecase_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/providers/save_cached_user_usecase_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_event.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_view_model.g.dart';

@Riverpod(keepAlive: true)
class UserViewModel extends _$UserViewModel {
  @override
  UserViewState build() {
    Future.microtask(() => _syncFromToken());
    return const UserViewState();
  }

  Future<void> onEvent(UserViewEvent event) async {
    switch (event) {
      case SyncFromToken():
        await _syncFromToken();
      case MyInfoFetched():
        try {
          await ref.read(saveCachedUserUsecaseProvider).call(event.user);
        } catch (_) {}
        state = state.copyWith(
          status: UserStatus.authenticated,
          user: event.user,
          role: event.user.role,
          errorMsg: null,
        );
      case ClearUser():
        try {
          await ref.read(deleteCachedUserUsecaseProvider).call();
        } catch (_) {}
        state = const UserViewState(status: UserStatus.unauthenticated);
    }
  }

  Future<void> _syncFromToken() async {
    state = state.copyWith(status: UserStatus.loading, errorMsg: null);
    try {
      final token = await ref.read(getUserAccessTokenUsecaseProvider).call();
      if (token == null || token.isEmpty) {
        state = const UserViewState(status: UserStatus.unauthenticated);
        return;
      }

      // 캐시된 유저 정보 조회
      var cachedUser = await ref.read(getCachedUserUsecaseProvider).call();

      // 캐시된 유저가 없으면 서버에서 조회
      if (cachedUser == null) {
        final authRepository = ref.read(authRepositoryProvider);
        final userFromApi = await authRepository.getMyInfo(token);

        // 조회한 유저 정보를 캐시에 저장
        await ref.read(saveCachedUserUsecaseProvider).call(userFromApi);
        cachedUser = userFromApi;
      }

      state = state.copyWith(
        status: UserStatus.authenticated,
        user: cachedUser,
        role: cachedUser.role,
        errorMsg: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: UserStatus.unauthenticated,
        user: null,
        errorMsg: e.toString(),
      );
    }
  }
}
