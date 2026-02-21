import 'dart:typed_data';

import 'package:a_and_i_report_web_server/src/feature/user/domain/models/change_password_result.dart';
import 'package:a_and_i_report_web_server/src/feature/user/domain/models/update_my_profile_result.dart';

/// 사용자 프로필 갱신 저장소 인터페이스다.
abstract class UserProfileRepository {
  /// 닉네임/프로필 이미지 변경을 서버에 반영한다.
  Future<UpdateMyProfileResult> updateMyProfile({
    String? nickname,
    Uint8List? profileImageBytes,
    String? profileImageFileName,
    String? profileImageMimeType,
  });

  /// 비밀번호를 서버에 반영한다.
  Future<ChangePasswordResult> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}
