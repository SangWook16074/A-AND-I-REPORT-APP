/**
 * Animate timeline progress bar based on scroll position within the timeline
 * container, and activate timeline nodes as they enter view.
 */
export function setupTimeline(): void {
  const timeline = document.getElementById('timeline');
  const progress = document.getElementById('timeline-progress');
  if (!timeline || !progress) return;

  const nodes = timeline.querySelectorAll<HTMLElement>('.timeline__node');

  const onScroll = () => {
    const rect = timeline.getBoundingClientRect();
    const vh = window.innerHeight;
    const total = rect.height;
    const visible = Math.max(0, Math.min(total, vh - rect.top));
    const pct = Math.max(0, Math.min(1, visible / total));
    progress.style.height = `${(pct * 100).toFixed(2)}%`;
  };

  const io = new IntersectionObserver(
    (entries) => {
      for (const entry of entries) {
        if (entry.isIntersecting) {
          entry.target.classList.add('is-active');
        }
      }
    },
    { threshold: 0.4 }
  );
  nodes.forEach((n) => io.observe(n));

  window.addEventListener('scroll', onScroll, { passive: true });
  window.addEventListener('resize', onScroll);
  onScroll();
}
