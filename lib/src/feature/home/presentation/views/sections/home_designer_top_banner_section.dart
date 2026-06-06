import 'package:a_and_i_report_web_server/src/feature/promotion/ui/viewModels/designer_apply_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 메인 홈 최상단의 thin promotional strip.
/// flutter.dev 상단 띠배너처럼 모집 기간에만 노출되고 스크롤 시에도 sticky.
/// 전체 영역 클릭 → `/recruit-designer`.
class HomeDesignerTopBannerSection extends ConsumerWidget {
  const HomeDesignerTopBannerSection({super.key});

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
    final horizontal = isMobile ? 16.0 : 24.0;
    final vertical = isMobile ? 9.0 : 10.0;
    final fontSize = isMobile ? 12.5 : 13.5;

    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
      height: 1.2,
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => context.go('/recruit-designer'),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: _bgColor,
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withValues(alpha: 0.08),
                width: 0.5,
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: horizontal,
            vertical: vertical,
          ),
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              runSpacing: 4,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: _accentBlue.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: _accentBlue.withValues(alpha: 0.55),
                    ),
                  ),
                  child: Text(
                    'NEW',
                    style: TextStyle(
                      color: _accentBlue,
                      fontSize: fontSize - 1.5,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.6,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('A&I 4기 ', style: textStyle),
                    _AnimatedGradientText(
                      text: 'UX/UI 디자이너',
                      style: textStyle.copyWith(fontWeight: FontWeight.w800),
                    ),
                    Text('를 모집하고 있어요', style: textStyle),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '지원하러 가기',
                      style: TextStyle(
                        color: _accentBlue,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: _accentBlue,
                      size: fontSize + 3,
                    ),
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

/// "UX/UI 디자이너" 글자에 소개 페이지 hero 와 동일한 NotebookLM-style 그라데이션 흐름.
/// CSS 원본: `.hero__title-grad` — 7-stop / 100deg / background-size 300% / 7.5s linear.
class _AnimatedGradientText extends StatefulWidget {
  const _AnimatedGradientText({
    required this.text,
    required this.style,
  });

  final String text;
  final TextStyle style;

  @override
  State<_AnimatedGradientText> createState() => _AnimatedGradientTextState();
}

class _AnimatedGradientTextState extends State<_AnimatedGradientText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  // 소개 페이지 hero 와 동일한 7-stop NotebookLM 팔레트.
  static const _colors = <Color>[
    Color(0xFF4285F4),
    Color(0xFF60A5FA),
    Color(0xFF9B72CB),
    Color(0xFFD96570),
    Color(0xFF9B72CB),
    Color(0xFF60A5FA),
    Color(0xFF4285F4),
  ];
  static const _stops = <double>[0.0, 0.14, 0.32, 0.50, 0.68, 0.86, 1.0];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 7500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final t = _controller.value;
        return ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (rect) {
            // background-size: 300% 100% 의 가로 3배 타일.
            final tileWidth = rect.width * 3;
            // CSS background-position: 0% → -300% 일 때 이미지가 우측으로 이동 →
            // 색은 좌→우 로 흐른다. shader rect origin 을 +shift 시켜 같은 방향 재현.
            final shift = tileWidth * t;
            return LinearGradient(
              // 100deg ≈ 거의 수평. 띠배너 한 줄 텍스트라 centerLeft→centerRight 로 근사.
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: _colors,
              stops: _stops,
              tileMode: TileMode.repeated,
            ).createShader(
              Rect.fromLTWH(
                rect.left + shift,
                rect.top,
                tileWidth,
                rect.height,
              ),
            );
          },
          child: Text(
            widget.text,
            style: widget.style.copyWith(color: Colors.white),
          ),
        );
      },
    );
  }
}
