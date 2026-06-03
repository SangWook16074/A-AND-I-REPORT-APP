import { RECRUIT } from '../data';

export function footerHTML(): string {
  return /* html */ `
    <section class="cta-footer" id="apply">
      <div class="cta-footer__glow" aria-hidden="true"></div>
      <div class="container">
        <h2 class="cta-footer__title reveal">
          함께 멋진 앱을<br/>
          <em class="gradient-text" style="font-style:normal;">만들어 봐요.</em>
        </h2>
        <div class="cta-footer__actions reveal">
          <a class="btn btn--primary btn--lg" data-magnet href="${RECRUIT.forms}" target="_blank" rel="noopener noreferrer">
            지원서 작성하러 가기
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
              <path d="M5 12h14M13 5l7 7-7 7"/>
            </svg>
          </a>
          <a class="btn btn--ghost btn--lg" data-magnet href="${RECRUIT.kakao}" target="_blank" rel="noopener noreferrer">
            카카오톡 오픈채팅
          </a>
        </div>

        <div class="cta-footer__meta">
          <div>© ${new Date().getFullYear()} ${RECRUIT.club} 모바일 앱 개발 동아리</div>
          <div>
            <a href="/">메인 홈으로</a>
            <span style="margin: 0 10px; color: rgba(255,255,255,0.2);">|</span>
            <a href="${RECRUIT.kakao}" target="_blank" rel="noopener noreferrer">문의하기</a>
          </div>
        </div>
      </div>
    </section>
  `;
}
