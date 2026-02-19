import 'dart:typed_data';

import 'package:a_and_i_report_web_server/src/feature/user/data/datasources/user_profile_remote_datasource.dart';
import 'package:a_and_i_report_web_server/src/feature/user/domain/models/update_my_profile_result.dart';
import 'package:a_and_i_report_web_server/src/feature/user/domain/repositories/user_profile_repository.dart';

/// 사용자 프로필 저장소 구현체다.
class UserProfileRepositoryImpl implements UserProfileRepository {
  UserProfileRepositoryImpl(this.userProfileRemoteDatasource);

  final UserProfileRemoteDatasource userProfileRemoteDatasource;

  @override
  Future<UpdateMyProfileResult> updateMyProfile({
    required String nickname,
    Uint8List? profileImageBytes,
    String? profileImageFileName,
    String? profileImageMimeType,
  }) async {
    try {
      final user = await userProfileRemoteDatasource.patchMyProfile(
        nickname: nickname,
        profileImageBytes: profileImageBytes,
        profileImageFileName: profileImageFileName,
        profileImageMimeType: profileImageMimeType,
      );
      return UpdateMyProfileSuccess(user);
    } on UpdateMyProfileNetworkException {
      return const UpdateMyProfileFailure(
        UpdateMyProfileFailureReason.networkError,
      );
    } on UpdateMyProfileRequestException {
      return const UpdateMyProfileFailure(
        UpdateMyProfileFailureReason.unknown,
      );
    }
  }
}
