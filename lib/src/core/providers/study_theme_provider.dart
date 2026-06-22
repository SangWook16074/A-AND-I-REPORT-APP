import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 스터디 라우트(`/course`, `/report`, `/report/:id`)에서 공유하는 다크모드 상태입니다.
final studyDarkModeProvider = StateProvider<bool>((ref) => false);

/// 스터디 내 학습 코스 서비스의 활성화 여부입니다.
///
/// `false`이면 코스 목록 위에 딤(dim) 오버레이를 띄워
/// 진입을 차단하고 안내 메시지를 노출합니다.
/// 추후 운영 설정/백엔드 플래그와 연동하기 위한 단일 진입점입니다.
///
/// 현재는 4기 정규 교육과정 종료 안내를 위해 서버 응답과 무관하게
/// 항상 비활성(`false`)으로 고정해 딤을 노출합니다.
final courseServiceActiveProvider = StateProvider<bool>((ref) => false);
