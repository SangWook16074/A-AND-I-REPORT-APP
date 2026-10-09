import { MENTORS } from '../data';

/** 멘토 카드 — Flutter `MentorCard`의 톤(그라데이션 배경 · 역할 pill · 파란 점 목록)을 세로형으로 확대. */
const card = (m: (typeof MENTORS)[number]): string => /* html */ `
  <li class="mentor-card">
    <div class="mentor-card__top">
      <img class="mentor-card__photo" src="${m.image}" alt="${m.name} 멘토" width="96" height="96" loading="lazy" decoding="async" />
      <div class="mentor-card__head">
        <strong class="mentor-card__name">${m.name}</strong>
        <span class="mentor-card__role">${m.role}</span>
      </div>
    </div>
    <ul class="mentor-card__list">
      ${m.achievements.map((a) => `<li>${a}</li>`).join('')}
    </ul>
  </li>`;

export function mentorsHTML(): string {
  return /* html */ `
    <section class="section mentors" id="mentors">
      <div class="container">
        <h2 class="section-title reveal">
          <em class="gradient-text" style="font-style:normal;">멘토</em>를<br/>
          소개해요.
        </h2>
        <p class="section-sub reveal">현직자 및 국내 유명 부트캠프 출신 멘토진이 여러분의 성장을 돕습니다.</p>
      </div>

      <div class="container mentor-grid-wrap">
        <!-- 3명뿐이라 흘려보내지 않고 한 번에 보여준다. 모바일은 가로 스와이프(scroll-snap). -->
        <ul class="mentor-grid reveal-stagger">
          ${MENTORS.map(card).join('')}
        </ul>
        <!-- 모바일 스와이프 위치 표시 (데스크톱에선 숨김) -->
        <div class="mentor-dots" role="tablist" aria-label="멘토 카드 위치">
          ${MENTORS.map((m, i) => `<button type="button" class="mentor-dots__dot${i === 0 ? ' is-active' : ''}" aria-label="${m.name} 카드로 이동"></button>`).join('')}
        </div>
      </div>
    </section>
  `;
}
