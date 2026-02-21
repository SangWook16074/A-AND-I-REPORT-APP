import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_event.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_state.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_event.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_state.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/home_theme.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/sections/home_footer_section.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/sections/home_top_bar_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticleListView extends ConsumerWidget {
  const ArticleListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(authViewModelProvider).status ==
        AuthenticationStatus.authenticated;
    final canShowWriteButton = isLoggedIn;
    final userState = ref.watch(userViewModelProvider);
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
                      const ArticleCardView(
                        id: '1',
                        category: 'ARCHITECTURE',
                        date: '2023년 10월 24일',
                        title: 'LLM 아키텍처 탐구: 효율적인 추론을 향한 진화',
                        summary:
                            '최신 대규모 언어 모델 구조와 효율적인 추론을 향한 진화 과정을 심도 있게 다룹니다.',
                        views: '1,240',
                        comments: '12',
                        icon: Icons.hub,
                      ),
                      SizedBox(height: cardGap),
                      const ArticleCardView(
                        id: '2',
                        category: 'RESEARCH',
                        date: '2023년 10월 20일',
                        title: '신경망의 미래: 차세대 딥러닝 패러다임',
                        summary:
                            '프로덕션 환경에서 더욱 효율적이고 확장 가능한 신경망 아키텍처로의 전환을 분석합니다.',
                        views: '980',
                        comments: '8',
                        icon: Icons.data_object,
                      ),
                      SizedBox(height: cardGap),
                      const ArticleCardView(
                        id: '3',
                        category: 'PRACTICES',
                        date: '2023년 10월 15일',
                        title: '데이터 과학 베스트 프랙티스: 안정적인 파이프라인 구축',
                        summary:
                            '고품질 데이터 파이프라인 유지 및 대규모 프로젝트의 재현성 확보를 위한 필수 전략입니다.',
                        views: '2,150',
                        comments: '24',
                        icon: Icons.storage,
                      ),
                      SizedBox(height: cardGap),
                      const ArticleCardView(
                        id: '4',
                        category: 'COMMUNITY',
                        date: '2023년 10월 10일',
                        title: '2023 하계 해커톤 활동 후기',
                        summary:
                            '치열했던 48시간의 기록. A&I 멤버들이 함께 모여 실전 AI 문제를 해결했던 해커톤 현장을 공유합니다.',
                        views: '850',
                        comments: '15',
                        icon: Icons.groups,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: HomeFooterSection(),
          ),
        ],
      ),
    );
  }
}

class CategoryChipView extends StatelessWidget {
  const CategoryChipView({
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
    required this.id,
    required this.category,
    required this.date,
    required this.title,
    required this.summary,
    required this.views,
    required this.comments,
    required this.icon,
  });

  final String id;
  final String category;
  final String date;
  final String title;
  final String summary;
  final String views;
  final String comments;
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
            child: Center(
              child: Icon(
                icon,
                size: 56,
                color: Colors.black.withValues(alpha: 0.14),
              ),
            ),
          ),
          SizedBox(width: stacked ? 0 : 20, height: stacked ? 14 : 0),
          if (stacked)
            ArticleCardContentView(
              category: category,
              date: date,
              title: title,
              summary: summary,
              views: views,
              comments: comments,
            )
          else
            Expanded(
              child: ArticleCardContentView(
                category: category,
                date: date,
                title: title,
                summary: summary,
                views: views,
                comments: comments,
              ),
            ),
        ],
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
    required this.views,
    required this.comments,
  });

  final String category;
  final String date;
  final String title;
  final String summary;
  final String views;
  final String comments;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;
    final isTablet = width >= 768 && width < 1200;
    final titleFont = isMobile ? 22.0 : (isTablet ? 24.0 : 27.0);
    final bodyFont = isMobile ? 13.0 : 14.0;

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
            Icon(Icons.visibility, size: 16, color: HomeTheme.textMuted),
            const SizedBox(width: 4),
            Text(
              views,
              style: TextStyle(
                color: HomeTheme.textMuted,
                fontSize: isMobile ? 11 : 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 12),
            Icon(Icons.chat_bubble, size: 14, color: HomeTheme.textMuted),
            const SizedBox(width: 4),
            Text(
              comments,
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
