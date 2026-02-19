import 'dart:typed_data';

import 'package:a_and_i_report_web_server/src/feature/user/domain/models/update_my_profile_result.dart';
import 'package:a_and_i_report_web_server/src/feature/user/domain/repositories/user_profile_repository.dart';

/// 내 정보 수정 유스케이스다.
class UpdateMyProfileUsecase {
  const UpdateMyProfileUsecase(this.userProfileRepository);

  final UserProfileRepository userProfileRepository;

  /// 내 닉네임/프로필 이미지를 수정한다.
  Future<UpdateMyProfileResult> call({
    required String nickname,
    Uint8List? profileImageBytes,
    String? profileImageFileName,
    String? profileImageMimeType,
  }) async {
    final trimmedNickname = nickname.trim();
    if (trimmedNickname.isEmpty) {
      return const UpdateMyProfileFailure(
        UpdateMyProfileFailureReason.invalidNickname,
      );
    }

    return userProfileRepository.updateMyProfile(
      nickname: trimmedNickname,
      profileImageBytes: profileImageBytes,
      profileImageFileName: profileImageFileName,
      profileImageMimeType: profileImageMimeType,
    );
  }
}
