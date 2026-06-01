/**
 * Soft custom cursor that grows on interactive elements.
 * Pointer-only — auto-disabled via CSS on touch devices.
 */
export function setupCursor(): void {
  if (!matchMedia('(hover: hover) and (pointer: fine)').matches) return;
  if (matchMedia('(prefers-reduced-motion: reduce)').matches) return;

  const cursor = document.getElementById('cursor');
  if (!cursor) return;

  let tx = -100;
  let ty = -100;
  let cx = -100;
  let cy = -100;

  window.addEventListener(
    'pointermove',
    (e) => {
      tx = e.clientX;
      ty = e.clientY;
    },
    { passive: true }
  );

  const interactiveSelector =
    'a, button, [data-magnet], [data-tilt], .faq-item__head, [role="button"]';

  document.addEventListener('pointerover', (e) => {
    const target = e.target as HTMLElement | null;
    if (target && target.closest(interactiveSelector)) {
      cursor.classList.add('is-active');
    }
  });
  document.addEventListener('pointerout', (e) => {
    const target = e.target as HTMLElement | null;
    if (target && target.closest(interactiveSelector)) {
      cursor.classList.remove('is-active');
    }
  });

  const loop = () => {
    cx += (tx - cx) * 0.22;
    cy += (ty - cy) * 0.22;
    cursor.style.transform = `translate3d(${cx - 9}px, ${cy - 9}px, 0)`;
    requestAnimationFrame(loop);
  };
  loop();
}
