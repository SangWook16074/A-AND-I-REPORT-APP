import { PROJECT } from '../data';

export function projectHTML(): string {
  return /* html */ `
    <section class="section project" id="project">
      <div class="container">
        <h2 class="section-title reveal">
          합류하실 팀을<br/>
          <em class="gradient-text" style="font-style:normal;">소개해드릴게요.</em>
        </h2>

        <p class="section-sub reveal">${PROJECT.intro}</p>

        <div class="project__mission reveal">
          <span class="project__label">OUR MISSION</span>
          <p class="project__mission-text">${PROJECT.mission}</p>
        </div>

        <div class="project__ways">
          <span class="project__label reveal">HOW WE WORK</span>
          <ol class="process-list reveal-stagger">
            ${PROJECT.ways
              .map(
                (w) => /* html */ `
              <li class="process-row">
                <span class="process-row__num">${w.num}</span>
                <span class="process-row__title">${w.title}</span>
              </li>
            `
              )
              .join('')}
          </ol>
        </div>

        <p class="project__closing reveal">${PROJECT.closing}</p>
      </div>
    </section>
  `;
}
