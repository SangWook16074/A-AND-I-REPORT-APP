import 'package:a_and_i_report_web_server/src/core/models/user.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_state.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/create_post_payload.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/patch_post_payload.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/post.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/post_author.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/post_page.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/repositories/post_repository.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/providers/article_post_providers.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/ui/viewModels/article_write_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group('ArticleWriteViewModel', () {
    test('임시저장은 제목만으로도 성공한다', () async {
      final fakeRepository = FakePostRepository();
      final container = ProviderContainer(
        overrides: [
          userViewModelProvider.overrideWith(FakeUserViewModel.new),
          postRepositoryProvider.overrideWithValue(fakeRepository),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(articleWriteViewModelProvider.notifier);
      notifier.setSummary('임시 요약');
      final result = await notifier.saveDraft(
        title: '임시 제목',
        contentMarkdown: '   ',
      );

      expect(result, isTrue);
      expect(fakeRepository.createCallCount, 1);
      expect(fakeRepository.lastCreatePayload?.status, 'Draft');
      expect(fakeRepository.lastCreatePayload?.contentMarkdown, '');
      expect(fakeRepository.lastCreatePayload?.summary, '임시 요약');
      expect(fakeRepository.lastCreatePayload?.imageFileName, isNull);
      expect(fakeRepository.lastCreatePayload?.imageBytes, isNull);
      expect(container.read(articleWriteViewModelProvider).errorMsg, isEmpty);
    });

    test('출간은 썸네일 없이도 성공한다', () async {
      final fakeRepository = FakePostRepository();
      final container = ProviderContainer(
        overrides: [
          userViewModelProvider.overrideWith(FakeUserViewModel.new),
          postRepositoryProvider.overrideWithValue(fakeRepository),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(articleWriteViewModelProvider.notifier);
      final result = await notifier.publish(
        title: '출간 제목',
        contentMarkdown: '출간 본문',
      );

      expect(result, isTrue);
      expect(fakeRepository.createCallCount, 1);
      expect(fakeRepository.lastCreatePayload?.status, 'Published');
      expect(container.read(articleWriteViewModelProvider).errorMsg, isEmpty);
    });

    test('출간은 본문이 없으면 실패한다', () async {
      final fakeRepository = FakePostRepository();
      final container = ProviderContainer(
        overrides: [
          userViewModelProvider.overrideWith(FakeUserViewModel.new),
          postRepositoryProvider.overrideWithValue(fakeRepository),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(articleWriteViewModelProvider.notifier);
      final result = await notifier.publish(
        title: '출간 제목',
        contentMarkdown: '   ',
      );

      expect(result, isFalse);
      expect(fakeRepository.createCallCount, 0);
      expect(
        container.read(articleWriteViewModelProvider).errorMsg,
        '본문을 입력해주세요.',
      );
    });

    test('수정 모드에서 출간하면 patchPost로 수정한다', () async {
      final fakeRepository = FakePostRepository();
      final container = ProviderContainer(
        overrides: [
          userViewModelProvider.overrideWith(FakeUserViewModel.new),
          postRepositoryProvider.overrideWithValue(fakeRepository),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(articleWriteViewModelProvider.notifier);
      notifier.startEditing(
        Post(
          id: 'post-edit-1',
          title: '기존 제목',
          contentMarkdown: '기존 본문',
          thumbnailUrl: 'https://example.com/thumbnail.webp',
          author: const PostAuthor(
            id: 'user-1',
            nickname: '멘토',
          ),
          collaborators: const <PostAuthor>[
            PostAuthor(
              id: 'collaborator-1',
              nickname: '협업자',
            ),
          ],
          status: 'Published',
          createdAt: DateTime.parse('2026-01-01T00:00:00Z'),
          updatedAt: DateTime.parse('2026-01-01T00:00:00Z'),
        ),
      );

      final result = await notifier.publish(
        title: '수정 제목',
        contentMarkdown: '수정 본문',
      );

      expect(result, isTrue);
      expect(fakeRepository.createCallCount, 0);
      expect(fakeRepository.patchCallCount, 1);
      expect(fakeRepository.lastPatchPostId, 'post-edit-1');
      expect(fakeRepository.lastPatchPayload?.status, 'Published');
      expect(fakeRepository.lastPatchPayload?.summary, '');
      expect(fakeRepository.lastPatchPayload?.collaborators.length, 1);
      expect(
        container.read(articleWriteViewModelProvider).successMsg,
        '포스트가 수정되었습니다.',
      );
    });

    test('임시저장 글 수정 후 출간하면 출간 문구를 사용한다', () async {
      final fakeRepository = FakePostRepository();
      final container = ProviderContainer(
        overrides: [
          userViewModelProvider.overrideWith(FakeUserViewModel.new),
          postRepositoryProvider.overrideWithValue(fakeRepository),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(articleWriteViewModelProvider.notifier);
      notifier.startEditing(
        Post(
          id: 'post-draft-1',
          title: '임시 제목',
          contentMarkdown: '임시 본문',
          author: const PostAuthor(
            id: 'user-1',
            nickname: '멘토',
          ),
          status: 'Draft',
          createdAt: DateTime.parse('2026-01-01T00:00:00Z'),
          updatedAt: DateTime.parse('2026-01-01T00:00:00Z'),
        ),
      );

      final result = await notifier.publish(
        title: '출간 제목',
        contentMarkdown: '출간 본문',
      );

      expect(result, isTrue);
      expect(fakeRepository.patchCallCount, 1);
      expect(
        container.read(articleWriteViewModelProvider).successMsg,
        '포스트가 출간되었습니다.',
      );
    });

    test('자동 임시저장은 변경사항이 있을 때만 저장한다', () async {
      final fakeRepository = FakePostRepository();
      final container = ProviderContainer(
        overrides: [
          userViewModelProvider.overrideWith(FakeUserViewModel.new),
          postRepositoryProvider.overrideWithValue(fakeRepository),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(articleWriteViewModelProvider.notifier);
      final firstResult = await notifier.autoSaveDraft(
        title: '자동저장 제목',
        contentMarkdown: '자동저장 본문',
      );
      final secondResult = await notifier.autoSaveDraft(
        title: '자동저장 제목',
        contentMarkdown: '자동저장 본문',
      );

      expect(firstResult, isTrue);
      expect(secondResult, isFalse);
      expect(fakeRepository.createCallCount, 1);
    });

    test('자동 임시저장은 제목이 없으면 저장하지 않는다', () async {
      final fakeRepository = FakePostRepository();
      final container = ProviderContainer(
        overrides: [
          userViewModelProvider.overrideWith(FakeUserViewModel.new),
          postRepositoryProvider.overrideWithValue(fakeRepository),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(articleWriteViewModelProvider.notifier);
      final result = await notifier.autoSaveDraft(
        title: '   ',
        contentMarkdown: '내용만 입력',
      );

      expect(result, isFalse);
      expect(fakeRepository.createCallCount, 0);
    });
  });
}

class FakeUserViewModel extends UserViewModel {
  @override
  UserViewState build() {
    return const UserViewState(
      status: UserStatus.authenticated,
      user: User(
        id: 'user-1',
        nickname: '멘토',
        role: 'ORGANIZER',
      ),
    );
  }
}

class FakePostRepository implements PostRepository {
  int createCallCount = 0;
  int patchCallCount = 0;
  CreatePostPayload? lastCreatePayload;
  String? lastPatchPostId;
  PatchPostPayload? lastPatchPayload;
  String? patchResponseSummaryOverride;

  @override
  Future<Post> createPost({required CreatePostPayload payload}) async {
    createCallCount += 1;
    lastCreatePayload = payload;
    return Post(
      id: 'post-1',
      title: payload.title,
      contentMarkdown: payload.contentMarkdown,
      summary: payload.summary,
      thumbnailUrl: null,
      author: PostAuthor(
        id: payload.authorId,
        nickname: payload.authorNickname,
        profileImage: payload.authorProfileImageUrl,
      ),
      status: payload.status ?? 'Draft',
      createdAt: DateTime.parse('2026-01-01T00:00:00Z'),
      updatedAt: DateTime.parse('2026-01-01T00:00:00Z'),
    );
  }

  @override
  Future<void> deletePost({required String postId}) async {}

  @override
  Future<PostPage> getDraftPosts({int page = 0, int size = 20}) async {
    return const PostPage(
      items: <Post>[],
      page: 0,
      size: 20,
      totalElements: 0,
      totalPages: 0,
    );
  }

  @override
  Future<Post> getPost({required String postId}) async {
    throw UnimplementedError();
  }

  @override
  Future<PostPage> getPosts(
      {int page = 0, int size = 20, String? status}) async {
    return const PostPage(
      items: <Post>[],
      page: 0,
      size: 20,
      totalElements: 0,
      totalPages: 0,
    );
  }

  @override
  Future<Post> patchPost({
    required String postId,
    required PatchPostPayload payload,
  }) async {
    patchCallCount += 1;
    lastPatchPostId = postId;
    lastPatchPayload = payload;
    return Post(
      id: postId,
      title: payload.title ?? 'title',
      contentMarkdown: payload.contentMarkdown ?? 'content',
      summary: patchResponseSummaryOverride ?? payload.summary,
      thumbnailUrl: 'https://example.com/thumbnail.webp',
      author: const PostAuthor(
        id: 'user-1',
        nickname: '멘토',
      ),
      collaborators: payload.collaborators,
      status: payload.status ?? 'Draft',
      createdAt: DateTime.parse('2026-01-01T00:00:00Z'),
      updatedAt: DateTime.parse('2026-01-02T00:00:00Z'),
    );
  }
}
