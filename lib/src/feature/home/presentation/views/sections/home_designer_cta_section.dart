import 'package:a_and_i_report_web_server/src/feature/promotion/ui/viewModels/designer_apply_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

/// A&I 4기 UX/UI 디자이너 모집 광고 배너.
/// 어두운 배경 + 브랜드 블루 액센트로 메인 화면에서 시선을 끌도록 구성.
/// 클릭 시 같은 SPA 내부 `/recruit-designer` 라우트로 이동.
class HomeDesignerCtaSection extends ConsumerWidget {
  const HomeDesignerCtaSection({super.key});

  static const _bgColor = Color(0xFF0A0A18);
  static const _accentBlue = Color(0xFF3B83F6);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRecruiting = ref.watch(designerApplyViewProvider);
    if (!isRecruiting) {
      return const SizedBox.shrink();
    }

    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;
    final isTablet = width >= 768 && width < 1200;
    final horizontal = isMobile ? 20.0 : (isTablet ? 28.0 : 48.0);
    final verticalLayout = width < 1024;
    final titleFont = isMobile ? 22.0 : (isTablet ? 26.0 : 30.0);
    final bodyFont = isMobile ? 14.0 : 15.0;
    final sectionBottom = isMobile ? 44.0 : 72.0;
    final boxPadding = isMobile ? 22.0 : (isTablet ? 28.0 : 36.0);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1280),
        child: Padding(
          padding:
              EdgeInsets.fromLTRB(horizontal, 0, horizontal, sectionBottom),
          child: _DesignerAdBanner(
            isMobile: isMobile,
            verticalLayout: verticalLayout,
            titleFont: titleFont,
            bodyFont: bodyFont,
            boxPadding: boxPadding,
            bgColor: _bgColor,
            accentBlue: _accentBlue,
            onBannerTap: () => context.go('/recruit-designer'),
            onApplyTap: _launchApplyForm,
          ),
        ),
      ),
    );
  }

  static Future<void> _launchApplyForm() async {
    final uri = Uri.parse('https://forms.gle/QHuzcBn3yzm59jGX9');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

class _DesignerAdBanner extends StatelessWidget {
  const _DesignerAdBanner({
    required this.isMobile,
    required this.verticalLayout,
    required this.titleFont,
    required this.bodyFont,
    required this.boxPadding,
    required this.bgColor,
    required this.accentBlue,
    required this.onBannerTap,
    required this.onApplyTap,
  });

  final bool isMobile;
  final bool verticalLayout;
  final double titleFont;
  final double bodyFont;
  final double boxPadding;
  final Color bgColor;
  final Color accentBlue;
  final VoidCallback onBannerTap;
  final VoidCallback onApplyTap;

  @override
  Widget build(BuildContext context) {
    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'A&I 4기 UX/UI 디자이너 모집',
          style: TextStyle(
            color: Colors.white,
            fontSize: titleFont,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.6,
            height: 1.15,
          ),
        ),
        SizedBox(height: isMobile ? 8 : 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: accentBlue,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: accentBlue.withValues(alpha: 0.6),
                    blurRadius: 8,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '2026.06.01 – 2026.08.30',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: bodyFont,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.01 * bodyFont,
              ),
            ),
          ],
        ),
      ],
    );

    final ctaButton = FilledButton.icon(
      onPressed: onApplyTap,
      icon: const Icon(Icons.arrow_forward_rounded, size: 18),
      style: FilledButton.styleFrom(
        backgroundColor: accentBlue,
        foregroundColor: Colors.white,
        textStyle: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: isMobile ? 14 : 15,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 18 : 24,
          vertical: isMobile ? 13 : 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      label: const Text('지원하러 가기'),
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onBannerTap,
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.06),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.35),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          padding: EdgeInsets.all(boxPadding),
          child: verticalLayout
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    copy,
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ctaButton,
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: copy),
                    const SizedBox(width: 24),
                    ctaButton,
                  ],
                ),
        ),
      ),
    );
  }
}

/// Flutter 내부 라우트로 디자이너 모집 페이지 진입.
void navigateToDesignerRecruit(BuildContext context) {
  context.go('/recruit-designer');
}
