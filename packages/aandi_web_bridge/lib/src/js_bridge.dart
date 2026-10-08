import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:aandi_tech_blog/aandi_tech_blog.dart';

import 'blog_service.dart';
import 'site_policy.dart';

/// Dart 비즈니스 로직을 `window.aandi` 전역 객체로 노출합니다.
///
/// HTML/CSS/JS UI는 이 객체만 호출하며, 비동기 결과는 JS Promise로 받습니다.
///
/// ```js
/// const status = aandi.site.status();
/// const page = await aandi.blog.list(0, 12);
/// ```
void registerBridge({
  required SitePolicy sitePolicy,
  required BlogService blogService,
}) {
  final site = JSObject()
    ..setProperty(
      'status'.toJS,
      (() => sitePolicy.status().toJson().jsify()).toJS,
    )
    ..setProperty(
      'resolve'.toJS,
      ((String path) => sitePolicy.resolve(path).toJson().jsify()).toJS,
    );

  final blog = JSObject()
    ..setProperty(
      'list'.toJS,
      ((JSNumber? page, JSNumber? size) => _guard(
            () => blogService.list(
              page: page?.toDartInt ?? 0,
              size: size?.toDartInt ?? BlogService.defaultPageSize,
            ),
          )).toJS,
    )
    ..setProperty(
      'latest'.toJS,
      (() => _guard(() => blogService.latest())).toJS,
    )
    ..setProperty(
      'detail'.toJS,
      ((String id) => _guard(() => blogService.detail(id))).toJS,
    );

  final bridge = JSObject()
    ..setProperty('site'.toJS, site)
    ..setProperty('blog'.toJS, blog);

  globalContext.setProperty('aandi'.toJS, bridge);

  // UI가 브릿지 로딩을 기다리고 있다면 준비 완료를 알립니다.
  final onReady = globalContext.getProperty<JSAny?>('__aandiReady'.toJS);
  if (onReady.isA<JSFunction>()) {
    (onReady as JSFunction).callAsFunction();
  }
}

/// Dart Future를 JS Promise로 변환합니다.
///
/// `Future.toJS`는 JS 객체로 reject할 수 없으므로, Promise는 항상 resolve하고
/// `{ ok: true, data }` 또는 `{ ok: false, error: { message, statusCode } }` 형태로 결과를 전달합니다.
JSPromise<JSAny?> _guard(Future<Map<String, Object?>> Function() action) {
  Future<JSAny?> run() async {
    try {
      return {'ok': true, 'data': await action()}.jsify();
    } on TechBlogApiException catch (error) {
      return _failure(error.message, error.statusCode);
    } catch (_) {
      return _failure('일시적인 오류가 발생했어요. 잠시 후 다시 시도해 주세요.', null);
    }
  }

  return run().toJS;
}

JSAny? _failure(String message, int? statusCode) => {
      'ok': false,
      'error': {'message': message, 'statusCode': statusCode},
    }.jsify();
