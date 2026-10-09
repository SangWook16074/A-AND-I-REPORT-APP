/// 사이트 운영 상태와 공개 메뉴/라우트 정책을 관리합니다.
///
/// 동아리가 프로젝트 기간일 때는 랜딩 안내만 노출하고,
/// 블로그처럼 공개 가능한 서비스만 메뉴로 이동할 수 있도록 제한합니다.
class SitePolicy {
  /// [now]를 주입하면 테스트에서 연도 계산을 고정할 수 있습니다.
  SitePolicy({DateTime Function()? now}) : _now = now ?? DateTime.now;

  final DateTime Function() _now;

  /// 공개 메뉴 목록입니다. 순서대로 탭에 노출됩니다.
  static const List<SiteMenu> menus = <SiteMenu>[
    SiteMenu(id: 'home', label: '홈', path: '/'),
    SiteMenu(id: 'blog', label: '블로그', path: '/articles'),
  ];

  /// 진행 중인 UX/UI 디자이너 모집 공고입니다.
  ///
  /// 기간은 정적 모집 페이지(`web_recruit/src/data.ts`의 `RECRUIT`)와 같게 유지합니다.
  static final RecruitNotice designerRecruit = RecruitNotice(
    title: 'A&I UX/UI 디자이너 모집',
    periodLabel: '2026.10.09 – 2026.10.30',
    startAt: DateTime(2026, 10, 9),
    endExclusiveAt: DateTime(2026, 10, 31),
    pagePath: '/recruit-designer/',
    applyUrl: 'https://forms.gle/QHuzcBn3yzm59jGX9',
  );

  /// 현재 운영 상태를 반환합니다.
  SiteStatus status() {
    final now = _now();
    final nextYear = now.year + 1;
    return SiteStatus(
      headline: '내년에 만나요!',
      subtitle: 'A&I는 지금 프로젝트를 진행하고 있어요.',
      detail: '개발 분야 신규 기수는 $nextYear년에 모집해요.',
      nextSeasonYear: nextYear,
      recruit: designerRecruit.isOpenAt(now) ? designerRecruit : null,
    );
  }

  /// [path]를 화면 단위 라우트로 해석합니다.
  ///
  /// 공개되지 않은 경로(과제, 강좌, 로그인 등)는 홈(`/`)으로 리다이렉트합니다.
  SiteRoute resolve(String path) {
    final segments = Uri.parse(path.isEmpty ? '/' : path)
        .pathSegments
        .where((segment) => segment.isNotEmpty)
        .toList(growable: false);

    if (segments.isEmpty) {
      return const SiteRoute(view: 'home', menuId: 'home', title: 'A&I');
    }

    if (segments.first == 'articles') {
      if (segments.length == 1) {
        return const SiteRoute(
          view: 'blogList',
          menuId: 'blog',
          title: '블로그 | A&I',
        );
      }
      // 작성/출간 화면은 아직 이관 대상이 아니므로 목록으로 돌려보냅니다.
      if (segments.length == 2 &&
          segments[1] != 'write' &&
          segments[1] != 'confirm') {
        return SiteRoute(
          view: 'blogDetail',
          menuId: 'blog',
          title: '블로그 상세 | A&I',
          params: {'id': segments[1]},
        );
      }
      return const SiteRoute.redirect('/articles');
    }

    return const SiteRoute.redirect('/');
  }
}

/// 상단 탭 메뉴 항목입니다.
class SiteMenu {
  const SiteMenu({required this.id, required this.label, required this.path});

  final String id;
  final String label;
  final String path;

  Map<String, Object?> toJson() => {'id': id, 'label': label, 'path': path};
}

/// 홈에 노출하는 모집 공고입니다. 모집 기간 안에서만 [SiteStatus.recruit]로 전달됩니다.
class RecruitNotice {
  const RecruitNotice({
    required this.title,
    required this.periodLabel,
    required this.startAt,
    required this.endExclusiveAt,
    required this.pagePath,
    required this.applyUrl,
  });

  /// 배너 타이틀입니다.
  final String title;

  /// 화면에 표시할 모집 기간 문구입니다.
  final String periodLabel;

  /// 모집 시작 시각(포함)입니다.
  final DateTime startAt;

  /// 모집 종료 시각(미포함)입니다. 마감일 다음 날 0시입니다.
  final DateTime endExclusiveAt;

  /// 모집 상세 페이지 경로입니다.
  final String pagePath;

  /// 지원서 링크입니다.
  final String applyUrl;

  /// [now]가 모집 기간 안인지 반환합니다.
  bool isOpenAt(DateTime now) =>
      !now.isBefore(startAt) && now.isBefore(endExclusiveAt);

  Map<String, Object?> toJson() => {
        'title': title,
        'periodLabel': periodLabel,
        'pagePath': pagePath,
        'applyUrl': applyUrl,
      };
}

/// 첫 접속(홈) 화면에 노출하는 운영 상태 안내입니다.
class SiteStatus {
  const SiteStatus({
    required this.headline,
    required this.subtitle,
    required this.detail,
    required this.nextSeasonYear,
    this.recruit,
  });

  /// 히어로 타이틀입니다.
  final String headline;

  /// 히어로 서브타이틀입니다.
  final String subtitle;

  /// 히어로 하단 안내 문구입니다.
  final String detail;

  /// 다음 기수 모집 연도입니다.
  final int nextSeasonYear;

  /// 진행 중인 모집 공고입니다. 모집 기간이 아니면 `null`입니다.
  final RecruitNotice? recruit;

  Map<String, Object?> toJson() => {
        'headline': headline,
        'subtitle': subtitle,
        'detail': detail,
        'nextSeasonYear': nextSeasonYear,
        'recruit': recruit?.toJson(),
        'menus': SitePolicy.menus.map((menu) => menu.toJson()).toList(),
      };
}

/// 경로 해석 결과입니다. [redirectTo]가 있으면 해당 경로로 교체해야 합니다.
class SiteRoute {
  const SiteRoute({
    required this.view,
    required this.menuId,
    required this.title,
    this.params = const {},
  }) : redirectTo = null;

  const SiteRoute.redirect(String path)
      : view = null,
        menuId = null,
        title = null,
        params = const {},
        redirectTo = path;

  final String? view;
  final String? menuId;
  final String? title;
  final Map<String, String> params;
  final String? redirectTo;

  Map<String, Object?> toJson() => {
        'view': view,
        'menuId': menuId,
        'title': title,
        'params': params,
        'redirectTo': redirectTo,
      };
}
