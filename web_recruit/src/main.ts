// Vite 라이브러리 모드는 process.env.NODE_ENV 치환을 자동으로 하지 않아
// 일부 의존성(특히 motion, gsap)에서 ReferenceError를 던진다. 미리 폴리필.
if (typeof (globalThis as unknown as { process?: unknown }).process === 'undefined') {
  (globalThis as unknown as { process: { env: Record<string, string> } }).process = {
    env: { NODE_ENV: 'production' },
  };
}

import './style.css';

import { RECRUIT, RECRUIT_END_AT } from './data';
import { heroHTML } from './sections/hero';
import { aboutHTML } from './sections/about';
import { whoHTML } from './sections/who';
import { activityHTML } from './sections/activity';
import { scheduleHTML } from './sections/schedule';
import { processHTML } from './sections/process';
import { faqHTML } from './sections/faq';
import { footerHTML } from './sections/footer';

import { playHeroIntro } from './anim/hero';
import { setupTilt } from './anim/tilt';
import { setupMagnet } from './anim/magnet';
import { setupStickyCta } from './anim/sticky';
import { setupFaq } from './anim/faq';
import { setupCursor } from './anim/cursor';
import { setupSmoothScroll } from './anim/smooth';
import { setupScrollAnimations, ScrollTrigger } from './anim/scroll';
import { setupCountdown } from './anim/countdown';
import { setupPositionIndicator } from './anim/position';

const SECTIONS_HTML = () =>
  [
    heroHTML(),
    aboutHTML(),
    whoHTML(),
    activityHTML(),
    scheduleHTML(),
    processHTML(),
    faqHTML(),
    footerHTML(),
  ].join('\n');

const SITE_CHROME_HTML = /* html */ `
  <div id="cursor" class="cursor" aria-hidden="true"></div>
  <header class="site-header" data-anim="header">
    <div class="site-position" id="site-position" aria-live="polite">
      <span class="site-position__num" id="position-num">01</span>
      <span class="site-position__name" id="position-name">소개</span>
    </div>
    <nav class="site-nav" aria-label="섹션 이동">
      <a href="#about">소개</a>
      <a href="#who">인재상</a>
      <a href="#activity">활동</a>
      <a href="#schedule">일정</a>
      <a href="#process">선발</a>
      <a href="#faq">FAQ</a>
    </nav>
    <a class="header-cta" href="${RECRUIT.forms}" target="_blank" rel="noopener noreferrer">
      지원하기
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
        <path d="M7 17 17 7M9 7h8v8" />
      </svg>
    </a>
  </header>
  <main id="app"></main>
  <div id="sticky-cta" class="sticky-cta" data-anim="sticky-cta" aria-hidden="true">
    <div class="sticky-cta__inner">
      <div class="sticky-cta__copy">
        <span class="sticky-cta__dot" aria-hidden="true"></span>
        <div>
          <div class="sticky-cta__title">A&amp;I ${RECRUIT.generation} 디자이너 모집 중</div>
          <div class="sticky-cta__sub">${RECRUIT.recruitStart} - ${RECRUIT.recruitEnd}</div>
        </div>
      </div>
      <div class="sticky-cta__actions">
        <a class="btn btn--ghost-line" href="${RECRUIT.kakao}" target="_blank" rel="noopener noreferrer">
          카톡 문의
        </a>
        <a class="btn btn--primary" href="${RECRUIT.forms}" target="_blank" rel="noopener noreferrer">
          지원하기
        </a>
      </div>
    </div>
  </div>
`;

/**
 * 정적 페이지를 호스트 엘리먼트에 마운트.
 * - Flutter HtmlElementView 안에서 호출됨.
 * - 호스트가 곧 스크롤 컨테이너가 된다 (window 사용 안 함).
 * - GSAP ScrollTrigger에 host를 scroller로 등록하고, sticky/position 등도 host 스크롤 이벤트 구독.
 */
export function mount(host: HTMLElement): () => void {
  host.innerHTML = SITE_CHROME_HTML;
  const appRoot = host.querySelector<HTMLElement>('#app');
  if (!appRoot) return () => {};
  appRoot.innerHTML = SECTIONS_HTML();

  // 임베드 모드 — 호스트를 스크롤 컨테이너로 등록 (Lenis는 사용 안 함, 네이티브 스크롤만)
  ScrollTrigger.defaults({ scroller: host });

  setupScrollAnimations();
  playHeroIntro();
  setupTilt();
  setupMagnet();
  setupStickyCta(host);
  setupFaq();
  setupCursor();
  setupCountdown(RECRUIT_END_AT);
  setupPositionIndicator(host);

  // 호스트 안에 동적으로 컨텐츠를 넣은 직후엔 ScrollTrigger 위치가 0으로 계산될 수 있다.
  // RAF 두 번 후(레이아웃 안정화), 추가로 100ms/500ms 후 한 번 더 refresh.
  const refresh = () => ScrollTrigger.refresh();
  requestAnimationFrame(() => requestAnimationFrame(refresh));
  setTimeout(refresh, 100);
  setTimeout(refresh, 500);

  // 호스트 자체의 사이즈가 바뀌면 (Flutter 윈도우 리사이즈 등) 다시 계산
  const ro = new ResizeObserver(() => ScrollTrigger.refresh());
  ro.observe(host);

  window.addEventListener('load', refresh);

  return () => {
    ro.disconnect();
    host.innerHTML = '';
    ScrollTrigger.getAll().forEach((t) => t.kill());
    ScrollTrigger.defaults({ scroller: window });
  };
}

/**
 * index.html에 하드코딩된 모집 기간 / forms / kakao 링크를 data.ts 값으로 동기화.
 * 스탠드얼론 모드에서만 호출 — chrome을 직접 그리는 mount() 경로는 이미 data.ts 보간 중.
 */
function syncChromeFromData(): void {
  const sub = document.querySelector<HTMLElement>('.sticky-cta__sub');
  if (sub) sub.textContent = `${RECRUIT.recruitStart} - ${RECRUIT.recruitEnd}`;
  const title = document.querySelector<HTMLElement>('.sticky-cta__title');
  if (title) title.textContent = `A&I ${RECRUIT.generation} 디자이너 모집 중`;
  document.querySelectorAll<HTMLAnchorElement>('a[href*="forms.gle"]').forEach((a) => {
    a.href = RECRUIT.forms;
  });
  document.querySelectorAll<HTMLAnchorElement>('a[href*="open.kakao.com"]').forEach((a) => {
    a.href = RECRUIT.kakao;
  });
}

// 스탠드얼론 모드 (Vite dev 서버에서 /index.html로 접근하면 자동 마운트)
if (typeof document !== 'undefined') {
  const standalone = document.getElementById('app');
  if (standalone && !standalone.dataset.embedded) {
    const start = () => {
      // index.html이 이미 chrome을 갖고 있다면 main에만 채움. 없다면 전체 마운트.
      const hasChrome = document.querySelector('.site-header');
      if (hasChrome) {
        // index.html의 하드코딩된 모집기간/링크를 data.ts 단일 출처로 덮어쓴다.
        syncChromeFromData();
        standalone.innerHTML = SECTIONS_HTML();
        setupSmoothScroll();
        setupScrollAnimations();
        playHeroIntro();
        setupTilt();
        setupMagnet();
        setupStickyCta();
        setupFaq();
        setupCursor();
        setupCountdown(RECRUIT_END_AT);
        setupPositionIndicator();
        window.addEventListener('load', () => ScrollTrigger.refresh());
      } else {
        mount(standalone);
      }
    };
    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', start);
    } else {
      start();
    }
  }
}
