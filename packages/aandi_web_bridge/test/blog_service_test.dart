import 'dart:convert';

import 'package:aandi_tech_blog/aandi_tech_blog.dart';
import 'package:aandi_web_bridge/aandi_web_bridge.dart';
import 'package:dio/dio.dart';
import 'package:test/test.dart';

/// 경로별로 고정 JSON을 돌려주는 테스트용 어댑터입니다.
class _FakeAdapter implements HttpClientAdapter {
  _FakeAdapter(this.routes);

  final Map<String, Map<String, Object?>> routes;
  final List<Uri> requested = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requested.add(options.uri);
    final body = routes[options.uri.path];
    if (body == null) {
      return ResponseBody.fromString(
        jsonEncode({
          'success': false,
          'error': {'message': '게시글을 찾을 수 없어요.'},
        }),
        404,
      );
    }
    return ResponseBody.fromString(
      jsonEncode({'success': true, 'data': body}),
      200,
    );
  }

  @override
  void close({bool force = false}) {}
}

Map<String, Object?> _post(String id) => {
      'id': id,
      'title': '제목 $id',
      'summary': '요약',
      'contentMarkdown': '# 헤딩\n\n`code`\n\n![img](https://img.test/a.png)',
      'author': {'id': 'u1', 'nickname': '에이'},
      'collaborators': [
        {'id': 'u2', 'nickname': '아이'},
      ],
      'type': 'Blog',
      'status': 'Published',
      'publishedAt': '2026-09-01T00:00:00Z',
      'createdAt': '2026-09-01T12:00:00Z',
      'updatedAt': '2026-09-02T12:00:00Z',
    };

void main() {
  late _FakeAdapter adapter;
  late BlogService service;

  setUp(() {
    adapter = _FakeAdapter({
      '/v2/blogs': {
        'items': [_post('p1'), _post('p2')],
        'page': 0,
        'size': 2,
        'totalElements': 3,
        'totalPages': 2,
      },
      '/v2/blogs/p1': _post('p1'),
    });
    final dio = Dio()..httpClientAdapter = adapter;
    service = BlogService(
      client: TechBlogApiClient(baseUrl: 'https://api.test', dio: dio),
    );
  });

  test('목록은 다음 페이지 여부와 기존 화면 표시 규칙을 따른다', () async {
    final result = await service.list(page: 0, size: 2);

    expect((result['items'] as List).length, 2);
    expect(result['hasNext'], isTrue);
    final first = (result['items'] as List).first as Map<String, Object?>;
    expect(first['authorNickname'], '에이');
    expect(first['status'], 'PUBLISHED');
    expect(first['thumbnailUrl'], 'https://img.test/a.png');
    expect(first['dateLabel'], matches(RegExp(r'^2026년 9월 \d+일$')));
  });

  test('홈 최신글은 게시된 글만 최대 3개 반환한다', () async {
    final result = await service.latest();
    expect((result['items'] as List).length, 2);
  });

  test('요약이 없으면 본문에서 추출해 목록은 30자로 자른다', () async {
    final post = _post('p3')..remove('summary');
    post['contentMarkdown'] = '가' * 50;
    adapter.routes['/v2/blogs'] = {
      'items': [post],
      'page': 0,
      'size': 1,
      'totalElements': 1,
      'totalPages': 1,
    };
    final item = ((await service.list())['items'] as List).single as Map;
    expect(item['summary'], '${'가' * 30}...');
    expect(item['homeSummary'], '가' * 50);
  });

  test('상세는 Markdown을 HTML로 렌더링한다', () async {
    final result = await service.detail('p1');

    expect(result['contentHtml'], contains('<h1'));
    expect(result['contentHtml'], contains('<code>code</code>'));
    expect(result['dateLabel'], '2026.09.02');
    expect(result['statusLabel'], '게시됨');
  });

  test('API 오류는 TechBlogApiException으로 전달된다', () async {
    expect(
      () => service.detail('missing'),
      throwsA(isA<TechBlogApiException>()),
    );
  });
}
