import { PAGES, PROCESS_STEPS, RECRUIT, RECRUIT_END_AT, TEAM, WHO_WE_WANT } from '../data';

const ARROW = /* html */ `
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
    <path d="M5 12h14M13 5l7 7-7 7"/>
  </svg>`;

/** 마감까지 남은 일수 → "D-21" / "D-Day" / "마감". */
function dDay(): string {
  const days = Math.ceil((RECRUIT_END_AT.getTime() - Date.now()) / 86_400_000) - 1;
  if (days < 0) return '마감';
  return days === 0 ? 'D-Day' : `D-${days}`;
}

const list = (items: string[]): string =>
  `<ul class="jp-list">${items.map((it) => `<li>${it}</li>`).join('')}</ul>`;

/** 채용 공고 본문의 한 블록 (좌측 제목 + 우측 내용). */
const block = (title: string, body: string): string => /* html */ `
  <section class="jp-block reveal">
    <h2 class="jp-block__title">${title}</h2>
    <div class="jp-block__body">${body}</div>
  </section>`;

export function teamHTML(): string {
  const summary = /* html */ `
    <dl class="jp-meta">
      <div><dt>모집 직군</dt><dd>${RECRUIT.role}</dd></div>
      <div><dt>모집 기간</dt><dd>${RECRUIT.recruitStart} – ${RECRUIT.recruitEnd}</dd></div>
      <div><dt>활동 기간</dt><dd>${RECRUIT.activityStart} – ${RECRUIT.activityEnd}</dd></div>
      <div><dt>활동 장소</dt><dd>서울 노원구</dd></div>
      <div><dt>사용 툴</dt><dd>Figma</dd></div>
    </dl>`;

  return /* html */ `
    <header class="jp-header">
      <a class="jp-header__back" href="${PAGES.main}">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M19 12H5M11 19l-7-7 7-7"/></svg>
        모집 안내
      </a>
      <span class="jp-header__brand">A&amp;I <i>×</i> ${TEAM.name}</span>
      <span class="jp-header__space" aria-hidden="true"></span>
    </header>

    <div class="jp-page">
      <!-- 공고 헤드 -->
      <div class="jp-head">
        <p class="jp-head__company reveal">${TEAM.name} · A&amp;I</p>
        <h1 class="jp-head__title reveal">${RECRUIT.role}</h1>
        <ul class="jp-tags reveal">
          <li>모임 서비스</li><li>신규 앱</li><li>현업 멘토</li>
        </ul>
      </div>

      <div class="jp-layout">
        <!-- 본문 -->
        <article class="jp-body">
          ${block(
            '팀 소개',
            /* html */ `
            <p class="jp-lead">${TEAM.intro}</p>
            <p>스터디, 동아리, 프로젝트 팀처럼 여러 사람이 함께하는 모임에서는 공지, 일정 조율, 출석 확인, 회비 정산이 단톡방과 여러 앱에 흩어져 관리돼요. 중요한 공지는 대화에 묻히고, 관리자는 참석 여부와 회비 납부를 일일이 확인해야 하죠.</p>
            <p>${TEAM.name}는 모임 운영에 필요한 기능을 <strong>하나의 서비스에서 통합 관리할 수 있는 폐쇄형 그룹 플랫폼</strong>을 만들고 있어요.</p>`
          )}

          ${block(
            '우리가 만드는 것',
            /* html */ `
            <dl class="jp-features">
              ${TEAM.features
                .map((f) => `<div><dt>${f.label}</dt><dd>${f.desc}</dd></div>`)
                .join('')}
            </dl>
            <p class="jp-note">${TEAM.tech}</p>`
          )}

          ${block('팀 구성', list(TEAM.members))}

          ${block('합류하시면 함께 할 일', list(TEAM.duties))}

          ${block('이런 분을 찾아요', list(WHO_WE_WANT.map((w) => w.title)))}

          ${block('이런 분이면 더 좋아요', list(TEAM.preferred))}

          ${block(
            '전형 절차',
            /* html */ `
            <ol class="jp-steps">
              ${PROCESS_STEPS.map((s) => `<li><b>${s.title}</b><span>${s.desc}</span></li>`).join('')}
            </ol>`
          )}

          ${block('모집 개요', summary)}

          <p class="jp-closing reveal">${TEAM.closing}</p>
        </article>

        <!-- 지원 카드 (데스크톱에선 sticky) -->
        <aside class="jp-apply">
          <div class="jp-apply__card">
            <div class="jp-apply__top">
              <span class="jp-apply__dday">${dDay()}</span>
              <span class="jp-apply__until">${RECRUIT.recruitEnd} 마감</span>
            </div>
            <p class="jp-apply__role">${TEAM.name} · ${RECRUIT.role}</p>
            <a class="jp-btn jp-btn--primary" href="${RECRUIT.forms}" target="_blank" rel="noopener noreferrer">지원하기 ${ARROW}</a>
            <a class="jp-btn jp-btn--ghost" href="${RECRUIT.kakao}" target="_blank" rel="noopener noreferrer">카카오톡 문의</a>
          </div>
        </aside>
      </div>
    </div>

    <footer class="jp-footer">
      <span>© ${new Date().getFullYear()} ${RECRUIT.club} 모바일 앱 개발 동아리</span>
      <a href="${PAGES.main}">모집 안내 다시 보기</a>
    </footer>
  `;
}
