import 'dart:convert';

import 'package:a_and_i_report_web_server/src/feature/auth/providers/get_user_access_token_usecase_provider.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_event.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_view_model.g.dart';

@Riverpod(keepAlive: true)
class UserViewModel extends _$UserViewModel {
  @override
  UserViewState build() {
    _syncFromToken();
    return const UserViewState();
  }

  Future<void> onEvent(UserViewEvent event) async {
    switch (event) {
      case SyncFromToken():
        await _syncFromToken();
      case MyInfoFetched():
        state = state.copyWith(
          status: UserStatus.authenticated,
          user: event.user,
          role: event.user.role,
          errorMsg: null,
        );
      case ClearUser():
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

      state = state.copyWith(
        status: UserStatus.authenticated,
        role: _extractRoleFromJwt(token),
        errorMsg: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: UserStatus.unauthenticated,
        errorMsg: e.toString(),
      );
    }
  }

  String? _extractRoleFromJwt(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;
      final payload =
          utf8.decode(base64Url.decode(base64Url.normalize(parts[1])));
      final map = jsonDecode(payload);
      if (map is! Map<String, dynamic>) return null;
      final role = map['role'];
      return role?.toString();
    } catch (_) {
      return null;
    }
  }
}
