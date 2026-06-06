import { RECRUIT } from '../data';

export function heroHTML(): string {
  return /* html */ `
    <section class="hero" id="hero" aria-label="A&I 4기 디자이너 모집">
      <div class="hero__mesh" aria-hidden="true">
        <div class="hero__mesh-third"></div>
      </div>
      <div class="hero__noise" aria-hidden="true"></div>

      <div class="container" style="position: relative;">
        <h1 class="hero__title">
          <span class="hero__title-line"><span class="hero__title-word">A&amp;I ${RECRUIT.generation}</span></span>
          <span class="hero__title-line"><span class="hero__title-word"><em class="hero__title-grad" style="font-style:normal;">UX/UI 디자이너</em> 모집</span></span>
        </h1>

        <div class="hero__timer" data-anim="hero-badge">
          <div class="hero__timer-display" id="countdown">
            <span data-cd="d">00</span><span class="hero__timer-sep">:</span><span data-cd="h">00</span><span class="hero__timer-sep">:</span><span data-cd="m">00</span><span class="hero__timer-sep">:</span><span data-cd="s">00</span>
          </div>
        </div>

        <div class="hero__actions" data-anim="hero-actions">
          <a class="btn btn--primary btn--lg" data-magnet href="${RECRUIT.forms}" target="_blank" rel="noopener noreferrer">
            지금 지원하기
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
              <path d="M5 12h14M13 5l7 7-7 7"/>
            </svg>
          </a>
          <a class="btn btn--ghost btn--lg" data-magnet href="${RECRUIT.kakao}" target="_blank" rel="noopener noreferrer">
            카톡 오픈채팅 문의
          </a>
        </div>
      </div>

      <div class="hero__scroll" aria-hidden="true">
        SCROLL
        <span class="line"></span>
      </div>
    </section>
  `;
}
