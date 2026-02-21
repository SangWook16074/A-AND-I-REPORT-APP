import 'package:a_and_i_report_web_server/src/core/constants/api_url.dart';
import 'package:a_and_i_report_web_server/src/core/widgets/logo_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:a_and_i_report_web_server/src/feature/home/presentation/views/home_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeTopBarSection extends StatelessWidget {
  const HomeTopBarSection({
    super.key,
    required this.nickname,
    this.profileImageUrl,
    required this.isLoggedIn,
    required this.onGoIntro,
    required this.onGoEducation,
    required this.onGoPosts,
    required this.onGoMyAccount,
    required this.onLogin,
    required this.onLogout,
  });

  final String nickname;
  final String? profileImageUrl;
  final bool isLoggedIn;
  final VoidCallback onGoIntro;
  final VoidCallback onGoEducation;
  final VoidCallback onGoPosts;
  final VoidCallback onGoMyAccount;
  final VoidCallback onLogin;
  final Future<void> Function() onLogout;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;
    final isTablet = width >= 768 && width < 1200;
    final isDesktop = width >= 1200;
    final showMenu = !isDesktop;
    final horizontal = isMobile ? 20.0 : (isTablet ? 28.0 : 48.0);
    final barHeight = isMobile ? 72.0 : (isTablet ? 76.0 : 80.0);
    final logoWidth = isMobile ? 42.0 : (isTablet ? 46.0 : 50.0);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1280),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontal),
          child: SizedBox(
            height: barHeight,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    context.go("/");
                  },
                  child: LogoImage(
                    width: logoWidth,
                  ),
                ),
                if (isDesktop) ...[
                  const Spacer(),
                  HomeTopBarNavButton(text: '동아리 소개', onTap: onGoIntro),
                  const SizedBox(width: 18),
                  HomeTopBarNavButton(text: '스터디', onTap: onGoEducation),
                  const SizedBox(width: 18),
                  HomeTopBarNavButton(text: '블로그', onTap: onGoPosts),
                  const Spacer(),
                ] else
                  const Spacer(),
                Row(
                  children: [
                    if (isLoggedIn && !showMenu) ...[
                      InkWell(
                        borderRadius: BorderRadius.circular(999),
                        onTap: onGoMyAccount,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 2,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color:
                                      HomeTheme.primary.withValues(alpha: 0.10),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: TopBarProfileAvatar(
                                  profileImageUrl: profileImageUrl,
                                  size: 32,
                                  iconSize: 18,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                nickname,
                                style: TextStyle(
                                  fontSize: isMobile ? 12 : 13,
                                  fontWeight: FontWeight.w600,
                                  color: HomeTheme.textMain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                    if (showMenu)
                      PopupMenuButton<String>(
                        tooltip: '메뉴',
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        elevation: 10,
                        shadowColor: Colors.black.withValues(alpha: 0.12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: BorderSide(
                            color: Colors.black.withValues(alpha: 0.08),
                          ),
                        ),
                        offset: const Offset(0, 8),
                        onSelected: (value) async {
                          if (value == 'intro') {
                            onGoIntro();
                            return;
                          }
                          if (value == 'study') {
                            onGoEducation();
                            return;
                          }
                          if (value == 'blog') {
                            onGoPosts();
                            return;
                          }
                          if (value == 'account') {
                            onGoMyAccount();
                            return;
                          }
                          if (value == 'login') {
                            onLogin();
                            return;
                          }
                          if (value == 'logout') {
                            await onLogout();
                          }
                        },
                        itemBuilder: (context) => [
                          if (isLoggedIn) ...[
                            PopupMenuItem<String>(
                              value: "account",
                              enabled: false,
                              height: 52,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      TopBarProfileAvatar(
                                        profileImageUrl: profileImageUrl,
                                        size: 20,
                                        iconSize: 12,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          nickname,
                                          style: const TextStyle(
                                            color: HomeTheme.textMain,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 13,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '로그인됨',
                                    style: TextStyle(
                                      color: HomeTheme.textMuted
                                          .withValues(alpha: 0.8),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuDivider(
                              height: 10,
                              color: Colors.black.withValues(alpha: 0.08),
                            ),
                          ],
                          const PopupMenuItem<String>(
                            value: 'intro',
                            child: Text(
                              '동아리 소개',
                              style: TextStyle(
                                color: HomeTheme.textMain,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const PopupMenuItem<String>(
                            value: 'study',
                            child: Text(
                              '스터디',
                              style: TextStyle(
                                color: HomeTheme.textMain,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const PopupMenuItem<String>(
                            value: 'blog',
                            child: Text(
                              '블로그',
                              style: TextStyle(
                                color: HomeTheme.textMain,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          if (isLoggedIn)
                            const PopupMenuItem<String>(
                              value: 'account',
                              child: Text(
                                '내 계정',
                                style: TextStyle(
                                  color: HomeTheme.textMain,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          PopupMenuDivider(
                            height: 12,
                            color: Colors.black.withValues(alpha: 0.08),
                          ),
                          PopupMenuItem<String>(
                            value: isLoggedIn ? 'logout' : 'login',
                            child: Text(
                              isLoggedIn ? '로그아웃' : '로그인',
                              style: TextStyle(
                                color: isLoggedIn
                                    ? HomeTheme.textMain
                                    : HomeTheme.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                        child: Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(11),
                            border: Border.all(
                              color: Colors.black.withValues(alpha: 0.08),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.06),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.menu_rounded,
                            size: 20,
                            color: HomeTheme.textMain,
                          ),
                        ),
                      )
                    else
                      (isLoggedIn
                          ? OutlinedButton.icon(
                              onPressed: onLogout,
                              icon: const Icon(Icons.logout, size: 14),
                              label: const Text('로그아웃'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: HomeTheme.textMain,
                                side: BorderSide(
                                  color: Colors.black.withValues(alpha: 0.08),
                                ),
                                backgroundColor:
                                    Colors.black.withValues(alpha: 0.03),
                                textStyle: TextStyle(
                                  fontSize: isMobile ? 11 : 12,
                                  fontWeight: FontWeight.w700,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 10 : 12,
                                  vertical: isMobile ? 8 : 9,
                                ),
                              ),
                            )
                          : FilledButton(
                              onPressed: onLogin,
                              style: FilledButton.styleFrom(
                                backgroundColor: HomeTheme.primary,
                                foregroundColor: Colors.white,
                                textStyle: TextStyle(
                                  fontSize: isMobile ? 11 : 12,
                                  fontWeight: FontWeight.w700,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 12 : 14,
                                  vertical: isMobile ? 8 : 9,
                                ),
                              ),
                              child: const Text('로그인'),
                            )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopBarProfileAvatar extends StatelessWidget {
  const TopBarProfileAvatar({
    super.key,
    required this.profileImageUrl,
    this.size = 32,
    this.iconSize = 18,
  });

  final String? profileImageUrl;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final resolvedImageUrl = _resolveProfileImageUrl(profileImageUrl);
    if (resolvedImageUrl == null || resolvedImageUrl.isEmpty) {
      return Icon(Icons.person, color: HomeTheme.primary, size: iconSize);
    }

    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: resolvedImageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) =>
            Icon(Icons.person, color: HomeTheme.primary, size: iconSize),
      ),
    );
  }

  String? _resolveProfileImageUrl(String? imagePath) {
    final trimmedImagePath = imagePath?.trim();
    if (trimmedImagePath == null || trimmedImagePath.isEmpty) {
      return null;
    }

    if (trimmedImagePath.startsWith('http://') ||
        trimmedImagePath.startsWith('https://') ||
        trimmedImagePath.startsWith('data:')) {
      return trimmedImagePath;
    }

    if (baseUrl.trim().isEmpty) {
      return trimmedImagePath;
    }

    return Uri.parse(baseUrl).resolve(trimmedImagePath).toString();
  }
}

class HomeTopBarNavButton extends StatelessWidget {
  const HomeTopBarNavButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isTablet = width >= 768 && width < 1200;
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: HomeTheme.textMuted,
          fontSize: isTablet ? 13 : 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
