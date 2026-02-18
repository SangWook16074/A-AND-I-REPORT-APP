import 'package:freezed_annotation/freezed_annotation.dart';

part 'activate_request_dto.freezed.dart';
part 'activate_request_dto.g.dart';

/// 계정 활성화 API 요청 본문 DTO입니다.
@freezed
abstract class ActivateRequestDto with _$ActivateRequestDto {
  const factory ActivateRequestDto({
    /// 초대 링크의 1회성 활성화 토큰
    required String token,

    /// 사용자가 설정할 최초 비밀번호
    required String password,
  }) = _ActivateRequestDto;

  factory ActivateRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ActivateRequestDtoFromJson(json);
}
