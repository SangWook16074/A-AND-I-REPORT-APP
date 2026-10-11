/*
 * Firebase Analytics(GA4) 화면별 PV 적재.
 *
 * Firebase 프로젝트(aandi-report-web)의 웹 스트림 측정 ID로 gtag.js를 직접 로드한다.
 * 자동 page_view는 끄고(send_page_view: false), 화면 전환마다 `page_view`를
 * `screen_name` 파라미터와 함께 수동 전송한다.
 *
 * 사용법
 *   - 클래식 스크립트로 로드하면 `window.aandiAnalytics`가 생긴다.
 *   - `<script src="/app/analytics.js" data-screen="recruit_designer">`처럼
 *     data-screen을 주면 로드 즉시 해당 화면 PV를 1회 전송한다(정적 페이지용).
 *   - SPA는 라우팅마다 `window.aandiAnalytics.pageView('blog_list')`를 호출한다.
 *
 * localhost에서는 전송하지 않는다. `?debug_analytics=1`을 붙이면 debug_mode로 전송해
 * Firebase 콘솔 DebugView에서 확인할 수 있다.
 */
(function () {
  const MEASUREMENT_ID = 'G-EF68JBP3LK';

  const params = new URLSearchParams(location.search);
  const isLocal = /^(localhost|127\.0\.0\.1|\[::1\])$/.test(location.hostname);
  const debug = params.get('debug_analytics') === '1';
  const enabled = !isLocal || debug;

  window.dataLayer = window.dataLayer || [];
  function gtag() {
    window.dataLayer.push(arguments);
  }

  if (enabled && !window.gtag) {
    window.gtag = gtag;
    const script = document.createElement('script');
    script.async = true;
    script.src = `https://www.googletagmanager.com/gtag/js?id=${MEASUREMENT_ID}`;
    document.head.appendChild(script);
    gtag('js', new Date());
    gtag('config', MEASUREMENT_ID, {
      send_page_view: false,
      ...(debug ? { debug_mode: true } : {}),
    });
  }

  let lastKey = null;

  /**
   * 화면 PV를 전송한다. 같은 화면·같은 경로로 연속 호출되면 무시한다.
   * @param {string} screenName snake_case 화면 식별자 (예: home, blog_detail)
   * @param {Record<string, string | number>} [extra] 추가 파라미터
   */
  function pageView(screenName, extra) {
    const key = `${screenName}|${location.pathname}${location.search}`;
    if (key === lastKey) return;
    lastKey = key;
    if (!enabled) return;
    window.gtag('event', 'page_view', {
      screen_name: screenName,
      page_title: document.title,
      page_location: location.href,
      page_path: location.pathname,
      ...extra,
    });
  }

  window.aandiAnalytics = { pageView };

  const initialScreen = document.currentScript?.dataset.screen;
  if (initialScreen) pageView(initialScreen);
})();
