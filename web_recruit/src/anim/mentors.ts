/**
 * 모바일 멘토 카드 스와이프 위치 점(dots) 동기화.
 * - 스크롤 위치에 가장 가까운 카드의 점을 활성화
 * - 점을 누르면 해당 카드로 부드럽게 이동
 */
export function setupMentorDots(): void {
  const grid = document.querySelector<HTMLElement>('.mentor-grid');
  const dots = Array.from(document.querySelectorAll<HTMLButtonElement>('.mentor-dots__dot'));
  if (!grid || dots.length === 0) return;
  const cards = Array.from(grid.children) as HTMLElement[];

  const update = () => {
    const left = grid.scrollLeft;
    let active = 0;
    let best = Number.POSITIVE_INFINITY;
    cards.forEach((card, i) => {
      const d = Math.abs(card.offsetLeft - grid.offsetLeft - parseFloat(getComputedStyle(grid).paddingLeft) - left);
      if (d < best) {
        best = d;
        active = i;
      }
    });
    // 끝까지 밀었으면 마지막 카드 활성
    if (left + grid.clientWidth >= grid.scrollWidth - 4) active = cards.length - 1;
    dots.forEach((dot, i) => dot.classList.toggle('is-active', i === active));
  };

  dots.forEach((dot, i) => {
    dot.addEventListener('click', () => {
      const pad = parseFloat(getComputedStyle(grid).paddingLeft);
      grid.scrollTo({ left: cards[i].offsetLeft - grid.offsetLeft - pad, behavior: 'smooth' });
    });
  });

  grid.addEventListener('scroll', () => requestAnimationFrame(update), { passive: true });
  update();
}
