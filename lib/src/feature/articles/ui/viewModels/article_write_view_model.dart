import 'dart:typed_data';

import 'package:a_and_i_report_web_server/src/core/auth/role_policy.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_state.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/create_post_payload.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/image_upload_payload.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/patch_post_payload.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/post.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/post_author.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/providers/article_post_providers.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/ui/viewModels/article_list_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/ui/viewModels/article_write_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'article_write_view_model.g.dart';

/// 블로그 작성/출간 상태를 관리하는 ViewModel입니다.
@Riverpod(keepAlive: true)
class ArticleWriteViewModel extends _$ArticleWriteViewModel {
  @override
  ArticleWriteState build() {
    return const ArticleWriteState();
  }

  /// 작성 중인 초안의 제목/본문을 동기화합니다.
  void syncDraft({
    required String title,
    required String contentMarkdown,
  }) {
    state = state.copyWith(
      title: title,
      contentMarkdown: contentMarkdown,
      errorMsg: '',
      successMsg: '',
    );
  }

  /// 포스트 요약을 업데이트합니다.
  void setSummary(String summary) {
    state = state.copyWith(
      summary: summary,
      errorMsg: '',
      successMsg: '',
    );
  }

  /// 썸네일 URL을 업데이트합니다.
  void setThumbnailUrl(String? thumbnailUrl) {
    state = state.copyWith(
      thumbnailUrl: thumbnailUrl,
      thumbnailBytes: null,
      thumbnailFileName: null,
      errorMsg: '',
      successMsg: '',
    );
  }

  /// 썸네일 이미지를 로컬에서 선택합니다.
  void setThumbnailImage({
    required String fileName,
    required Uint8List bytes,
  }) {
    state = state.copyWith(
      thumbnailUrl: null,
      thumbnailBytes: bytes,
      thumbnailFileName: fileName,
      errorMsg: '',
      successMsg: '',
    );
  }

  /// 태그를 추가합니다.
  void addTag(String tag) {
    final normalized = tag.trim();
    if (normalized.isEmpty) {
      return;
    }
    final alreadyExists = state.tags.any(
      (value) => value.toLowerCase() == normalized.toLowerCase(),
    );
    if (alreadyExists) {
      return;
    }
    state = state.copyWith(
      tags: <String>[...state.tags, normalized],
      errorMsg: '',
      successMsg: '',
    );
  }

  /// 태그를 제거합니다.
  void removeTag(String tag) {
    state = state.copyWith(
      tags: state.tags.where((value) => value != tag).toList(),
      errorMsg: '',
      successMsg: '',
    );
  }

  /// 이미지 바이트를 업로드하고 URL을 반환합니다.
  Future<String?> uploadImage({
    required String fileName,
    required Uint8List bytes,
  }) async {
    try {
      _ensureCanManageArticles();
      state = state.copyWith(
        isUploadingImage: true,
        errorMsg: '',
        successMsg: '',
      );
      final result = await ref.read(imageRepositoryProvider).uploadImage(
            payload: ImageUploadPayload(
              fileName: fileName,
              bytes: bytes,
            ),
          );
      state = state.copyWith(
        isUploadingImage: false,
        errorMsg: '',
      );
      return result.url;
    } catch (e) {
      state = state.copyWith(
        isUploadingImage: false,
        errorMsg: e.toString(),
      );
      return null;
    }
  }

  /// 현재 작성 내용을 임시저장합니다.
  Future<bool> saveDraft({
    required String title,
    required String contentMarkdown,
  }) async {
    return _submit(
      title: title,
      contentMarkdown: contentMarkdown,
      status: 'Draft',
      successMsg: '임시저장되었습니다.',
    );
  }

  /// 현재 작성 내용을 출간합니다.
  Future<bool> publish({
    required String title,
    required String contentMarkdown,
  }) async {
    return _submit(
      title: title,
      contentMarkdown: contentMarkdown,
      status: 'Published',
      successMsg: '포스트가 출간되었습니다.',
    );
  }

  /// 작성 상태를 초기화합니다.
  void reset() {
    state = const ArticleWriteState();
  }

  Future<bool> _submit({
    required String title,
    required String contentMarkdown,
    required String status,
    required String successMsg,
  }) async {
    final normalizedTitle = title.trim();
    final normalizedContent = contentMarkdown.trim();
    if (normalizedTitle.isEmpty) {
      state = state.copyWith(errorMsg: '제목을 입력해주세요.', successMsg: '');
      return false;
    }
    if (normalizedContent.isEmpty) {
      state = state.copyWith(errorMsg: '본문을 입력해주세요.', successMsg: '');
      return false;
    }
    final hasThumbnailImage = (state.thumbnailBytes?.isNotEmpty ?? false) &&
        (state.thumbnailFileName?.isNotEmpty ?? false);
    if (!hasThumbnailImage) {
      state = state.copyWith(
        errorMsg: '썸네일 이미지를 선택해주세요.',
        successMsg: '',
      );
      return false;
    }

    try {
      _ensureCanManageArticles();
      final authorInfo = _resolveAuthorInfo();
      state = state.copyWith(
        isSubmitting: true,
        title: normalizedTitle,
        contentMarkdown: normalizedContent,
        errorMsg: '',
        successMsg: '',
      );

      final imageFileName = state.thumbnailFileName;
      final imageBytes = state.thumbnailBytes;

      if (state.postId.isEmpty) {
        final createdPost = await ref.read(postRepositoryProvider).createPost(
              payload: CreatePostPayload(
                title: normalizedTitle,
                contentMarkdown: normalizedContent,
                authorId: authorInfo.id,
                authorNickname: authorInfo.nickname,
                authorProfileImageUrl: authorInfo.profileImageUrl,
                status: status,
                imageFileName: imageFileName,
                imageBytes: imageBytes,
              ),
            );

        state = state.copyWith(
          postId: createdPost.id,
          title: createdPost.title,
          contentMarkdown: createdPost.contentMarkdown,
          isSubmitting: false,
          successMsg: successMsg,
        );
        _syncPublishedPostToList(createdPost);
        return true;
      }

      final patchedPost = await ref.read(postRepositoryProvider).patchPost(
            postId: state.postId,
            payload: PatchPostPayload(
              title: normalizedTitle,
              contentMarkdown: normalizedContent,
              status: status,
              imageFileName: imageFileName,
              imageBytes: imageBytes,
            ),
          );

      state = state.copyWith(
        postId: patchedPost.id,
        title: patchedPost.title,
        contentMarkdown: patchedPost.contentMarkdown,
        isSubmitting: false,
        successMsg: successMsg,
      );
      _syncPublishedPostToList(patchedPost);
      return true;
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        errorMsg: e.toString(),
        successMsg: '',
      );
      return false;
    }
  }

  void _ensureCanManageArticles() {
    final role = ref.read(userViewModelProvider).resolvedRole;
    if (!canManageArticlesWithRole(role)) {
      throw Exception('ORGANIZER 이상 권한이 필요합니다.');
    }
  }

  ({String id, String nickname, String? profileImageUrl}) _resolveAuthorInfo() {
    final userState = ref.read(userViewModelProvider);
    final userId = userState.userId;
    if (userId == null || userId.isEmpty) {
      throw Exception('사용자 정보를 확인할 수 없습니다.');
    }
    final nickname = userState.nickname;
    if (nickname == null || nickname.trim().isEmpty) {
      throw Exception('사용자 닉네임을 확인할 수 없습니다.');
    }

    return (
      id: userId,
      nickname: nickname.trim(),
      profileImageUrl: userState.profileImageUrl?.trim(),
    );
  }

  void _syncPublishedPostToList(Post post) {
    if (post.status.trim().toLowerCase() != 'published') {
      return;
    }

    final userState = ref.read(userViewModelProvider);
    final userNickname = userState.nickname?.trim();
    final userProfileImage = userState.profileImageUrl?.trim();
    final normalizedNickname = userNickname != null && userNickname.isNotEmpty
        ? userNickname
        : post.author.nickname;
    final normalizedProfileImage =
        userProfileImage != null && userProfileImage.isNotEmpty
            ? userProfileImage
            : post.author.profileImage;

    final normalizedPost = Post(
      id: post.id,
      title: post.title,
      contentMarkdown: post.contentMarkdown,
      thumbnailUrl: post.thumbnailUrl,
      author: PostAuthor(
        id: post.author.id,
        nickname: normalizedNickname,
        profileImage: normalizedProfileImage,
      ),
      status: post.status,
      createdAt: post.createdAt,
      updatedAt: post.updatedAt,
    );

    ref
        .read(articleListViewModelProvider.notifier)
        .upsertPublishedPost(normalizedPost);
  }
}
