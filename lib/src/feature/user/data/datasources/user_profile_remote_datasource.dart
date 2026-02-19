import 'dart:typed_data';

import 'package:a_and_i_report_web_server/src/core/models/user.dart';
import 'package:dio/dio.dart';

/// 내 정보 수정 네트워크 오류다.
class UpdateMyProfileNetworkException implements Exception {}

/// 내 정보 수정 요청/응답 오류다.
class UpdateMyProfileRequestException implements Exception {}

/// 사용자 프로필 원격 데이터소스다.
class UserProfileRemoteDatasource {
  UserProfileRemoteDatasource(
    this.dio, {
    required String baseUrl,
  }) : _baseUrl = baseUrl;

  final Dio dio;
  final String _baseUrl;

  /// `/v1/me` 프로필 수정 API를 호출한다.
  Future<User> patchMyProfile({
    required String authorization,
    required String nickname,
    Uint8List? profileImageBytes,
    String? profileImageFileName,
    String? profileImageMimeType,
  }) async {
    try {
      final formDataMap = <String, dynamic>{
        'nickname': nickname,
      };

      if (profileImageBytes != null && profileImageBytes.isNotEmpty) {
        final resolvedFileName = profileImageFileName ??
            _resolveDefaultFileName(profileImageMimeType);
        formDataMap['profileImage'] = MultipartFile.fromBytes(
          profileImageBytes,
          filename: resolvedFileName,
        );
      }

      final response = await dio.patch(
        _buildUrl('/v1/me'),
        data: FormData.fromMap(formDataMap),
        options: Options(
          headers: {
            'Authorization': authorization,
          },
        ),
      );

      return _parseUser(response);
    } on DioException catch (error) {
      final isNetworkError = error.type == DioExceptionType.connectionError ||
          error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.unknown;
      if (isNetworkError) {
        throw UpdateMyProfileNetworkException();
      }
      throw UpdateMyProfileRequestException();
    } catch (_) {
      throw UpdateMyProfileRequestException();
    }
  }

  String _resolveDefaultFileName(String? mimeType) {
    if (mimeType == null || mimeType.isEmpty) {
      return 'profile.jpg';
    }
    if (mimeType.contains('webp')) {
      return 'profile.webp';
    }
    if (mimeType.contains('png')) {
      return 'profile.png';
    }
    return 'profile.jpg';
  }

  String _buildUrl(String endpoint) {
    if (_baseUrl.trim().isEmpty) {
      return endpoint;
    }
    return Uri.parse(_baseUrl).resolve(endpoint).toString();
  }

  User _parseUser(Response<dynamic> response) {
    final responseData = response.data;
    if (responseData is! Map<String, dynamic>) {
      throw UpdateMyProfileRequestException();
    }

    final isSuccess = responseData['success'] == true;
    final data = responseData['data'];
    if (!isSuccess || data is! Map<String, dynamic>) {
      throw UpdateMyProfileRequestException();
    }

    final id = data['id']?.toString();
    final role = data['role']?.toString();
    final nickname =
        data['nickname']?.toString() ?? data['username']?.toString();
    if (id == null || role == null || nickname == null || nickname.isEmpty) {
      throw UpdateMyProfileRequestException();
    }

    return User(
      id: id,
      role: role,
      nickname: nickname,
      profileImageUrl: data['profileImageUrl']?.toString(),
    );
  }
}
