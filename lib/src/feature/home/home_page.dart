import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_event.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_state.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/auth_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_event.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_model.dart';
import 'package:a_and_i_report_web_server/src/feature/auth/ui/viewModels/user_view_state.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/home_theme.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/sections/home_cta_section.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/sections/home_designer_cta_section.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/sections/home_footer_section.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/sections/home_hero_section.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/sections/home_latest_posts_section.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/sections/home_top_bar_section.dart';
import 'package:a_and_i_report_web_server/src/feature/promotion/ui/viewModels/designer_apply_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(authViewModelProvider).status ==
        AuthenticationStatus.authenticated;
    final userState = ref.watch(userViewModelProvider);
    final nickname = userState.nickname ?? '동아리원';
    final publicCode = userState.publicCode;
    final profileImageUrl = userState.profileImageUrl;
    final isDesignerRecruiting = ref.watch(designerApplyViewProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
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
              publicCode: publicCode,
              profileImageUrl: profileImageUrl,
              isLoggedIn: isLoggedIn,
              onGoHome: () => context.go('/'),
              onGoIntro: () => context.go(
                isDesignerRecruiting ? "/recruit-designer" : "/promotion",
              ),
              onGoEducation: () => context.go('/course'),
              onGoPosts: () => context.go('/articles'),
              onGoMaterials: () => context.go('/materials'),
              onGoFaq: () => context.go('/faq'),
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
            child: Column(
              children: [
                const HomeHeroSection(),
                const HomeDesignerCtaSection(),
                const HomeLatestPostsSection(),
                if (isLoggedIn) const HomeLatestMaterialsSection(),
                const HomeCtaSection(),
                const HomeFooterSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
