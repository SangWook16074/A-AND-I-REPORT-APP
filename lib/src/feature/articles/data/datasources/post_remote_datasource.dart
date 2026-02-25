import 'dart:convert';

import 'package:a_and_i_report_web_server/src/feature/articles/data/dtos/post_list_response_dto.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/data/dtos/post_response_dto.dart';
import 'package:dio/dio.dart';

/// 게시글 원격 데이터소스입니다.
abstract class PostRemoteDatasource {
  /// 서버에서 게시글 목록을 조회합니다.
  Future<PostListResponseDto> getPosts(
    int page,
    int size,
    String? status,
  );

  /// 서버에 게시글을 생성합니다.
  Future<PostResponseDto> createPost(
    String authorization,
    String title,
    String contentMarkdown,
    String authorId,
    String authorNickname,
    String? authorProfileImageUrl,
    String? status,
    MultipartFile? thumbnail,
  );

  /// 서버에서 게시글 상세를 조회합니다.
  Future<PostResponseDto> getPost(String postId);

  /// 서버의 게시글을 일부 수정합니다.
  Future<PostResponseDto> patchPost(
    String authorization,
    String postId,
    String? title,
    String? contentMarkdown,
    String? status,
    MultipartFile? thumbnail,
  );

  /// 서버에서 게시글을 삭제합니다.
  Future<void> deletePost(String authorization, String postId);

  /// 서버에서 임시저장 게시글 목록을 조회합니다.
  Future<PostListResponseDto> getDraftPosts(
    String authorization,
    int page,
    int size,
  );
}

/// 게시글 원격 데이터소스 구현체입니다.
class PostRemoteDatasourceImpl implements PostRemoteDatasource {
  /// 게시글 원격 데이터소스 구현체를 생성합니다.
  const PostRemoteDatasourceImpl(this.dio);

  /// HTTP 클라이언트입니다.
  final Dio dio;

  @override
  Future<PostListResponseDto> getPosts(
    int page,
    int size,
    String? status,
  ) async {
    final queryParameters = <String, dynamic>{
      'page': page,
      'size': size,
    };
    if (status != null && status.isNotEmpty) {
      queryParameters['status'] = status;
    }

    final response = await dio.get<Map<String, dynamic>>(
      '/v1/posts',
      queryParameters: queryParameters,
      options: Options(
        contentType: 'application/json',
      ),
    );

    final responseData = response.data ?? <String, dynamic>{};
    return PostListResponseDto.fromJson(_extractPayload(responseData));
  }

  @override
  Future<PostResponseDto> createPost(
    String authorization,
    String title,
    String contentMarkdown,
    String authorId,
    String authorNickname,
    String? authorProfileImageUrl,
    String? status,
    MultipartFile? thumbnail,
  ) async {
    final postJson = <String, dynamic>{
      'title': title,
      'contentMarkdown': contentMarkdown,
      'author': <String, dynamic>{
        'id': authorId,
        'nickname': authorNickname,
        if (authorProfileImageUrl != null && authorProfileImageUrl.isNotEmpty)
          'profileImageUrl': authorProfileImageUrl,
      },
      if (status != null && status.isNotEmpty) 'status': status,
    };
    final formDataMap = <String, dynamic>{
      'post': MultipartFile.fromString(
        jsonEncode(postJson),
        filename: 'post.json',
        contentType: DioMediaType.parse('application/json'),
      ),
      if (thumbnail != null) 'thumbnail': thumbnail,
    };

    final response = await dio.post<Map<String, dynamic>>(
      '/v1/posts',
      data: FormData.fromMap(formDataMap),
      options: Options(
        headers: <String, dynamic>{
          'Authorization': authorization,
        },
      ),
    );

    final responseData = response.data ?? <String, dynamic>{};
    return PostResponseDto.fromJson(_extractPayload(responseData));
  }

  @override
  Future<PostResponseDto> getPost(String postId) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/v1/posts/$postId',
      options: Options(
        contentType: 'application/json',
      ),
    );

    final responseData = response.data ?? <String, dynamic>{};
    return PostResponseDto.fromJson(_extractPayload(responseData));
  }

  @override
  Future<PostResponseDto> patchPost(
    String authorization,
    String postId,
    String? title,
    String? contentMarkdown,
    String? status,
    MultipartFile? thumbnail,
  ) async {
    final postJson = <String, dynamic>{
      if (title != null && title.isNotEmpty) 'title': title,
      if (contentMarkdown != null && contentMarkdown.isNotEmpty)
        'contentMarkdown': contentMarkdown,
      if (status != null && status.isNotEmpty) 'status': status,
    };
    final formDataMap = <String, dynamic>{
      'post': MultipartFile.fromString(
        jsonEncode(postJson),
        filename: 'post.json',
        contentType: DioMediaType.parse('application/json'),
      ),
      if (thumbnail != null) 'thumbnail': thumbnail,
    };

    final response = await dio.patch<Map<String, dynamic>>(
      '/v1/posts/$postId',
      data: FormData.fromMap(formDataMap),
      options: Options(
        headers: <String, dynamic>{
          'Authorization': authorization,
        },
      ),
    );

    final responseData = response.data ?? <String, dynamic>{};
    return PostResponseDto.fromJson(_extractPayload(responseData));
  }

  @override
  Future<void> deletePost(String authorization, String postId) async {
    await dio.delete<void>(
      '/v1/posts/$postId',
      options: Options(
        contentType: 'application/json',
        headers: <String, dynamic>{
          'Authorization': authorization,
        },
      ),
    );
  }

  @override
  Future<PostListResponseDto> getDraftPosts(
    String authorization,
    int page,
    int size,
  ) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/v1/posts/drafts',
      queryParameters: <String, dynamic>{
        'page': page,
        'size': size,
      },
      options: Options(
        contentType: 'application/json',
        headers: <String, dynamic>{
          'Authorization': authorization,
        },
      ),
    );

    final responseData = response.data ?? <String, dynamic>{};
    return PostListResponseDto.fromJson(_extractPayload(responseData));
  }

  Map<String, dynamic> _extractPayload(Map<String, dynamic> responseData) {
    final data = responseData['data'];
    if (data is Map<String, dynamic>) {
      return data;
    }
    if (data is Map) {
      return Map<String, dynamic>.from(data);
    }
    return responseData;
  }
}
