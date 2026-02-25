import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_event.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_state.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_event.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_state.dart';
import 'package:a_and_i_report_web_server/src/core/auth/role_policy.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/domain/entities/post.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/ui/viewModels/article_list_state.dart';
import 'package:a_and_i_report_web_server/src/feature/articles/ui/viewModels/article_list_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/home_theme.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/sections/home_footer_section.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/sections/home_top_bar_section.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticleListView extends ConsumerWidget {
  const ArticleListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(authViewModelProvider).status ==
        AuthenticationStatus.authenticated;
    final userState = ref.watch(userViewModelProvider);
    final canShowWriteButton =
        isLoggedIn && canManageArticlesWithRole(userState.resolvedRole);
    final nickname = userState.nickname ?? '동아리원';
    final profileImageUrl = userState.profileImageUrl;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;
    final isTablet = width >= 768 && width < 1200;
    final horizontal = isMobile ? 20.0 : (isTablet ? 28.0 : 48.0);
    final maxWidth = isMobile ? 640.0 : (isTablet ? 840.0 : 960.0);
    final titleFontSize = isMobile ? 34.0 : (isTablet ? 40.0 : 46.0);
    final subtitleFontSize = isMobile ? 15.0 : (isTablet ? 16.0 : 18.0);
    final topPadding = isMobile ? 44.0 : (isTablet ? 54.0 : 64.0);
    final bottomPadding = isMobile ? 56.0 : (isTablet ? 64.0 : 72.0);
    final sectionSpacing = isMobile ? 28.0 : 36.0;
    final cardGap = isMobile ? 20.0 : 24.0;
    final articleListStateAsync = ref.watch(articleListViewModelProvider);

    return Scaffold(
      backgroundColor: HomeTheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.white.withValues(alpha: 0.92),
            surfaceTintColor: Colors.transparent,
            titleSpacing: 0,
            title: HomeTopBarSection(
              nickname: nickname,
              profileImageUrl: profileImageUrl,
              isLoggedIn: isLoggedIn,
              onGoIntro: () => context.go('/promotion'),
              onGoEducation: () => context.go('/report'),
              onGoPosts: () => context.go('/articles'),
              onGoMyAccount: () => context.go('/my-account'),
              onLogin: () => context.go('/sign-in'),
              onLogout: () async {
                await ref
                    .read(authViewModelProvider.notifier)
                    .onEvent(const SignOut());
                await ref
                    .read(userViewModelProvider.notifier)
                    .onEvent(const UserViewEvent.clear());
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    horizontal,
                    topPadding,
                    horizontal,
                    bottomPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '게시글',
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1.1,
                          color: HomeTheme.textMain,
                        ),
                      ),
                      SizedBox(height: isMobile ? 8 : 12),
                      Text(
                        'A&I 커뮤니티의 최신 기술 동향, 연구 결과 및 활동 소식을 확인하세요.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: subtitleFontSize,
                          height: 1.6,
                          color: HomeTheme.textMuted,
                        ),
                      ),
                      SizedBox(height: isMobile ? 16 : 20),
                      if (canShowWriteButton)
                        Align(
                          alignment: Alignment.centerRight,
                          child: FilledButton.icon(
                            onPressed: () => context.go('/articles/write'),
                            icon: const Icon(Icons.edit, size: 18),
                            label: const Text('블로그 글 작성'),
                          ),
                        ),
                      SizedBox(height: sectionSpacing),
                      Wrap(
                        spacing: isMobile ? 6 : 8,
                        runSpacing: isMobile ? 6 : 8,
                        alignment: WrapAlignment.center,
                        children: const [
                          CategoryChipView(text: '전체', selected: true),
                          CategoryChipView(text: '기술 블로그'),
                          CategoryChipView(text: '공지사항'),
                          CategoryChipView(text: '활동 후기'),
                        ],
                      ),
                      SizedBox(height: isMobile ? 34 : 44),
                      ArticleCardListSection(
                        articleListStateAsync: articleListStateAsync,
                        cardGap: cardGap,
                        onRetry: () => ref
                            .read(articleListViewModelProvider.notifier)
                            .refresh(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: HomeFooterSection(),
            ),
          ),
        ],
      ),
    );
  }
}

class ArticleCardListSection extends StatelessWidget {
  const ArticleCardListSection({
    super.key,
    required this.articleListStateAsync,
    required this.cardGap,
    required this.onRetry,
  });

  final AsyncValue<ArticleListState> articleListStateAsync;
  final double cardGap;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return articleListStateAsync.when(
      data: (state) {
        if (state.errorMsg.isNotEmpty) {
          return _ArticleListFeedbackView(
            message: '게시글 목록을 불러오지 못했습니다.',
            actionLabel: '다시 시도',
            onAction: onRetry,
          );
        }

        if (state.items.isEmpty) {
          return const _ArticleListFeedbackView(
            message: '등록된 게시글이 없습니다.',
          );
        }

        final children = <Widget>[];
        for (var index = 0; index < state.items.length; index++) {
          final post = state.items[index];
          children.add(_buildCard(post));
          if (index != state.items.length - 1) {
            children.add(SizedBox(height: cardGap));
          }
        }

        return Column(
          children: children,
        );
      },
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (_, __) => _ArticleListFeedbackView(
        message: '게시글 목록을 불러오지 못했습니다.',
        actionLabel: '다시 시도',
        onAction: onRetry,
      ),
    );
  }

  Widget _buildCard(Post post) {
    return ArticleCardView(
      id: post.id,
      category: _statusLabel(post.status),
      date: _formatKoreanDate(post.updatedAt),
      title: post.title,
      summary: _extractSummary(post.contentMarkdown),
      thumbnailUrl: _resolveThumbnailUrl(post),
      authorNickname: post.author.nickname,
      authorProfileImage: post.author.profileImage,
      icon: _statusIcon(post.status),
    );
  }
}

class _ArticleListFeedbackView extends StatelessWidget {
  const _ArticleListFeedbackView({
    required this.message,
    this.actionLabel,
    this.onAction,
  });

  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            message,
            style: const TextStyle(
              color: HomeTheme.textMuted,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (actionLabel != null && onAction != null) ...[
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: onAction,
              child: Text(actionLabel!),
            ),
          ],
        ],
      ),
    );
  }
}

String _statusLabel(String status) {
  final normalized = status.trim();
  if (normalized.isEmpty) {
    return 'UNKNOWN';
  }
  return normalized.toUpperCase();
}

String _formatKoreanDate(DateTime dateTime) {
  final local = dateTime.toLocal();
  return '${local.year}년 ${local.month}월 ${local.day}일';
}

String _extractSummary(String markdown) {
  final plainText = markdown
      .replaceAll(RegExp(r'!\[[^\]]*\]\([^)]*\)'), ' ')
      .replaceAll(RegExp(r'\[[^\]]*\]\([^)]*\)'), ' ')
      .replaceAll(RegExp(r'[#>*`~_\-\[\]()]'), ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();

  if (plainText.isEmpty) {
    return '본문 내용이 없습니다.';
  }

  const maxLength = 120;
  if (plainText.length <= maxLength) {
    return plainText;
  }

  return '${plainText.substring(0, maxLength)}...';
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

String? _resolveThumbnailUrl(Post post) {
  final fromField = _extractValidHttpUrl(post.thumbnailUrl);
  if (fromField != null) {
    return fromField;
  }
  return _extractFirstImageUrl(post.contentMarkdown);
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

String? _extractValidProfileImageUrl(String? rawUrl) {
  return _extractValidHttpUrl(rawUrl);
}

IconData _statusIcon(String status) {
  switch (status.toLowerCase()) {
    case 'published':
      return Icons.article;
    case 'draft':
      return Icons.edit_note;
    default:
      return Icons.description;
  }
}

class CategoryChipView extends StatelessWidget {
  const CategoryChipView({
    super.key,
    required this.text,
    this.selected = false,
  });

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 13 : 16,
        vertical: isMobile ? 8 : 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: selected
            ? HomeTheme.textMain
            : Colors.black.withValues(alpha: 0.05),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.white : HomeTheme.textMuted,
          fontSize: isMobile ? 13 : 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class ArticleCardView extends StatelessWidget {
  const ArticleCardView({
    super.key,
    required this.id,
    required this.category,
    required this.date,
    required this.title,
    required this.summary,
    required this.thumbnailUrl,
    required this.authorNickname,
    required this.authorProfileImage,
    required this.icon,
  });

  final String id;
  final String category;
  final String date;
  final String title;
  final String summary;
  final String? thumbnailUrl;
  final String authorNickname;
  final String? authorProfileImage;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;
    final isTablet = width >= 768 && width < 1200;
    final stacked = isMobile;
    final previewWidth = isTablet ? 210.0 : 240.0;
    final previewHeight = isMobile ? 168.0 : 150.0;
    return InkWell(
      onTap: () => context.go('/articles/$id'),
      borderRadius: BorderRadius.circular(16),
      child: Flex(
        direction: stacked ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: stacked ? double.infinity : previewWidth,
            height: previewHeight,
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
            ),
            child: _ArticleCardThumbnail(
              thumbnailUrl: thumbnailUrl,
              icon: icon,
            ),
          ),
          SizedBox(width: stacked ? 0 : 20, height: stacked ? 14 : 0),
          if (stacked)
            ArticleCardContentView(
              category: category,
              date: date,
              title: title,
              summary: summary,
              authorNickname: authorNickname,
              authorProfileImage: authorProfileImage,
            )
          else
            Expanded(
              child: ArticleCardContentView(
                category: category,
                date: date,
                title: title,
                summary: summary,
                authorNickname: authorNickname,
                authorProfileImage: authorProfileImage,
              ),
            ),
        ],
      ),
    );
  }
}

class _ArticleCardThumbnail extends StatelessWidget {
  const _ArticleCardThumbnail({
    required this.thumbnailUrl,
    required this.icon,
  });

  final String? thumbnailUrl;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final url = thumbnailUrl?.trim();
    final hasThumbnail = url != null && url.isNotEmpty;
    if (!hasThumbnail) {
      return _ArticleCardThumbnailFallback(icon: icon);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        placeholder: (context, _) => Container(
          color: const Color(0xFFF3F4F6),
          alignment: Alignment.center,
          child: const SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
        errorWidget: (context, _, __) {
          return _ArticleCardThumbnailFallback(icon: icon);
        },
      ),
    );
  }
}

class _ArticleCardThumbnailFallback extends StatelessWidget {
  const _ArticleCardThumbnailFallback({
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        icon,
        size: 56,
        color: Colors.black.withValues(alpha: 0.14),
      ),
    );
  }
}

class ArticleCardContentView extends StatelessWidget {
  const ArticleCardContentView({
    super.key,
    required this.category,
    required this.date,
    required this.title,
    required this.summary,
    required this.authorNickname,
    required this.authorProfileImage,
  });

  final String category;
  final String date;
  final String title;
  final String summary;
  final String authorNickname;
  final String? authorProfileImage;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;
    final isTablet = width >= 768 && width < 1200;
    final titleFont = isMobile ? 22.0 : (isTablet ? 24.0 : 27.0);
    final bodyFont = isMobile ? 13.0 : 14.0;
    final authorProfile = _extractValidProfileImageUrl(authorProfileImage);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 6,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: HomeTheme.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                category,
                style: const TextStyle(
                  color: HomeTheme.primary,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                ),
              ),
            ),
            Text(
              '•',
              style: TextStyle(
                color: Colors.black.withValues(alpha: 0.2),
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              date,
              style: const TextStyle(
                color: HomeTheme.textMuted,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: isMobile ? 8 : 10),
        Text(
          title,
          style: TextStyle(
            color: HomeTheme.textMain,
            fontSize: titleFont,
            fontWeight: FontWeight.w800,
            height: 1.25,
            letterSpacing: -0.4,
          ),
        ),
        SizedBox(height: isMobile ? 8 : 10),
        Text(
          summary,
          style: TextStyle(
            color: HomeTheme.textMuted,
            fontSize: bodyFont,
            height: 1.6,
          ),
        ),
        SizedBox(height: isMobile ? 8 : 10),
        Row(
          children: [
            CircleAvatar(
              radius: isMobile ? 10 : 11,
              backgroundColor: Colors.black.withValues(alpha: 0.06),
              backgroundImage:
                  authorProfile == null ? null : NetworkImage(authorProfile),
              child: authorProfile == null
                  ? Icon(
                      Icons.person,
                      size: isMobile ? 11 : 12,
                      color: HomeTheme.textMuted,
                    )
                  : null,
            ),
            const SizedBox(width: 6),
            Text(
              authorNickname,
              style: TextStyle(
                color: HomeTheme.textMuted,
                fontSize: isMobile ? 11 : 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
