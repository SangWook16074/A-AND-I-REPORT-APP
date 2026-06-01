/**
 * 헤더 좌측의 현재 섹션 위치 표시기.
 * IntersectionObserver로 뷰포트 중앙에 가장 가까운 섹션을 감지하여 라벨 업데이트.
 */
const SECTIONS: { id: string; num: string; name: string }[] = [
  { id: 'about', num: '01', name: '소개' },
  { id: 'who', num: '02', name: '인재상' },
  { id: 'activity', num: '03', name: '활동' },
  { id: 'schedule', num: '04', name: '일정' },
  { id: 'process', num: '05', name: '선발' },
  { id: 'faq', num: '06', name: 'FAQ' },
];

export function setupPositionIndicator(): void {
  const numEl = document.getElementById('position-num');
  const nameEl = document.getElementById('position-name');
  if (!numEl || !nameEl) return;

  const elements: { entry: HTMLElement; info: (typeof SECTIONS)[number] }[] = [];
  for (const s of SECTIONS) {
    const el = document.getElementById(s.id);
    if (el) elements.push({ entry: el, info: s });
  }
  if (elements.length === 0) return;

  let currentId = SECTIONS[0].id;

  const update = () => {
    const vh = window.innerHeight;
    let best: (typeof SECTIONS)[number] | null = null;
    let bestScore = Infinity;
    for (const { entry, info } of elements) {
      const rect = entry.getBoundingClientRect();
      // 뷰포트 중앙에 가장 가까운 섹션 선택
      if (rect.top > vh || rect.bottom < 0) continue;
      const centerDist = Math.abs(rect.top + rect.height / 2 - vh / 2);
      if (centerDist < bestScore) {
        bestScore = centerDist;
        best = info;
      }
    }
    if (!best) {
      // Hero에 있을 때 — 다음 섹션(소개)을 미리 표시
      best = SECTIONS[0];
    }
    if (best.id !== currentId) {
      currentId = best.id;
      // 페이드 전환
      nameEl.style.opacity = '0';
      numEl.style.opacity = '0';
      setTimeout(() => {
        numEl.textContent = best!.num;
        nameEl.textContent = best!.name;
        nameEl.style.opacity = '1';
        numEl.style.opacity = '1';
      }, 140);
    }
  };

  window.addEventListener('scroll', update, { passive: true });
  window.addEventListener('resize', update);
  update();
}
