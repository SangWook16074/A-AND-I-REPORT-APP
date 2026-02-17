import 'package:a_and_i_report_web_server/src/core/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_view_event.freezed.dart';

@freezed
sealed class UserViewEvent with _$UserViewEvent {
  /// 저장된 JWT 토큰에서 로그인 상태와 role 정보를 동기화합니다.
  const factory UserViewEvent.syncFromToken() = SyncFromToken;

  /// 내 정보 조회 API 결과를 반영하여 사용자 정보를 갱신합니다.
  const factory UserViewEvent.myInfoFetched({
    required User user,
  }) = MyInfoFetched;

  /// 로그아웃 등으로 사용자 정보를 초기화합니다.
  const factory UserViewEvent.clear() = ClearUser;
}
