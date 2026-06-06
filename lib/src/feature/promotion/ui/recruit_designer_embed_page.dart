import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

/// 라이브러리 모드로 빌드된 web_recruit JS UI를 Flutter 내부에 직접 마운트.
/// HtmlElementView로 호스트 div를 만들고, ES 모듈을 동적 import하여
/// `mount(host)`를 호출한다. iframe이 아니라서 같은 SPA처럼 동작한다.
class RecruitDesignerEmbedPage extends StatefulWidget {
  const RecruitDesignerEmbedPage({super.key});

  /// dev/prod 동일 — Vite 빌드 산출물이 `web/recruit-designer/`에 있고
  /// Flutter dev 서버와 Firebase Hosting 모두 web 디렉토리를 정적 루트로 본다.
  static String _resolveBaseUrl() => '';

  @override
  State<RecruitDesignerEmbedPage> createState() =>
      _RecruitDesignerEmbedPageState();
}

class _RecruitDesignerEmbedPageState extends State<RecruitDesignerEmbedPage> {
  static const String _cssLinkId = 'recruit-designer-stylesheet';
  // GoRouter 가 페이지를 rebuild 할 때 old State 의 dispose 가 new State 의
  // initState 이후 실행돼 글로벌 link 가 한 번 끊겼다가 재진입이 안 되는
  // race 가 있다. 활성 인스턴스 수를 세서 마지막 인스턴스가 사라질 때만 제거.
  static int _activeInstances = 0;
  late final String _viewType;
  bool _registered = false;

  @override
  void initState() {
    super.initState();
    _viewType =
        'recruit-designer-${DateTime.now().microsecondsSinceEpoch}';
    _registerView();
  }

  void _registerView() {
    if (_registered) return;
    _registered = true;
    _activeInstances++;

    final base = RecruitDesignerEmbedPage._resolveBaseUrl();
    final cssHref = '$base/recruit-designer/recruit-designer.css';
    final jsHref = '$base/recruit-designer/recruit-designer.js';

    // 전역 CSS 주입 — 이미 있으면 skip, 사라진 상태면 다시 붙임.
    if (web.document.getElementById(_cssLinkId) == null) {
      final link = web.HTMLLinkElement()
        ..id = _cssLinkId
        ..rel = 'stylesheet'
        ..href = cssHref;
      web.document.head?.appendChild(link);
    }

    ui_web.platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
      final host = web.HTMLDivElement();
      host.id = 'recruit-host-$viewId';
      host.style.cssText =
          'width:100%;height:100%;min-height:100vh;background:#000000;overflow:auto;';
      // 본 문서 폰트 영향과 무관하게 자체 폰트 지정
      host.style.fontFamily = "'Noto Sans KR','Pretendard',system-ui,sans-serif";

      // 호스트가 DOM에 부착된 뒤 mount 호출 (rAF 폴링으로 안전하게)
      final loader = web.HTMLScriptElement()
        ..type = 'module'
        ..text = '''
          (async () => {
            const mod = await import('$jsHref');
            const tryMount = () => {
              const h = document.getElementById('${host.id}');
              if (h && h.isConnected) {
                mod.mount(h);
              } else {
                requestAnimationFrame(tryMount);
              }
            };
            tryMount();
          })();
        ''';
      web.document.body?.appendChild(loader);

      return host;
    });
  }

  @override
  void dispose() {
    if (_registered) {
      _activeInstances--;
    }
    // 마지막 인스턴스가 사라질 때만 글로벌 CSS 제거 — Flutter 다른 화면에 스타일 누수 방지.
    if (_activeInstances <= 0) {
      _activeInstances = 0;
      final link = web.document.getElementById(_cssLinkId);
      link?.remove();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SizedBox.expand(
        child: HtmlElementView(viewType: _viewType),
      ),
    );
  }
}
