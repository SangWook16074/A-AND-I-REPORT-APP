import 'package:aandi_tech_blog/aandi_tech_blog.dart';
import 'package:markdown/markdown.dart' as md;

/// 공개 블로그 조회 유스케이스를 HTML UI가 쓰기 쉬운 형태로 제공합니다.
///
/// 썸네일/요약/날짜 규칙은 기존 Flutter 화면(`ArticleListView`, `HomeLatestPostsSection`,
/// `ArticleDetailView`)과 동일하게 맞춥니다.
class BlogService {
  /// [client]를 주입하면 테스트에서 네트워크 없이 검증할 수 있습니다.
  BlogService({required TechBlogApiClient client}) : _client = client;

  final TechBlogApiClient _client;

  /// 기존 목록 화면과 동일한 페이지 크기입니다.
  static const int defaultPageSize = 20;

  /// 블로그 목록을 페이지 단위로 조회합니다.
  Future<Map<String, Object?>> list({
    int page = 0,
    int size = defaultPageSize,
  }) async {
    final response = await _client.listBlogs(page: page, size: size);
    return {
      'items': response.items.map(_summaryToJson).toList(growable: false),
      'page': response.page,
      'hasNext': response.page + 1 < response.totalPages,
    };
  }

  /// 홈 "동아리 소식"에 노출할 최신 게시글을 조회합니다. (게시됨만, 최대 [limit]개)
  Future<Map<String, Object?>> latest({int limit = 3}) async {
    final response = await _client.listBlogs(page: 0, size: defaultPageSize);
    final items = response.items
        .where((post) => post.status == PostStatus.published)
        .take(limit)
        .map(_summaryToJson)
        .toList(growable: false);
    return {'items': items};
  }

  /// 블로그 상세를 조회하고 Markdown 본문을 HTML로 렌더링합니다.
  ///
  /// 반환되는 `contentHtml`은 신뢰할 수 없는 입력이므로 UI에서 반드시 sanitize 후 삽입합니다.
  Future<Map<String, Object?>> detail(String id) async {
    final post = await _client.getBlog(postId: id);
    final markdown = normalizeMarkdown(post.contentMarkdown ?? '');
    final updatedAt = post.updatedAt ?? post.createdAt;
    return {
      'id': post.id,
      'title': post.title,
      'authorNickname': post.author.nickname ?? '',
      'authorProfileImage': _validHttpUrl(post.author.profileImageUrl),
      'dateLabel': updatedAt == null ? '' : formatDotDate(updatedAt),
      'status': post.status.toApi(),
      'statusLabel': _statusLabel(post.status),
      'thumbnailUrl':
          _validHttpUrl(post.thumbnailUrl) ?? extractFirstImageUrl(markdown),
      'contentHtml': renderMarkdown(markdown),
    };
  }

  /// Markdown 문자열을 HTML로 변환합니다.
  static String renderMarkdown(String source) {
    return md.markdownToHtml(
      source,
      extensionSet: md.ExtensionSet.gitHubWeb,
    );
  }

  /// 인용문 줄바꿈을 기존 미리보기와 동일하게 정규화합니다.
  static String normalizeMarkdown(String source) {
    if (!source.contains('>\n')) {
      return source;
    }
    return source
        .replaceAllMapped(
          RegExp(r'>\s*\n([^\n])'),
          (m) => '> ${m.group(1)}',
        )
        .replaceAllMapped(
          RegExp(r'(^|\n)>\s*\n(?=\n|$)'),
          (m) => '${m.group(1)}> ',
        );
  }

  /// `2026년 6월 2일` 형식(로컬 시간)으로 변환합니다.
  static String formatKoreanDate(DateTime dateTime) {
    final local = dateTime.toLocal();
    return '${local.year}년 ${local.month}월 ${local.day}일';
  }

  /// `2026.06.02` 형식으로 변환합니다.
  static String formatDotDate(DateTime dateTime) {
    return '${dateTime.year.toString().padLeft(4, '0')}.'
        '${dateTime.month.toString().padLeft(2, '0')}.'
        '${dateTime.day.toString().padLeft(2, '0')}';
  }

  /// Markdown 본문에서 첫 번째 http(s) 이미지 URL을 추출합니다.
  static String? extractFirstImageUrl(String markdown) {
    final match = RegExp(r'!\[[^\]]*\]\(([^)\s]+)').firstMatch(markdown);
    if (match == null) {
      return null;
    }
    final sanitized =
        (match.group(1) ?? '').trim().replaceAll('<', '').replaceAll('>', '');
    return _validHttpUrl(sanitized);
  }

  Map<String, Object?> _summaryToJson(PostResponse post) {
    final markdown = post.contentMarkdown ?? '';
    final createdAt = post.createdAt ?? post.publishedAt;
    return {
      'id': post.id,
      'title': post.title,
      'summary': _resolveSummary(post, extractedMaxLength: 30),
      'homeSummary': _resolveSummary(post, extractedMaxLength: 120),
      'thumbnailUrl':
          _validHttpUrl(post.thumbnailUrl) ?? extractFirstImageUrl(markdown),
      'authorNickname': post.author.nickname ?? '',
      'authorProfileImage': _validHttpUrl(post.author.profileImageUrl),
      'status': post.status.toApi().toUpperCase(),
      'dateLabel': createdAt == null ? '' : formatKoreanDate(createdAt),
    };
  }

  /// 요약이 있으면 120자, 없으면 본문에서 추출해 [extractedMaxLength]자로 자릅니다.
  static String _resolveSummary(
    PostResponse post, {
    required int extractedMaxLength,
  }) {
    final provided = post.summary?.trim();
    if (provided != null && provided.isNotEmpty) {
      return _truncate(provided, 120);
    }
    final plainText = (post.contentMarkdown ?? '')
        .replaceAll(RegExp(r'!\[[^\]]*\]\([^)]*\)'), ' ')
        .replaceAll(RegExp(r'\[[^\]]*\]\([^)]*\)'), ' ')
        .replaceAll(RegExp(r'[#>*`~_\-\[\]()]'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    if (plainText.isEmpty) {
      return '본문 내용이 없습니다.';
    }
    return _truncate(plainText, extractedMaxLength);
  }

  static String _truncate(String text, int maxLength) {
    return text.length <= maxLength
        ? text
        : '${text.substring(0, maxLength)}...';
  }

  static String? _validHttpUrl(String? rawUrl) {
    final normalized = rawUrl?.trim();
    if (normalized == null || normalized.isEmpty) {
      return null;
    }
    final uri = Uri.tryParse(normalized);
    if (uri == null || !uri.hasScheme) {
      return null;
    }
    return uri.scheme == 'http' || uri.scheme == 'https' ? normalized : null;
  }

  static String _statusLabel(PostStatus status) {
    return switch (status) {
      PostStatus.draft => '임시저장',
      PostStatus.published => '게시됨',
      PostStatus.scheduled => '예약됨',
      PostStatus.deleted => '삭제됨',
    };
  }
}
