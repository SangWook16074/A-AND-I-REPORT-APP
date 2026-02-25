// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_author_response_dto.freezed.dart';
part 'post_author_response_dto.g.dart';

Object? _readProfileImage(Map<dynamic, dynamic> json, String _) {
  return json['profileImage'] ?? json['profileImageUrl'];
}

/// 게시글 작성자 응답 DTO입니다.
@freezed
sealed class PostAuthorResponseDto with _$PostAuthorResponseDto {
  /// 게시글 작성자 응답 DTO를 생성합니다.
  const factory PostAuthorResponseDto({
    required String id,
    required String nickname,
    @JsonKey(readValue: _readProfileImage) String? profileImage,
  }) = _PostAuthorResponseDto;

  /// JSON으로부터 DTO를 생성합니다.
  factory PostAuthorResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PostAuthorResponseDtoFromJson(json);
}
