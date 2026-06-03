/**
 * Hero를 지나면 sticky CTA를 보여주고, footer CTA 근처에선 숨김.
 * 스크롤 컨테이너를 인자로 받아 window 또는 임의의 HTMLElement 모두 지원.
 */
export function setupStickyCta(
  scroller: Window | HTMLElement = window,
): void {
  const sticky = document.getElementById('sticky-cta');
  const hero = document.getElementById('hero');
  const apply = document.getElementById('apply');
  if (!sticky || !hero) return;

  let heroBottom = 0;
  let applyTop = 0;
  const isWindowScroll = scroller === window;

  const getScrollY = () =>
    isWindowScroll
      ? window.scrollY
      : (scroller as HTMLElement).scrollTop;

  const getViewportHeight = () =>
    isWindowScroll
      ? window.innerHeight
      : (scroller as HTMLElement).clientHeight;

  const recompute = () => {
    heroBottom = hero.offsetTop + hero.offsetHeight - 80;
    applyTop = apply
      ? apply.offsetTop - getViewportHeight() * 0.7
      : Number.POSITIVE_INFINITY;
  };

  const onScroll = () => {
    const y = getScrollY();
    const shouldShow = y > heroBottom && y < applyTop;
    sticky.classList.toggle('is-visible', shouldShow);
    sticky.setAttribute('aria-hidden', shouldShow ? 'false' : 'true');
  };

  recompute();
  onScroll();
  scroller.addEventListener('scroll', onScroll as EventListener, {
    passive: true,
  });
  window.addEventListener('resize', () => {
    recompute();
    onScroll();
  });
}
