import 'package:a_and_i_report_web_server/src/core/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_view_state.freezed.dart';

enum UserStatus { unauthenticated, authenticated, loading }

@freezed
abstract class UserViewState with _$UserViewState {
  const factory UserViewState({
    @Default(UserStatus.loading) UserStatus status,
    User? user,
    String? role,
    String? errorMsg,
  }) = _UserViewState;
}

extension UserViewStateX on UserViewState {
  String? get userId => user?.id;
  String? get nickname => user?.nickname;
  String? get resolvedRole => user?.role ?? role;
}
