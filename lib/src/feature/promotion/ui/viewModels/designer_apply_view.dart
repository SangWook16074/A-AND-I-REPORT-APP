import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'designer_apply_view.g.dart';

/// A&I 4기 UX/UI 디자이너 모집 기간 활성 여부를 반환합니다.
///
/// 정적 페이지(`/recruit-designer/`)와 별개로, Flutter Home 화면에서
/// 디자이너 모집 배너를 노출할지 판단하기 위한 프로바이더입니다.
@riverpod
class DesignerApplyView extends _$DesignerApplyView {
  static final DateTime _recruitmentStartAt = DateTime(2026, 6, 1);
  static final DateTime _recruitmentEndExclusiveAt = DateTime(2026, 8, 31);

  @override
  bool build() {
    return isRecruitingAt(DateTime.now());
  }

  /// 주어진 시각이 디자이너 모집 기간 안에 포함되는지 반환합니다.
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
