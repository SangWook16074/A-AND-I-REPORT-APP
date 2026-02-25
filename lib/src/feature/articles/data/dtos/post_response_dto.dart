import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/data/dtos/post_author_response_dto.dart';

part 'post_response_dto.freezed.dart';
part 'post_response_dto.g.dart';

/// 게시글 단건 응답 DTO입니다.
@freezed
sealed class PostResponseDto with _$PostResponseDto {
  /// 게시글 단건 응답 DTO를 생성합니다.
  const factory PostResponseDto({
    required String id,
    required String title,
    required String contentMarkdown,
    String? thumbnailUrl,
    required PostAuthorResponseDto author,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PostResponseDto;

  /// JSON으로부터 DTO를 생성합니다.
  factory PostResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PostResponseDtoFromJson(json);
}
