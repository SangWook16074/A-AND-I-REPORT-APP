import { PROCESS_STEPS } from '../data';

export function processHTML(): string {
  return /* html */ `
    <section class="section process" id="process">
      <div class="container">
        <h2 class="section-title reveal">
          <em class="gradient-text" style="font-style:normal;">선발 절차</em>를<br/>
          안내해드려요.
        </h2>

        <ol class="process-list reveal-stagger">
          ${PROCESS_STEPS.map(
            (step) => /* html */ `
            <li class="process-row">
              <span class="process-row__num">${step.num}</span>
              <span class="process-row__title">${step.title}</span>
            </li>
          `
          ).join('')}
        </ol>
      </div>
    </section>
  `;
}
