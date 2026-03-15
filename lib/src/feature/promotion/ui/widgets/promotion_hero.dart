import 'package:a_and_i_report_web_server/src/feature/promotion/ui/views/apply_button_view.dart';
import 'package:a_and_i_report_web_server/src/feature/promotion/ui/viewModels/apply_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:a_and_i_report_web_server/src/core/widgets/responsive_layout.dart';

class PromotionHero extends ConsumerWidget {
  const PromotionHero({super.key});

  /// 모집 상태에 따라 히어로 보조 문구를 반환합니다.
  static String subtitleText(bool isRecruiting) {
    return isRecruiting ? '함께 성장할 여러분을 기다립니다!' : '모집 기간이 종료되었습니다.';
  }

  /// 모집 상태에 따라 히어로 상세 문구를 반환합니다.
  static String? detailText(bool isRecruiting) {
    if (isRecruiting) {
      return '2026.01.16 - 2026.03.15';
    }
    return '다음 모집 일정은 추후 공지됩니다.';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    precacheImage(
        const AssetImage(
          "assets/intro_bg.webp",
        ),
        context);

    final isMobile = ResponsiveLayout.isMobile(context);
    final isRecruiting = ref.watch(applyViewProvider);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height), // 전체 화면
      // color: Colors.black, // 강렬한 배경
      decoration: const BoxDecoration(
          color: Color(0xff000000),
          image: DecorationImage(
              // colorFilter: ColorFilter.mode(
              //     Color(0xff000000).withAlpha(150), BlendMode.darken),
              image: AssetImage(
                "assets/intro_bg.webp",
              ),
              fit: BoxFit.cover)),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
      child: Stack(
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1400),
              child: RepaintBoundary(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 400),

                    // 메인 타이틀
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                          text: '2026 ',
                          style: TextStyle(
                            fontSize: isMobile ? 32 : 58, // 반응형 폰트 크기
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.3,
                          ),
                        ),
                        TextSpan(
                          text: 'A&I',
                          style: TextStyle(
                            fontSize: isMobile ? 32 : 58, // 반응형 폰트 크기
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffffffff),
                            height: 1.3,
                          ),
                        ),
                        TextSpan(
                          text: ' 신규 동아리원 모집',
                          style: TextStyle(
                            fontSize: isMobile ? 32 : 58, // 반응형 폰트 크기
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.3,
                          ),
                        ),
                      ]),
                    )
                        .animate()
                        .fadeIn(delay: 400.ms, duration: 600.ms)
                        .moveY(begin: 30, end: 0),
                    const SizedBox(height: 20),

                    // 서브 타이틀
                    Text(
                      subtitleText(isRecruiting),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 20 : 30, // 반응형 폰트 크기
                        fontWeight: FontWeight.w600,
                        color: Colors.white70,
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 600.ms, duration: 600.ms)
                        .moveY(begin: 30, end: 0),
                    SizedBox(height: isMobile ? 10 : 20),

                    if (isRecruiting) ...[
                      Text(
                        detailText(isRecruiting)!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isMobile ? 18 : 24, // 반응형 폰트 크기
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                        ),
                      ).animate().fadeIn(delay: 800.ms, duration: 600.ms),
                      SizedBox(height: isMobile ? 50 : 20),
                      ApplyButtonView()
                          .animate()
                          .fadeIn(delay: 1000.ms, duration: 600.ms),
                    ] else ...[
                      SizedBox(height: isMobile ? 16 : 20),
                      Text(
                        detailText(isRecruiting)!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 22,
                          color: Colors.white60,
                          fontWeight: FontWeight.w500,
                        ),
                      ).animate().fadeIn(delay: 800.ms, duration: 600.ms),
                      SizedBox(height: isMobile ? 50 : 20),
                    ],
                  ],
                ),
              ),
            ),
          ),

          // 스크롤 유도 위젯
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: _buildScrollIndicator(isMobile),
          ),
        ],
      ),
    );
  }

  Widget _buildScrollIndicator(bool isMobile) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '더 알아보기',
          style: TextStyle(
            color: Colors.white70,
            fontSize: isMobile ? 12 : 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white70,
          size: isMobile ? 32 : 40,
        ),
      ],
    )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .fadeIn(delay: 1200.ms, duration: 600.ms)
        .moveY(
          begin: 0,
          end: 10,
          duration: 1500.ms,
          curve: Curves.easeInOut,
        )
        .then()
        .moveY(
          begin: 10,
          end: 0,
          duration: 1500.ms,
          curve: Curves.easeInOut,
        );
  }
}
