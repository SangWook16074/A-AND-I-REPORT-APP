import { animate, stagger } from 'motion';

/**
 * Animates the hero title words sliding up, then the rest of the hero meta.
 */
export function playHeroIntro(): void {
  const reduced = matchMedia('(prefers-reduced-motion: reduce)').matches;
  const words = document.querySelectorAll<HTMLElement>('.hero__title-word');
  const others = document.querySelectorAll<HTMLElement>(
    '[data-anim="hero-badge"], [data-anim="hero-sub"], [data-anim="hero-actions"], [data-anim="hero-meta"]'
  );

  if (reduced) {
    words.forEach((w) => (w.style.transform = 'translateY(0)'));
    others.forEach((el) => {
      el.style.opacity = '1';
      el.style.transform = 'translateY(0)';
    });
    return;
  }

  if (words.length > 0) {
    animate(
      words,
      { transform: ['translateY(110%)', 'translateY(0%)'] },
      {
        duration: 1.05,
        delay: stagger(0.1, { start: 0.15 }),
        easing: [0.22, 1, 0.36, 1],
      }
    );
  }

  others.forEach((el, i) => {
    el.style.opacity = '0';
    el.style.transform = 'translateY(24px)';
    animate(
      el,
      { opacity: [0, 1], transform: ['translateY(24px)', 'translateY(0)'] },
      { duration: 0.7, delay: 0.45 + i * 0.1, easing: [0.22, 1, 0.36, 1] }
    );
  });
}

