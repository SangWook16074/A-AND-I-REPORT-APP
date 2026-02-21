import 'dart:convert';

import 'package:a_and_i_report_web_server/src/feature/auth/data/datasources/local/local_auth_datasource.dart';
import 'package:web/web.dart';

final class LocalAuthDatasourceImpl implements LocalAuthDatasource {
  static const _tokenKey = 'access-token';
  static const _cachedUserKey = 'cached-user';

  /// 로컬 스토리지에 jwt 저장
  ///
  ///
  @override
  Future<void> saveUserToken(String token) async {
    window.localStorage.setItem(_tokenKey, token);
  }

  /// 로컬 스토리지로부터 jwt 읽어오기
  ///
  ///
  @override
  Future<String?> getUserToken() async {
    return window.localStorage.getItem(_tokenKey);
  }

  /// 로컬 스토리지로부터 jwt 삭제
  ///
  ///
  @override
  Future<void> deleteUserToken() async {
    window.localStorage.removeItem(_tokenKey);
  }

  @override
  Future<String?> getCachedUserJson() async {
    final encoded = window.localStorage.getItem(_cachedUserKey);
    if (encoded == null || encoded.isEmpty) {
      return null;
    }

    try {
      return utf8.decode(base64Decode(encoded));
    } catch (_) {
      window.localStorage.removeItem(_cachedUserKey);
      return null;
    }
  }

  @override
  Future<void> saveCachedUserJson(String userJson) async {
    final encoded = base64Encode(utf8.encode(userJson));
    window.localStorage.setItem(_cachedUserKey, encoded);
  }

  @override
  Future<void> deleteCachedUserJson() async {
    window.localStorage.removeItem(_cachedUserKey);
  }
}
