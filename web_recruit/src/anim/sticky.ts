/**
 * Show sticky CTA after the user scrolls past the hero.
 * Hide when within ~viewport of the footer CTA to avoid overlapping.
 */
export function setupStickyCta(): void {
  const sticky = document.getElementById('sticky-cta');
  const hero = document.getElementById('hero');
  const apply = document.getElementById('apply');
  if (!sticky || !hero) return;

  let heroBottom = 0;
  let applyTop = 0;

  const recompute = () => {
    heroBottom = hero.offsetTop + hero.offsetHeight - 80;
    if (apply) {
      applyTop = apply.offsetTop - window.innerHeight * 0.7;
    } else {
      applyTop = Number.POSITIVE_INFINITY;
    }
  };

  const onScroll = () => {
    const y = window.scrollY;
    const shouldShow = y > heroBottom && y < applyTop;
    sticky.classList.toggle('is-visible', shouldShow);
    sticky.setAttribute('aria-hidden', shouldShow ? 'false' : 'true');
  };

  recompute();
  onScroll();
  window.addEventListener('scroll', onScroll, { passive: true });
  window.addEventListener('resize', () => {
    recompute();
    onScroll();
  });
}
