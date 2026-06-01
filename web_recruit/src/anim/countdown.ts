/**
 * 모집 마감까지 dd:HH:mm:ss 카운트다운.
 * #countdown 안의 [data-cd="d"|"h"|"m"|"s"] 노드를 1초마다 업데이트.
 */
export function setupCountdown(endAt: Date): void {
  const root = document.getElementById('countdown');
  if (!root) return;
  const d = root.querySelector<HTMLElement>('[data-cd="d"]');
  const h = root.querySelector<HTMLElement>('[data-cd="h"]');
  const m = root.querySelector<HTMLElement>('[data-cd="m"]');
  const s = root.querySelector<HTMLElement>('[data-cd="s"]');
  if (!d || !h || !m || !s) return;

  const pad = (n: number, w = 2) => String(Math.max(0, n)).padStart(w, '0');

  const tick = () => {
    const diff = endAt.getTime() - Date.now();
    if (diff <= 0) {
      d.textContent = '00';
      h.textContent = '00';
      m.textContent = '00';
      s.textContent = '00';
      return;
    }
    const totalSec = Math.floor(diff / 1000);
    const days = Math.floor(totalSec / 86400);
    const hours = Math.floor((totalSec % 86400) / 3600);
    const minutes = Math.floor((totalSec % 3600) / 60);
    const seconds = totalSec % 60;
    d.textContent = pad(days);
    h.textContent = pad(hours);
    m.textContent = pad(minutes);
    s.textContent = pad(seconds);
  };

  tick();
  setInterval(tick, 1000);
}
