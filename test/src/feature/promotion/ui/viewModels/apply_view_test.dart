import 'package:a_and_i_report_web_server/src/feature/promotion/ui/viewModels/apply_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApplyView.isRecruitingAt', () {
    test('모집 시작 시각부터는 지원 가능하다', () {
      final isRecruiting = ApplyView.isRecruitingAt(
        DateTime(2026, 1, 16),
      );

      expect(isRecruiting, isTrue);
    });

    test('마감일 23시 59분까지는 지원 가능하다', () {
      final isRecruiting = ApplyView.isRecruitingAt(
        DateTime(2026, 3, 15, 23, 59),
      );

      expect(isRecruiting, isTrue);
    });

    test('3월 16일 0시부터는 지원 불가하다', () {
      final isRecruiting = ApplyView.isRecruitingAt(
        DateTime(2026, 3, 16),
      );

      expect(isRecruiting, isFalse);
    });
  });
}
