import 'package:a_and_i_report_web_server/src/feature/articles/providers/article_post_providers.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/post.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/ui/viewModels/article_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'article_list_view_model.g.dart';

/// 게시글 목록 화면 상태를 관리하는 ViewModel입니다.
@riverpod
class ArticleListViewModel extends _$ArticleListViewModel {
  final Map<String, Post> _recentPublishedOverrides = <String, Post>{};

  /// 초기 목록 상태를 로드합니다.
  @override
  Future<ArticleListState> build() async {
    ref.keepAlive();
    return _fetch();
  }

  /// 목록을 다시 불러옵니다.
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _fetch());
  }

  /// 출간된 게시글을 목록에 즉시 반영합니다.
  void upsertPublishedPost(Post post) {
    if (!_isPublished(post.status)) {
      return;
    }

    _recentPublishedOverrides[post.id] = post;

    final current = state.valueOrNull;
    if (current == null) {
      return;
    }

    final mergedItems = _mergeWithRecentPublished(current.items);
    final totalElements = current.totalElements < mergedItems.length
        ? mergedItems.length
        : current.totalElements;
    state = AsyncData(
      current.copyWith(
        items: mergedItems,
        totalElements: totalElements,
        totalPages: _resolveTotalPages(
          size: current.size,
          totalElements: totalElements,
          fallback: current.totalPages,
        ),
        errorMsg: '',
      ),
    );
  }

  Future<ArticleListState> _fetch({
    int page = 0,
    int size = 20,
  }) async {
    try {
      final response = await ref
          .read(getPostListUsecaseProvider)
          .call(page: page, size: size);
      final mergedItems = _mergeWithRecentPublished(response.items);
      final totalElements = response.totalElements < mergedItems.length
          ? mergedItems.length
          : response.totalElements;
      return ArticleListState(
        items: mergedItems,
        page: response.page,
        size: response.size,
        totalElements: totalElements,
        totalPages: _resolveTotalPages(
          size: response.size,
          totalElements: totalElements,
          fallback: response.totalPages,
        ),
      );
    } catch (e) {
      return ArticleListState(errorMsg: e.toString());
    }
  }

  List<Post> _mergeWithRecentPublished(List<Post> baseItems) {
    final mergedById = <String, Post>{
      for (final item in baseItems) item.id: item,
      ..._recentPublishedOverrides,
    };
    final merged = mergedById.values.toList()..sort(_compareByLatestFirst);
    return merged;
  }

  bool _isPublished(String status) {
    return status.trim().toLowerCase() == 'published';
  }

  int _compareByLatestFirst(Post a, Post b) {
    final updatedCompare = b.updatedAt.compareTo(a.updatedAt);
    if (updatedCompare != 0) {
      return updatedCompare;
    }
    final createdCompare = b.createdAt.compareTo(a.createdAt);
    if (createdCompare != 0) {
      return createdCompare;
    }
    return b.id.compareTo(a.id);
  }

  int _resolveTotalPages({
    required int size,
    required int totalElements,
    required int fallback,
  }) {
    if (size <= 0) {
      return fallback;
    }
    final calculated = (totalElements / size).ceil();
    if (calculated <= 0) {
      return fallback;
    }
    return calculated;
  }
}
