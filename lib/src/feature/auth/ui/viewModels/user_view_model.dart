import 'dart:convert';

import 'package:a_and_i_report_web_server/src/core/models/user.dart';
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
    _syncFromToken();
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

      final cachedUser = await ref.read(getCachedUserUsecaseProvider).call();
      final jwtUser = _extractUserFromJwt(token);
      final resolvedUser = cachedUser ?? jwtUser;
      final resolvedRole = resolvedUser?.role ?? _extractRoleFromJwt(token);

      state = state.copyWith(
        status: UserStatus.authenticated,
        user: resolvedUser,
        role: resolvedRole,
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

  User? _extractUserFromJwt(String token) {
    final map = _parseJwtPayload(token);
    if (map == null) {
      return null;
    }

    final id = map['id']?.toString() ??
        map['userId']?.toString() ??
        map['sub']?.toString();
    final nickname = map['nickName']?.toString() ??
        map['nickname']?.toString() ??
        map['nick_name']?.toString() ??
        map['displayName']?.toString() ??
        map['username']?.toString() ??
        map['name']?.toString();
    final role = map['role']?.toString();

    if (id == null || id.isEmpty || role == null || role.isEmpty) {
      return null;
    }

    final resolvedNickname =
        nickname == null || nickname.isEmpty ? '동아리원' : nickname;

    final profileImageUrl = map['profileImageUrl']?.toString() ??
        map['profileImagePath']?.toString() ??
        map['profileImage']?.toString() ??
        map['avatarUrl']?.toString() ??
        map['avatar']?.toString() ??
        map['picture']?.toString();

    return User(
      id: id,
      nickname: resolvedNickname,
      role: role,
      profileImageUrl: profileImageUrl,
    );
  }

  String? _extractRoleFromJwt(String token) {
    final map = _parseJwtPayload(token);
    if (map == null) {
      return null;
    }
    final role = map['role'];
    return role?.toString();
  }

  Map<String, dynamic>? _parseJwtPayload(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;
      final payload =
          utf8.decode(base64Url.decode(base64Url.normalize(parts[1])));
      final map = jsonDecode(payload);
      if (map is! Map<String, dynamic>) return null;
      return map;
    } catch (_) {
      return null;
    }
  }
}
