/**
 * Scroll-triggered reveal animations using IntersectionObserver.
 * Adds `.is-in` to elements with [data-anim], `.reveal`, and `.reveal-stagger`.
 */
export function setupReveal(): void {
  const reduced = matchMedia('(prefers-reduced-motion: reduce)').matches;

  const revealTargets = document.querySelectorAll<HTMLElement>(
    '.reveal, .reveal-stagger'
  );

  if (reduced) {
    revealTargets.forEach((el) => el.classList.add('is-in'));
    return;
  }

  const io = new IntersectionObserver(
    (entries) => {
      for (const entry of entries) {
        if (entry.isIntersecting) {
          entry.target.classList.add('is-in');
          io.unobserve(entry.target);
        }
      }
    },
    { threshold: 0.15, rootMargin: '0px 0px -8% 0px' }
  );

  revealTargets.forEach((el) => io.observe(el));
}
