export function activityHTML(): string {
  return /* html */ `
    <section class="section activity" id="activity">
      <div class="container">
        <h2 class="section-title reveal">
          무엇을<br/>
          <em class="gradient-text" style="font-style:normal;">함께 만들까요.</em>
        </h2>

        <ul class="info-list reveal-stagger">
          <li class="info-row">
            <span class="info-row__label">모집 분야</span>
            <span class="info-row__value">프로젝트 UX/UI 디자인</span>
          </li>
          <li class="info-row">
            <span class="info-row__label">활동 내용</span>
            <span class="info-row__value">앱 화면 설계 · 미디어 / 아이콘 제작 · 출시 준비</span>
          </li>
          <li class="info-row">
            <span class="info-row__label">사용 툴</span>
            <span class="info-row__value">Figma</span>
          </li>
          <li class="info-row">
            <span class="info-row__label">활동 장소</span>
            <span class="info-row__value">서울 노원구 (팀별 자율)</span>
          </li>
          <li class="info-row">
            <span class="info-row__label">활동 시간</span>
            <span class="info-row__value">팀별 일정 자율 조율</span>
          </li>
        </ul>
      </div>
    </section>
  `;
}
