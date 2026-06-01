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

function mount(): void {
  const root = document.getElementById('app');
  if (!root) return;

  root.innerHTML = [
    heroHTML(),
    aboutHTML(),
    whoHTML(),
    activityHTML(),
    scheduleHTML(),
    processHTML(),
    faqHTML(),
    footerHTML(),
  ].join('\n');
}

function start(): void {
  mount();

  // Smooth scroll을 먼저 셋업해야 ScrollTrigger가 Lenis 이벤트에 묶임
  setupSmoothScroll();

  // 스크롤 위치에 묶인 reversible 애니메이션
  setupScrollAnimations();

  // Hero 인트로 — 첫 진입 시 한 번만 (스크롤 위치와 무관)
  playHeroIntro();

  // 모집 마감까지 카운트다운 — 2026.08.30 23:59:59 마감 기준
  setupCountdown(new Date(2026, 7, 30, 23, 59, 59));

  // 헤더 좌측 현재 섹션 위치 표시
  setupPositionIndicator();

  // 인터랙티브 컴포넌트
  setupTilt();
  setupMagnet();
  setupStickyCta();
  setupFaq();
  setupCursor();

  // 이미지/폰트 로드 후 ScrollTrigger 리프레시
  window.addEventListener('load', () => ScrollTrigger.refresh());
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', start);
} else {
  start();
}
