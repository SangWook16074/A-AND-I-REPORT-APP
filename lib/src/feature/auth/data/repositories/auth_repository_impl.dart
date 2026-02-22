import 'dart:convert';

import 'package:a_and_i_report_web_server/src/core/models/user.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/data/datasources/remote/remote_auth_datasource.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/data/dtos/login_request_dto.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/data/dtos/login_response_dto.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/domain/repositories/auth_repository.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/data/datasources/local/local_auth_datasource.dart';

/// [AuthRepository]의 구현체입니다.
///
/// 데이터의 출처(Remote API vs Local Storage)를 관리하고 조율합니다.
/// - **로그인**: [remoteAuthRepository]를 통해 서버와 통신합니다.
/// - **토큰 관리**: [localAuthRepository]를 통해 로컬 저장소에 접근합니다.
class AuthRepositoryImpl implements AuthRepository {
  final LocalAuthDatasource localAuthRepository;
  final RemoteAuthDatasource remoteAuthRepository;

  AuthRepositoryImpl({
    required this.localAuthRepository,
    required this.remoteAuthRepository,
  });

  @override
  Future<LoginResponseDto> login(LoginRequestDto dto) async {
    return await remoteAuthRepository.login(dto);
  }

  @override
  Future<void> saveToken(String token) async {
    await localAuthRepository.saveUserToken(token);
  }

  @override
  Future<String?> getToken() async {
    return await localAuthRepository.getUserToken();
  }

  @override
  Future<void> deleteToken() async {
    await localAuthRepository.deleteUserToken();
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await localAuthRepository.saveRefreshToken(token);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await localAuthRepository.getRefreshToken();
  }

  @override
  Future<void> deleteRefreshToken() async {
    await localAuthRepository.deleteRefreshToken();
  }

  @override
  Future<User> getMyInfo(String accessToken) async {
    final response =
        await remoteAuthRepository.getMyInfo('Bearer $accessToken');
    if (response is! Map<String, dynamic>) {
      throw Exception('유효하지 않은 내 정보 응답입니다.');
    }
    final responseData = response['data'];
    if (response['success'] != true || responseData is! Map<String, dynamic>) {
      throw Exception('내 정보 조회에 실패했습니다.');
    }

    final dynamic nestedUser = responseData['user'];
    final userData =
        nestedUser is Map<String, dynamic> ? nestedUser : responseData;

    final id = userData['id']?.toString() ?? userData['userId']?.toString();
    final role = userData['role']?.toString();
    final nickname = userData['nickName']?.toString() ??
        userData['nickname']?.toString() ??
        userData['nick_name']?.toString() ??
        userData['displayName']?.toString() ??
        userData['username']?.toString();
    if (id == null || id.isEmpty || role == null || role.isEmpty) {
      throw Exception('유효하지 않은 사용자 응답입니다.');
    }

    final resolvedNickname =
        nickname == null || nickname.isEmpty ? '동아리원' : nickname;
    final profileImage = userData['profileImageUrl']?.toString() ??
        userData['profileImagePath']?.toString() ??
        userData['profileImage']?.toString() ??
        userData['avatarUrl']?.toString() ??
        userData['avatar']?.toString() ??
        userData['picture']?.toString();

    return User(
      id: id,
      nickname: resolvedNickname,
      role: role,
      profileImageUrl: profileImage,
    );
  }

  @override
  Future<void> saveCachedUser(User user) async {
    await localAuthRepository.saveCachedUserJson(
      jsonEncode(user.toJson()),
    );
  }

  @override
  Future<User?> getCachedUser() async {
    final jsonString = await localAuthRepository.getCachedUserJson();
    if (jsonString == null || jsonString.isEmpty) {
      return null;
    }

    try {
      final decoded = jsonDecode(jsonString);
      if (decoded is! Map<String, dynamic>) {
        return null;
      }
      return User.fromJson(decoded);
    } catch (_) {
      await localAuthRepository.deleteCachedUserJson();
      return null;
    }
  }

  @override
  Future<void> deleteCachedUser() async {
    await localAuthRepository.deleteCachedUserJson();
  }
}
