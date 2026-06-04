import { RECRUIT } from '../data';

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
            지난 4년 동안 30명+ 동료들과 함께 프로젝트를 만들어왔어요.<br class="br-wide"/>
            이번 ${RECRUIT.generation}에도 함께할 UX/UI 디자이너를 모집합니다.
          </p>

          <hr class="about-portfolio__divider reveal"/>

          <ul class="about-portfolio__stats reveal-stagger">
            <li class="about-stat">
              <div class="about-stat__num">04</div>
              <div class="about-stat__label">YEARS</div>
              <div class="about-stat__sub">since 2022</div>
            </li>
            <li class="about-stat">
              <div class="about-stat__num">30<small>+</small></div>
              <div class="about-stat__label">MEMBERS</div>
              <div class="about-stat__sub">누적 동료</div>
            </li>
            <li class="about-stat">
              <div class="about-stat__num">${String(RECRUIT.shippedAppCount).padStart(2, '0')}<small>+</small></div>
              <div class="about-stat__label">PROJECTS</div>
              <div class="about-stat__sub">출시 앱</div>
            </li>
          </ul>
        </div>
      </div>
    </section>
  `;
}
