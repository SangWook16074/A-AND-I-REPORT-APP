import 'package:a_and_i_report_web_server/src/feature/promotion/ui/viewModels/designer_apply_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web/web.dart' as web;

/// A&I 4기 UX/UI 디자이너 모집 기간 동안 홈 화면에 노출되는 배너.
/// 클릭 시 정적 페이지(`/recruit-designer/`)로 풀 페이지 네비게이션을 수행합니다.
class HomeDesignerCtaSection extends ConsumerWidget {
  const HomeDesignerCtaSection({super.key});

  static const _route = '/recruit-designer/';

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
    final sectionBottom = isMobile ? 32.0 : 48.0;
    final boxPadding = isMobile ? 22.0 : (isTablet ? 28.0 : 36.0);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1280),
        child: Padding(
          padding: EdgeInsets.fromLTRB(horizontal, 16, horizontal, sectionBottom),
          child: _DesignerBanner(
            boxPadding: boxPadding,
            titleFont: titleFont,
            bodyFont: bodyFont,
            verticalLayout: verticalLayout,
            isMobile: isMobile,
            onTap: _goToRecruitPage,
          ),
        ),
      ),
    );
  }

  static void _goToRecruitPage() {
    web.window.location.assign(_route);
  }
}

class _DesignerBanner extends StatelessWidget {
  const _DesignerBanner({
    required this.boxPadding,
    required this.titleFont,
    required this.bodyFont,
    required this.verticalLayout,
    required this.isMobile,
    required this.onTap,
  });

  final double boxPadding;
  final double titleFont;
  final double bodyFont;
  final bool verticalLayout;
  final bool isMobile;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ctaButton = FilledButton.icon(
      onPressed: onTap,
      icon: const Icon(Icons.arrow_forward_rounded, size: 18),
      style: FilledButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF000000),
        textStyle: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: isMobile ? 14 : 15,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 18 : 24,
          vertical: isMobile ? 14 : 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
      ),
      label: const Text('모집 페이지 보기'),
    );

    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFF93C5FD),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Color(0xFF60A5FA), blurRadius: 8),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              '2026.06.01 – 2026.08.30 · NEW',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 2.2,
              ),
            ),
          ],
        ),
        SizedBox(height: isMobile ? 10 : 14),
        Text(
          'A&I 4기 UX/UI 디자이너를 찾고 있어요',
          style: TextStyle(
            color: Colors.white,
            fontSize: titleFont,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
            height: 1.15,
          ),
        ),
        SizedBox(height: isMobile ? 8 : 10),
        Text(
          '8개+ 앱 프로젝트를 함께 만들어갈 디자이너 분들을 모십니다. Figma · Rive로 실제 출시되는 앱의 UX/UI를 디자인해요.',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.78),
            fontSize: bodyFont,
            height: 1.6,
          ),
        ),
      ],
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1E40AF),
                Color(0xFF3B82F6),
                Color(0xFF60A5FA),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3B82F6).withValues(alpha: 0.4),
                blurRadius: 36,
                offset: const Offset(0, 16),
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

/// 풀-페이지 네비게이션을 수행하는 헬퍼 (정적 페이지 진입).
void navigateToDesignerRecruit() {
  web.window.location.assign('/recruit-designer/');
}
