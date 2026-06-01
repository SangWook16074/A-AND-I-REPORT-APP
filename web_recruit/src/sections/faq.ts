import { FAQS } from '../data';

export function faqHTML(): string {
  return /* html */ `
    <section class="section faq" id="faq">
      <div class="container">
        <h2 class="section-title reveal">
          궁금한 점,<br/>
          <em class="gradient-text" style="font-style:normal;">미리 답해드려요.</em>
        </h2>

        <div class="faq__list reveal-stagger">
          ${FAQS.map(
            (item, i) => /* html */ `
            <div class="faq-item" data-faq>
              <button type="button" class="faq-item__head" aria-expanded="false" aria-controls="faq-body-${i}">
                <span>${item.q}</span>
                <span class="faq-item__icon" aria-hidden="true">+</span>
              </button>
              <div class="faq-item__body" id="faq-body-${i}" role="region">
                <p class="faq-item__inner">${item.a}</p>
              </div>
            </div>
          `
          ).join('')}
        </div>
      </div>
    </section>
  `;
}
