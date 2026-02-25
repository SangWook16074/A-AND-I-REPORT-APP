import 'package:a_and_i_report_web_server/src/feature/articles/data/datasources/post_remote_datasource.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/data/dtos/post_author_response_dto.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/data/dtos/post_list_response_dto.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/data/dtos/post_response_dto.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/data/datasources/local/local_auth_datasource.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/create_post_payload.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/patch_post_payload.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/post.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/post_author.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/post_page.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/repositories/post_repository.dart';
import 'package:dio/dio.dart';

/// 게시글 조회 저장소 구현체입니다.
class PostRepositoryImpl implements PostRepository {
  /// 게시글 조회 저장소 구현체를 생성합니다.
  const PostRepositoryImpl({
    required this.postRemoteDatasource,
    required this.localAuthDatasource,
  });

  /// 게시글 원격 데이터소스입니다.
  final PostRemoteDatasource postRemoteDatasource;

  /// 인증 로컬 데이터소스입니다.
  final LocalAuthDatasource localAuthDatasource;

  @override
  Future<PostPage> getPosts({
    int page = 0,
    int size = 20,
    String? status,
  }) async {
    final response = await postRemoteDatasource.getPosts(page, size, status);
    return response.toEntity();
  }

  @override
  Future<Post> createPost({
    required CreatePostPayload payload,
  }) async {
    final authorization = await _resolveAuthorization();
    final imageFile = _toMultipartFile(
      fileName: payload.imageFileName,
      bytes: payload.imageBytes,
    );
    final response = await postRemoteDatasource.createPost(
      authorization,
      payload.title,
      payload.contentMarkdown,
      payload.authorId,
      payload.authorNickname,
      payload.authorProfileImageUrl,
      payload.status,
      imageFile,
    );
    return response.toEntity();
  }

  @override
  Future<Post> getPost({
    required String postId,
  }) async {
    final response = await postRemoteDatasource.getPost(postId);
    return response.toEntity();
  }

  @override
  Future<Post> patchPost({
    required String postId,
    required PatchPostPayload payload,
  }) async {
    final authorization = await _resolveAuthorization();
    final imageFile = _toMultipartFile(
      fileName: payload.imageFileName,
      bytes: payload.imageBytes,
    );
    final response = await postRemoteDatasource.patchPost(
      authorization,
      postId,
      payload.title,
      payload.contentMarkdown,
      payload.status,
      imageFile,
    );
    return response.toEntity();
  }

  @override
  Future<void> deletePost({
    required String postId,
  }) async {
    final authorization = await _resolveAuthorization();
    try {
      await postRemoteDatasource.deletePost(authorization, postId);
    } on DioException catch (e) {
      if (e.response?.statusCode != 403) {
        rethrow;
      }

      await postRemoteDatasource.patchPost(
        authorization,
        postId,
        null,
        null,
        'Deleted',
        null,
      );
    }
  }

  @override
  Future<PostPage> getDraftPosts({
    int page = 0,
    int size = 20,
  }) async {
    final authorization = await _resolveAuthorization();
    final response = await postRemoteDatasource.getDraftPosts(
      authorization,
      page,
      size,
    );
    return response.toEntity();
  }

  Future<String> _resolveAuthorization() async {
    final token = await localAuthDatasource.getUserToken();
    if (token == null || token.isEmpty) {
      throw Exception('로그인이 필요합니다.');
    }
    return 'Bearer $token';
  }

  MultipartFile? _toMultipartFile({
    required String? fileName,
    required List<int>? bytes,
  }) {
    if (bytes == null || bytes.isEmpty) {
      return null;
    }
    if (fileName == null || fileName.isEmpty) {
      return null;
    }
    return MultipartFile.fromBytes(
      bytes,
      filename: fileName,
    );
  }
}

extension on PostListResponseDto {
  /// DTO를 도메인 엔티티로 변환합니다.
  PostPage toEntity() {
    return PostPage(
      items: items.map((item) => item.toEntity()).toList(),
      page: page,
      size: size,
      totalElements: totalElements,
      totalPages: totalPages,
    );
  }
}

extension on PostResponseDto {
  /// DTO를 도메인 엔티티로 변환합니다.
  Post toEntity() {
    return Post(
      id: id,
      title: title,
      contentMarkdown: contentMarkdown,
      thumbnailUrl: thumbnailUrl,
      author: author.toEntity(),
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension on PostAuthorResponseDto {
  /// DTO를 도메인 엔티티로 변환합니다.
  PostAuthor toEntity() {
    return PostAuthor(
      id: id,
      nickname: nickname,
      profileImage: profileImage,
    );
  }
}
