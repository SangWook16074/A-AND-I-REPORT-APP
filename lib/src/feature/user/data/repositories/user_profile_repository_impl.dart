import 'dart:typed_data';

import 'package:a_and_i_report_web_server/src/feature/auth/domain/repositories/auth_repository.dart';
import 'package:a_and_i_report_web_server/src/feature/user/data/datasources/user_profile_remote_datasource.dart';
import 'package:a_and_i_report_web_server/src/feature/user/domain/models/change_password_result.dart';
import 'package:a_and_i_report_web_server/src/feature/user/domain/models/update_my_profile_result.dart';
import 'package:a_and_i_report_web_server/src/feature/user/domain/repositories/user_profile_repository.dart';

/// 사용자 프로필 저장소 구현체다.
class UserProfileRepositoryImpl implements UserProfileRepository {
  UserProfileRepositoryImpl(
    this.userProfileRemoteDatasource,
    this.authRepository,
  );

  final UserProfileRemoteDatasource userProfileRemoteDatasource;
  final AuthRepository authRepository;

  @override
  Future<UpdateMyProfileResult> updateMyProfile({
    String? nickname,
    Uint8List? profileImageBytes,
    String? profileImageFileName,
    String? profileImageMimeType,
  }) async {
    try {
      final token = await authRepository.getToken();
      if (token == null || token.isEmpty) {
        return const UpdateMyProfileFailure(
          UpdateMyProfileFailureReason.unauthorized,
        );
      }

      final user = await userProfileRemoteDatasource.updateMyProfile(
        authorization: 'Bearer $token',
        nickname: nickname,
        profileImageBytes: profileImageBytes,
        profileImageFileName: profileImageFileName,
        profileImageMimeType: profileImageMimeType,
      );
      return UpdateMyProfileSuccess(user: user);
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

  @override
  Future<ChangePasswordResult> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final token = await authRepository.getToken();
      if (token == null || token.isEmpty) {
        return const ChangePasswordFailure(
          ChangePasswordFailureReason.unauthorized,
        );
      }

      await userProfileRemoteDatasource.changePassword(
        authorization: 'Bearer $token',
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      return const ChangePasswordSuccess();
    } on ChangePasswordNetworkException {
      return const ChangePasswordFailure(
        ChangePasswordFailureReason.networkError,
      );
    } on ChangePasswordRequestException {
      return const ChangePasswordFailure(
        ChangePasswordFailureReason.unknown,
      );
    }
  }
}
