import 'package:a_and_i_report_web_server/src/core/auth/role_policy.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/post.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/presentation/widgets/article_markdown_preview_support.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/providers/article_post_providers.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/ui/viewModels/article_detail_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/ui/viewModels/article_list_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_state.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_state.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/home_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticleDetailView extends ConsumerWidget {
  const ArticleDetailView({
    super.key,
    required this.id,
  });

  final String id;

  static final SyntaxHighlighter _codeSyntaxHighlighter =
      ArticleMarkdownCodeSyntaxHighlighter();

  Future<void> _deletePost(
    BuildContext context,
    WidgetRef ref, {
    required String postId,
  }) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('게시글 삭제'),
        content: const Text('정말 이 게시글을 삭제하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFFDC2626),
            ),
            child: const Text('삭제'),
          ),
        ],
      ),
    );

    if (shouldDelete != true) {
      return;
    }

    try {
      await ref.read(postRepositoryProvider).deletePost(postId: postId);
      ref.invalidate(articleListViewModelProvider);
      if (!context.mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('게시글이 삭제되었습니다.'),
        ),
      );
      context.go('/articles');
    } catch (_) {
      if (!context.mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('게시글 삭제에 실패했습니다. 잠시 후 다시 시도해주세요.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(authViewModelProvider).status ==
        AuthenticationStatus.authenticated;
    final userState = ref.watch(userViewModelProvider);
    final canShowWriteButton =
        isLoggedIn && canManageArticlesWithRole(userState.resolvedRole);
    final postAsync = ref.watch(articleDetailViewModelProvider(id));
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;
    final isTablet = width >= 768 && width < 1200;
    final horizontal = isMobile ? 18.0 : (isTablet ? 28.0 : 24.0);
    final topPadding = isMobile ? 16.0 : 22.0;
    final bottomPadding = isMobile ? 40.0 : 56.0;
    final contentMaxWidth = isMobile ? 640.0 : 800.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          horizontal,
          topPadding,
          horizontal,
          bottomPadding,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: contentMaxWidth),
            child: postAsync.when(
              data: (post) => _ArticleDetailContent(
                post: post,
                canShowWriteButton: canShowWriteButton,
                canShowDeleteButton: isLoggedIn &&
                    userState.userId != null &&
                    userState.userId == post.author.id,
                onDelete: () => _deletePost(
                  context,
                  ref,
                  postId: post.id,
                ),
                isMobile: isMobile,
                isTablet: isTablet,
                markdownStyle: createArticlePreviewMarkdownStyle(context),
                codeSyntaxHighlighter: _codeSyntaxHighlighter,
              ),
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (_, __) => _ArticleDetailError(
                onRetry: () =>
                    ref.invalidate(articleDetailViewModelProvider(id)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ArticleDetailContent extends StatelessWidget {
  const _ArticleDetailContent({
    required this.post,
    required this.canShowWriteButton,
    required this.canShowDeleteButton,
    required this.onDelete,
    required this.isMobile,
    required this.isTablet,
    required this.markdownStyle,
    required this.codeSyntaxHighlighter,
  });

  final Post post;
  final bool canShowWriteButton;
  final bool canShowDeleteButton;
  final Future<void> Function() onDelete;
  final bool isMobile;
  final bool isTablet;
  final MarkdownStyleSheet markdownStyle;
  final SyntaxHighlighter codeSyntaxHighlighter;

  @override
  Widget build(BuildContext context) {
    final headingFont = isMobile ? 32.0 : (isTablet ? 40.0 : 46.0);
    final introFont = isMobile ? 17.0 : (isTablet ? 19.0 : 21.0);
    final normalizedMarkdown =
        normalizeMarkdownForPreview(post.contentMarkdown);
    final intro = _extractIntro(normalizedMarkdown);
    final thumbnailUrl = _resolveThumbnailUrl(
      thumbnailUrl: post.thumbnailUrl,
      markdown: normalizedMarkdown,
    );
    final authorProfile =
        _extractValidProfileImageUrl(post.author.profileImage);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 6,
          runSpacing: 6,
          children: [
            TextButton(
              onPressed: () => context.go('/'),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text('Home'),
            ),
            const Icon(Icons.chevron_right, size: 16),
            TextButton(
              onPressed: () => context.go('/articles'),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text('Articles'),
            ),
            const Icon(Icons.chevron_right, size: 16),
            Text(
              post.id,
              style: const TextStyle(
                color: HomeTheme.textMain,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: isMobile ? 10 : 12),
        if (canShowWriteButton || canShowDeleteButton)
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (canShowDeleteButton)
                  TextButton(
                    onPressed: () async {
                      await onDelete();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFFDC2626),
                    ),
                    child: const Text('삭제'),
                  ),
                if (canShowDeleteButton && canShowWriteButton)
                  const SizedBox(width: 8),
                if (canShowWriteButton)
                  FilledButton.icon(
                    onPressed: () => context.go('/articles/write'),
                    icon: const Icon(Icons.edit, size: 18),
                    label: const Text('블로그 글 작성'),
                  ),
              ],
            ),
          ),
        SizedBox(height: isMobile ? 18 : 26),
        Text(
          post.title,
          style: TextStyle(
            color: HomeTheme.textMain,
            fontSize: headingFont,
            fontWeight: FontWeight.w800,
            height: 1.15,
            letterSpacing: -1.1,
          ),
        ),
        SizedBox(height: isMobile ? 16 : 24),
        Container(
          padding: EdgeInsets.symmetric(vertical: isMobile ? 14 : 18),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black.withValues(alpha: 0.06),
              ),
              bottom: BorderSide(
                color: Colors.black.withValues(alpha: 0.06),
              ),
            ),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: isMobile ? 19 : 22,
                backgroundColor: Colors.black.withValues(alpha: 0.06),
                backgroundImage:
                    authorProfile == null ? null : NetworkImage(authorProfile),
                child: authorProfile == null
                    ? const Icon(Icons.person, color: HomeTheme.textMuted)
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.author.nickname,
                      style: TextStyle(
                        color: HomeTheme.textMain,
                        fontSize: isMobile ? 13 : 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _formatKoreanDate(post.updatedAt),
                      style: TextStyle(
                        color: HomeTheme.textMuted,
                        fontSize: isMobile ? 10 : 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 8 : 10,
                  vertical: isMobile ? 5 : 6,
                ),
                decoration: BoxDecoration(
                  color: _statusColor(post.status),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  _statusLabel(post.status).toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 9 : 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (thumbnailUrl != null) ...[
          SizedBox(height: isMobile ? 18 : 22),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: AspectRatio(
              aspectRatio: isMobile ? 16 / 10 : 16 / 8,
              child: Image.network(
                thumbnailUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: const Color(0xFFF3F4F6),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.broken_image_outlined,
                    color: HomeTheme.textMuted,
                  ),
                ),
              ),
            ),
          ),
        ],
        SizedBox(height: isMobile ? 16 : 24),
        MarkdownBody(
          data: normalizedMarkdown,
          selectable: true,
          fitContent: false,
          styleSheet: markdownStyle,
          syntaxHighlighter: codeSyntaxHighlighter,
          sizedImageBuilder: (config) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  config.uri.toString(),
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 180,
                    color: const Color(0xFFF3F4F6),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.broken_image_outlined,
                      color: HomeTheme.textMuted,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(height: isMobile ? 26 : 40),
        Center(
          child: TextButton.icon(
            onPressed: () => context.go('/articles'),
            icon: const Icon(Icons.arrow_back),
            label: const Text('목록으로 돌아가기'),
          ),
        ),
      ],
    );
  }
}

class _ArticleDetailError extends StatelessWidget {
  const _ArticleDetailError({
    required this.onRetry,
  });

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '게시글을 불러오지 못했습니다.',
              style: TextStyle(
                color: HomeTheme.textMuted,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: onRetry,
              child: const Text('다시 시도'),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatKoreanDate(DateTime dateTime) {
  return '${dateTime.year.toString().padLeft(4, '0')}.'
      '${dateTime.month.toString().padLeft(2, '0')}.'
      '${dateTime.day.toString().padLeft(2, '0')}';
}

String? _extractValidProfileImageUrl(String? rawUrl) {
  return _extractValidHttpUrl(rawUrl);
}

String? _resolveThumbnailUrl({
  required String? thumbnailUrl,
  required String markdown,
}) {
  final fromField = _extractValidHttpUrl(thumbnailUrl);
  if (fromField != null) {
    return fromField;
  }
  return _extractFirstImageUrl(markdown);
}

String? _extractValidHttpUrl(String? rawUrl) {
  final normalized = rawUrl?.trim();
  if (normalized == null || normalized.isEmpty) {
    return null;
  }
  final uri = Uri.tryParse(normalized);
  if (uri == null || !uri.hasScheme) {
    return null;
  }
  if (uri.scheme != 'http' && uri.scheme != 'https') {
    return null;
  }
  return normalized;
}

String _statusLabel(String status) {
  switch (status) {
    case 'Draft':
      return '임시저장';
    case 'Published':
      return '게시됨';
    case 'Deleted':
      return '삭제됨';
    default:
      return status;
  }
}

Color _statusColor(String status) {
  switch (status) {
    case 'Draft':
      return const Color(0xFF6B7280);
    case 'Deleted':
      return const Color(0xFFDC2626);
    case 'Published':
    default:
      return HomeTheme.primary;
  }
}

String _extractIntro(String markdown) {
  final withoutImages =
      markdown.replaceAll(RegExp(r'!\[[^\]]*\]\(([^)]+)\)'), ' ');
  final withoutLinks = withoutImages.replaceAllMapped(
    RegExp(r'\[([^\]]+)\]\(([^)]+)\)'),
    (match) => match.group(1) ?? '',
  );
  final plainText = withoutLinks
      .replaceAll(RegExp(r'[#>*`_~-]'), ' ')
      .replaceAll(RegExp(r'\n+'), ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();

  if (plainText.isEmpty) {
    return '';
  }
  if (plainText.length <= 180) {
    return plainText;
  }
  return '${plainText.substring(0, 180)}...';
}

String? _extractFirstImageUrl(String markdown) {
  final match = RegExp(r'!\[[^\]]*\]\(([^)\s]+)').firstMatch(markdown);
  if (match == null) {
    return null;
  }
  final raw = (match.group(1) ?? '').trim();
  final sanitized = raw.replaceAll('<', '').replaceAll('>', '');
  final uri = Uri.tryParse(sanitized);
  if (uri == null || !uri.hasScheme) {
    return null;
  }
  if (uri.scheme != 'http' && uri.scheme != 'https') {
    return null;
  }
  return sanitized;
}
