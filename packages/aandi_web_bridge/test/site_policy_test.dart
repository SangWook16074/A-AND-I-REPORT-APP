import 'package:aandi_web_bridge/aandi_web_bridge.dart';
import 'package:test/test.dart';

void main() {
  final policy = SitePolicy(now: () => DateTime(2026, 10, 8));

  test('운영 안내는 다음 해 기수 연도를 안내한다', () {
    final status = policy.status();
    expect(status.headline, '내년에 만나요!');
    expect(status.nextSeasonYear, 2027);
    expect(status.detail, '개발 분야 신규 기수는 2027년에 모집해요.');
  });

  group('디자이너 모집 공고', () {
    SiteStatus statusAt(DateTime now) => SitePolicy(now: () => now).status();

    test('모집 기간에는 공고를 노출한다', () {
      final recruit = statusAt(DateTime(2026, 10, 9)).recruit;
      expect(recruit, isNotNull);
      expect(recruit!.pagePath, '/recruit-designer/');
      expect(statusAt(DateTime(2026, 10, 30, 23, 59)).recruit, isNotNull);
    });

    test('모집 기간 밖에는 공고를 숨긴다', () {
      expect(statusAt(DateTime(2026, 10, 8, 23, 59)).recruit, isNull);
      expect(statusAt(DateTime(2026, 10, 31)).recruit, isNull);
    });

    test('JSON에 recruit 필드를 포함한다', () {
      final json = statusAt(DateTime(2026, 10, 15)).toJson();
      expect((json['recruit'] as Map)['title'], 'A&I UX/UI 디자이너 모집');
      expect(statusAt(DateTime(2026, 11, 1)).toJson()['recruit'], isNull);
    });
  });

  test('공개 메뉴는 홈과 블로그뿐이다', () {
    expect(SitePolicy.menus.map((menu) => menu.id), ['home', 'blog']);
  });

  group('resolve', () {
    test('루트는 홈 화면이다', () {
      expect(policy.resolve('/').view, 'home');
      expect(policy.resolve('').view, 'home');
    });

    test('블로그 목록/상세를 해석한다', () {
      expect(policy.resolve('/articles').view, 'blogList');
      final detail = policy.resolve('/articles/abc-123');
      expect(detail.view, 'blogDetail');
      expect(detail.params, {'id': 'abc-123'});
    });

    test('작성 화면은 블로그 목록으로 돌려보낸다', () {
      expect(policy.resolve('/articles/write').redirectTo, '/articles');
      expect(policy.resolve('/articles/a/b').redirectTo, '/articles');
    });

    test('비공개 서비스 경로는 홈으로 돌려보낸다', () {
      for (final path in ['/course', '/report/1', '/sign-in', '/user']) {
        expect(policy.resolve(path).redirectTo, '/', reason: path);
      }
    });
  });
}
