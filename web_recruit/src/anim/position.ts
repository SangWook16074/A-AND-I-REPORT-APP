/**
 * 헤더:
 * - 좌측: 현재 섹션 위치(번호 + 이름)
 * - 중앙: 섹션 네비 — 클릭 시 해당 섹션으로 스무스 스크롤, 현재 섹션은 활성 색
 * 스크롤 컨테이너를 인자로 받아 window 또는 임의의 HTMLElement 모두 지원.
 */
const SECTIONS: { id: string; num: string; name: string }[] = [
  { id: 'about', num: '01', name: '소개' },
  { id: 'who', num: '02', name: '인재상' },
  { id: 'activity', num: '03', name: '활동' },
  { id: 'schedule', num: '04', name: '일정' },
  { id: 'process', num: '05', name: '선발' },
  { id: 'faq', num: '06', name: 'FAQ' },
];

const SCROLL_OFFSET = 80;

export function setupPositionIndicator(
  scroller: Window | HTMLElement = window,
): void {
  const numEl = document.getElementById('position-num');
  const nameEl = document.getElementById('position-name');
  if (!numEl || !nameEl) return;

  const isWindowScroll = scroller === window;
  const getViewportHeight = () =>
    isWindowScroll
      ? window.innerHeight
      : (scroller as HTMLElement).clientHeight;

  const elements: { entry: HTMLElement; info: (typeof SECTIONS)[number] }[] = [];
  for (const s of SECTIONS) {
    const el = document.getElementById(s.id);
    if (el) elements.push({ entry: el, info: s });
  }
  if (elements.length === 0) return;

  // 네비 링크: href="#sectionId" 모음
  const navLinks = Array.from(
    document.querySelectorAll<HTMLAnchorElement>('.site-nav a[href^="#"]'),
  );

  /** 클릭 시 해당 섹션으로 스무스 스크롤 */
  const scrollToSection = (id: string) => {
    const target = document.getElementById(id);
    if (!target) return;
    if (isWindowScroll) {
      window.scrollTo({
        top: target.offsetTop - SCROLL_OFFSET,
        behavior: 'smooth',
      });
    } else {
      const hostEl = scroller as HTMLElement;
      const rect = target.getBoundingClientRect();
      const hostRect = hostEl.getBoundingClientRect();
      const offset = rect.top - hostRect.top + hostEl.scrollTop;
      hostEl.scrollTo({
        top: offset - SCROLL_OFFSET,
        behavior: 'smooth',
      });
    }
  };

  navLinks.forEach((link) => {
    link.addEventListener('click', (e) => {
      const href = link.getAttribute('href');
      if (!href || !href.startsWith('#')) return;
      e.preventDefault();
      scrollToSection(href.slice(1));
    });
  });

  /** 활성 라벨 색상 토글 */
  const setActiveNav = (sectionId: string) => {
    navLinks.forEach((link) => {
      const href = link.getAttribute('href');
      link.classList.toggle('is-active', href === `#${sectionId}`);
    });
  };

  let currentId = SECTIONS[0].id;
  setActiveNav(currentId);

  const update = () => {
    const vh = getViewportHeight();
    let best: (typeof SECTIONS)[number] | null = null;
    let bestScore = Infinity;
    for (const { entry, info } of elements) {
      const rect = entry.getBoundingClientRect();
      if (rect.top > vh || rect.bottom < 0) continue;
      const centerDist = Math.abs(rect.top + rect.height / 2 - vh / 2);
      if (centerDist < bestScore) {
        bestScore = centerDist;
        best = info;
      }
    }
    if (!best) {
      best = SECTIONS[0];
    }
    if (best.id !== currentId) {
      currentId = best.id;
      setActiveNav(currentId);
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

  scroller.addEventListener('scroll', update as EventListener, {
    passive: true,
  });
  window.addEventListener('resize', update);
  update();
}
