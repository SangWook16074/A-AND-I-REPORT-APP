import { PAGES, RECRUIT } from '../data';

export function aboutHTML(): string {
  return /* html */ `
    <section class="section about" id="about">
      <div class="container container--portfolio">
        <div class="about-portfolio">
          <h2 class="about-portfolio__heading reveal">
            안녕하세요,<br/>
            우리는 <em class="gradient-text" style="font-style:normal;">${RECRUIT.club}</em>입니다.
          </h2>

          <p class="about-portfolio__body reveal">
            지난 <strong class="about-portfolio__num">4년</strong> 동안 <strong class="about-portfolio__num">30명+</strong> 동료들과 함께 <strong class="about-portfolio__num">${RECRUIT.shippedAppCount}개 이상</strong>의 프로젝트를 진행했었습니다.<br class="br-wide"/>
            지금 진행 중인 모아모아 프로젝트를 함께 완성해 갈 UX/UI 디자이너를 모집합니다.
          </p>

          <a class="about-portfolio__link reveal" href="${PAGES.team}">
            합류하실 팀이 궁금하다면?
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
              <path d="M5 12h14M13 5l7 7-7 7"/>
            </svg>
          </a>
        </div>
      </div>
    </section>
  `;
}
