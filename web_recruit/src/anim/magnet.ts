/**
 * Magnetic effect for buttons. Pointer-only.
 */
export function setupMagnet(): void {
  if (matchMedia('(prefers-reduced-motion: reduce)').matches) return;
  if (!matchMedia('(hover: hover) and (pointer: fine)').matches) return;

  document.querySelectorAll<HTMLElement>('[data-magnet]').forEach((el) => {
    const strength = 12;
    let raf = 0;
    let tx = 0;
    let ty = 0;
    let cx = 0;
    let cy = 0;

    const onMove = (e: PointerEvent) => {
      const rect = el.getBoundingClientRect();
      const x = e.clientX - (rect.left + rect.width / 2);
      const y = e.clientY - (rect.top + rect.height / 2);
      tx = (x / rect.width) * strength;
      ty = (y / rect.height) * strength;
      if (!raf) loop();
    };

    const onLeave = () => {
      tx = 0;
      ty = 0;
      if (!raf) loop();
    };

    const loop = () => {
      cx += (tx - cx) * 0.22;
      cy += (ty - cy) * 0.22;
      el.style.transform = `translate3d(${cx.toFixed(2)}px, ${cy.toFixed(2)}px, 0)`;
      if (Math.abs(tx - cx) > 0.05 || Math.abs(ty - cy) > 0.05) {
        raf = requestAnimationFrame(loop);
      } else {
        raf = 0;
      }
    };

    el.addEventListener('pointermove', onMove);
    el.addEventListener('pointerleave', onLeave);
  });
}
