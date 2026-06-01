import { RECRUIT } from '../data';

export function scheduleHTML(): string {
  return /* html */ `
    <section class="section schedule" id="schedule">
      <div class="container">
        <h2 class="section-title reveal">
          예정된<br/>
          <em class="gradient-text" style="font-style:normal;">여정</em>이에요.
        </h2>

        <ul class="info-list reveal-stagger">
          <li class="info-row">
            <span class="info-row__label">모집 기간</span>
            <span class="info-row__value">${RECRUIT.recruitStart} – ${RECRUIT.recruitEnd}</span>
          </li>
          <li class="info-row">
            <span class="info-row__label">선발 과정</span>
            <span class="info-row__value">서류 접수 → 대면 인터뷰 → 최종 합격</span>
          </li>
          <li class="info-row">
            <span class="info-row__label">활동 기간</span>
            <span class="info-row__value">${RECRUIT.activityStart} – ${RECRUIT.activityEnd}</span>
          </li>
          <li class="info-row">
            <span class="info-row__label">활동 마무리</span>
            <span class="info-row__value">팀별 앱 출시 & 활동 종료</span>
          </li>
        </ul>
      </div>
    </section>
  `;
}
