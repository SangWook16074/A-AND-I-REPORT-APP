/**
 * 3D tilt + light-follow effect on hover for elements with [data-tilt].
 * Pointer-only — disabled on touch / reduced-motion.
 */
export function setupTilt(): void {
  if (matchMedia('(prefers-reduced-motion: reduce)').matches) return;
  if (!matchMedia('(hover: hover) and (pointer: fine)').matches) return;

  document.querySelectorAll<HTMLElement>('[data-tilt]').forEach((el) => {
    let raf = 0;
    let targetX = 0;
    let targetY = 0;
    let currentX = 0;
    let currentY = 0;

    const onMove = (e: PointerEvent) => {
      const rect = el.getBoundingClientRect();
      const x = (e.clientX - rect.left) / rect.width;
      const y = (e.clientY - rect.top) / rect.height;
      targetY = (x - 0.5) * 12; // rotateY
      targetX = -(y - 0.5) * 10; // rotateX
      el.style.setProperty('--mx', `${(x * 100).toFixed(2)}%`);
      el.style.setProperty('--my', `${(y * 100).toFixed(2)}%`);
      if (!raf) loop();
    };

    const onLeave = () => {
      targetX = 0;
      targetY = 0;
      if (!raf) loop();
    };

    const loop = () => {
      currentX += (targetX - currentX) * 0.18;
      currentY += (targetY - currentY) * 0.18;
      el.style.setProperty('--tilt-x', `${currentX.toFixed(3)}deg`);
      el.style.setProperty('--tilt-y', `${currentY.toFixed(3)}deg`);
      if (Math.abs(targetX - currentX) > 0.05 || Math.abs(targetY - currentY) > 0.05) {
        raf = requestAnimationFrame(loop);
      } else {
        raf = 0;
      }
    };

    el.addEventListener('pointermove', onMove);
    el.addEventListener('pointerleave', onLeave);
  });
}
