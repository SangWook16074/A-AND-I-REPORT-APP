import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'apply_view.g.dart';

@riverpod
class ApplyView extends _$ApplyView {
  static final DateTime _recruitmentStartAt = DateTime(2026, 1, 16);
  static final DateTime _recruitmentEndExclusiveAt = DateTime(2026, 3, 16);

  @override
  bool build() {
    return isEnable;
  }

  bool get isEnable {
    return isRecruitingAt(DateTime.now());
  }

  /// 주어진 시각이 동아리 모집 기간 안에 포함되는지 반환합니다.
  static bool isRecruitingAt(DateTime now) {
    if (now.isBefore(_recruitmentStartAt)) {
      return false;
    }
    if (!now.isBefore(_recruitmentEndExclusiveAt)) {
      return false;
    }
    return true;
  }
}
