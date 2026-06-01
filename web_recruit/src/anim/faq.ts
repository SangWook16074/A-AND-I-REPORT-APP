/**
 * Accordion behavior for the FAQ.
 */
export function setupFaq(): void {
  const items = document.querySelectorAll<HTMLElement>('[data-faq]');
  items.forEach((item) => {
    const head = item.querySelector<HTMLButtonElement>('.faq-item__head');
    const body = item.querySelector<HTMLElement>('.faq-item__body');
    if (!head || !body) return;

    head.addEventListener('click', () => {
      const isOpen = item.classList.toggle('is-open');
      head.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
      if (isOpen) {
        body.style.maxHeight = `${body.scrollHeight}px`;
      } else {
        body.style.maxHeight = '0';
      }
    });
  });
}
