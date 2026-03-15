import 'package:a_and_i_report_web_server/src/feature/promotion/ui/widgets/promotion_hero.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PromotionHero text helpers', () {
    test('모집 중일 때 모집 안내 문구를 반환한다', () {
      expect(PromotionHero.subtitleText(true), '함께 성장할 여러분을 기다립니다!');
      expect(PromotionHero.detailText(true), '2026.01.16 - 2026.03.15');
    });

    test('모집 종료 시 종료 안내 문구를 반환한다', () {
      expect(PromotionHero.subtitleText(false), '모집 기간이 종료되었습니다.');
      expect(PromotionHero.detailText(false), '다음 모집 일정은 추후 공지됩니다.');
    });
  });
}
