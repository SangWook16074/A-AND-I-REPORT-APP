import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_dto.freezed.dart';
part 'login_response_dto.g.dart';

/// 로그인 API의 최상위 응답 DTO(ApiResponseLoginResponse)입니다.
@freezed
abstract class LoginResponseDto with _$LoginResponseDto {
  const factory LoginResponseDto({
    required bool success,
    LoginDataDto? data,
    ApiErrorDto? error,
    String? timestamp,
  }) = _LoginResponseDto;

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);
}

/// 로그인 API의 data 필드 DTO입니다.
@freezed
abstract class LoginDataDto with _$LoginDataDto {
  const factory LoginDataDto({
    required String accessToken,
    required String refreshToken,
    required int expiresIn,
    required String tokenType,
    required bool forcePasswordChange,
    required LoginUserDto user,
  }) = _LoginDataDto;

  factory LoginDataDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDataDtoFromJson(json);
}

/// 로그인 사용자 정보 DTO입니다.
@freezed
abstract class LoginUserDto with _$LoginUserDto {
  const factory LoginUserDto({
    required String id,
    required String username,
    required String role,
  }) = _LoginUserDto;

  factory LoginUserDto.fromJson(Map<String, dynamic> json) =>
      _$LoginUserDtoFromJson(json);
}

/// 공통 API 에러 DTO입니다.
@freezed
abstract class ApiErrorDto with _$ApiErrorDto {
  const factory ApiErrorDto({
    String? code,
    String? message,
  }) = _ApiErrorDto;

  factory ApiErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorDtoFromJson(json);
}
