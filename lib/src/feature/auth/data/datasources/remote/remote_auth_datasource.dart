import 'package:a_and_i_report_web_server/src/feature/auth/data/dtos/login_request_dto.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/data/dtos/login_response_dto.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'remote_auth_datasource.g.dart';

@RestApi()
abstract class RemoteAuthDatasource {
  factory RemoteAuthDatasource(Dio dio, {String baseUrl}) =
      _RemoteAuthDatasource;

  /// 로그인 API
  ///
  ///
  @POST("/v1/auth/login")
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<LoginResponseDto> login(@Body() LoginRequestDto dto);

  /// 내 정보 조회 API
  @GET("/v1/me")
  Future<dynamic> getMyInfo(
    @Header("Authorization") String authorization,
  );

  /// 토큰 갱신 API
  @POST("/v1/auth/refresh")
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<LoginResponseDto> refreshToken(@Body() Map<String, dynamic> body);
}
