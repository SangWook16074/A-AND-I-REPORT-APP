import './style.css';

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
    </nav>
    <a class="header-cta" href="https://forms.gle/QHuzcBn3yzm59jGX9" target="_blank" rel="noopener noreferrer">
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
          <div class="sticky-cta__title">A&amp;I 4기 디자이너 모집 중</div>
          <div class="sticky-cta__sub">2026.06.01 - 2026.08.30</div>
        </div>
      </div>
      <div class="sticky-cta__actions">
        <a class="btn btn--ghost-line" href="https://open.kakao.com/o/s6u9iDxi" target="_blank" rel="noopener noreferrer">
          카톡 문의
        </a>
        <a class="btn btn--primary" href="https://forms.gle/QHuzcBn3yzm59jGX9" target="_blank" rel="noopener noreferrer">
          지원하기
        </a>
      </div>
    </div>
  </div>
`;

/**
 * 정적 페이지를 호스트 엘리먼트에 마운트.
 * - Flutter HtmlElementView 안에서 호출됨.
 * - 호스트가 곧 페이지의 루트 컨테이너가 되며, 그 안에 헤더/메인/스티키 CTA를
 *   직접 주입한다. body 전체를 점령하지 않으므로 다른 Flutter 화면에 영향이 없다.
 */
export function mount(host: HTMLElement): () => void {
  host.innerHTML = SITE_CHROME_HTML;
  const appRoot = host.querySelector<HTMLElement>('#app');
  if (!appRoot) return () => {};
  appRoot.innerHTML = SECTIONS_HTML();

  setupSmoothScroll();
  setupScrollAnimations();
  playHeroIntro();
  setupTilt();
  setupMagnet();
  setupStickyCta();
  setupFaq();
  setupCursor();
  setupCountdown(new Date(2026, 7, 30, 23, 59, 59));
  setupPositionIndicator();

  window.addEventListener('load', () => ScrollTrigger.refresh());

  // 호출자가 unmount하고 싶을 때 정리할 수 있도록 cleanup 반환
  return () => {
    host.innerHTML = '';
    ScrollTrigger.getAll().forEach((t) => t.kill());
  };
}

// 스탠드얼론 모드 (Vite dev 서버에서 /index.html로 접근하면 자동 마운트)
if (typeof document !== 'undefined') {
  const standalone = document.getElementById('app');
  if (standalone && !standalone.dataset.embedded) {
    const start = () => {
      // index.html이 이미 chrome을 갖고 있다면 main에만 채움. 없다면 전체 마운트.
      const hasChrome = document.querySelector('.site-header');
      if (hasChrome) {
        standalone.innerHTML = SECTIONS_HTML();
        setupSmoothScroll();
        setupScrollAnimations();
        playHeroIntro();
        setupTilt();
        setupMagnet();
        setupStickyCta();
        setupFaq();
        setupCursor();
        setupCountdown(new Date(2026, 7, 30, 23, 59, 59));
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
