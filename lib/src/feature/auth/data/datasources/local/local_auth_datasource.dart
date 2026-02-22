abstract class LocalAuthDatasource {
  /// 저장된 액세스 토큰을 조회한다.
  Future<String?> getUserToken();

  /// 액세스 토큰을 저장한다.
  Future<void> saveUserToken(String token);

  /// 저장된 액세스 토큰을 삭제한다.
  Future<void> deleteUserToken();

  /// 저장된 리프레시 토큰을 조회한다.
  Future<String?> getRefreshToken();

  /// 리프레시 토큰을 저장한다.
  Future<void> saveRefreshToken(String token);

  /// 저장된 리프레시 토큰을 삭제한다.
  Future<void> deleteRefreshToken();

  /// 캐시된 사용자 JSON 문자열을 조회한다.
  Future<String?> getCachedUserJson();

  /// 사용자 JSON 문자열을 캐시 저장한다.
  Future<void> saveCachedUserJson(String userJson);

  /// 캐시된 사용자 정보를 삭제한다.
  Future<void> deleteCachedUserJson();
}
