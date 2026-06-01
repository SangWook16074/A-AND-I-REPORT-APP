import Lenis from 'lenis';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';

/**
 * Smooth scroll using Lenis + GSAP ScrollTrigger 동기화.
 * `prefers-reduced-motion`이거나 터치 디바이스에서는 네이티브 스크롤 사용.
 */
export function setupSmoothScroll(): Lenis | null {
  if (matchMedia('(prefers-reduced-motion: reduce)').matches) return null;
  // 터치 디바이스에선 네이티브 스크롤이 더 자연스러움 → Lenis 우회
  if (!matchMedia('(hover: hover) and (pointer: fine)').matches) {
    return null;
  }

  const lenis = new Lenis({
    duration: 0.95,
    smoothWheel: true,
    wheelMultiplier: 1.0,
    // 부드러운 lerp — scrub과 함께 매끄럽게
    lerp: 0.1,
  });

  // ScrollTrigger를 Lenis 스크롤에 묶음 — scrub 트윈이 정확히 따라옴
  lenis.on('scroll', ScrollTrigger.update);

  // GSAP ticker로 Lenis raf 구동 (60fps 동기화)
  gsap.ticker.add((time) => {
    lenis.raf(time * 1000);
  });
  gsap.ticker.lagSmoothing(0);

  // 해시 링크 부드럽게
  document.querySelectorAll<HTMLAnchorElement>('a[href^="#"]').forEach((a) => {
    a.addEventListener('click', (e) => {
      const id = a.getAttribute('href');
      if (!id || id === '#') return;
      const target = document.querySelector(id);
      if (!target) return;
      e.preventDefault();
      lenis.scrollTo(target as HTMLElement, { offset: -80 });
    });
  });

  return lenis;
}
