import { WHO_WE_WANT } from '../data';

export function whoHTML(): string {
  return /* html */ `
    <section class="section who" id="who">
      <div class="container">
        <h2 class="section-title reveal">
          이런 디자이너분을<br/>
          <em class="gradient-text" style="font-style:normal;">찾고 있어요.</em>
        </h2>

        <ul class="who-list reveal-stagger">
          ${WHO_WE_WANT.map(
            (w) => /* html */ `
            <li class="who-row">
              <span class="who-row__num">${w.num}</span>
              <span class="who-row__title">${w.title}</span>
            </li>
          `
          ).join('')}
        </ul>
      </div>
    </section>
  `;
}
