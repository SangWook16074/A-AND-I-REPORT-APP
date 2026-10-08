// A&I 웹 UI 셸.
// 기존 Flutter 화면 구조를 그대로 DOM으로 그리고, 운영 정책/데이터 조회는 Dart 브릿지(window.aandi)에 위임한다.

const viewEl = document.querySelector('[data-view]');
const navEl = document.querySelector('[data-nav]');
const menuEl = document.querySelector('[data-menu]');
const menuButton = document.querySelector('[data-menu-button]');
const headerEl = document.querySelector('[data-header]');

/** Material Icons 경로 (Flutter Icons.*와 동일 글리프) */
const ICONS = {
  menu: 'M4 18h16c.55 0 1-.45 1-1s-.45-1-1-1H4c-.55 0-1 .45-1 1s.45 1 1 1zm0-5h16c.55 0 1-.45 1-1s-.45-1-1-1H4c-.55 0-1 .45-1 1s.45 1 1 1zM3 7c0 .55.45 1 1 1h16c.55 0 1-.45 1-1s-.45-1-1-1H4c-.55 0-1 .45-1 1z',
  chevronRight: 'M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z',
  arrowBack: 'M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z',
  person: 'M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z',
  article: 'M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-5 14H7v-2h7v2zm3-4H7v-2h10v2zm0-4H7V7h10v2z',
  arrowDown: 'M7.41 8.59L12 13.17l4.59-4.58L18 10l-6 6-6-6 1.41-1.41z',
  arrowForwardIos: 'M7.38 21.01c.49.49 1.28.49 1.77 0l8.31-8.31c.39-.39.39-1.02 0-1.41L9.15 2.98c-.49-.49-1.28-.49-1.77 0s-.49 1.28 0 1.77L14.62 12l-7.25 7.25c-.48.48-.48 1.28.01 1.76z',
  terminal: 'M20 4H4c-1.11 0-2 .9-2 2v12c0 1.1.89 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.89-2-2-2zm0 14H4V8h16v10zm-2-1h-6v-2h6v2zM7.5 17l-1.41-1.41L8.67 13l-2.59-2.59L7.5 9l4 4-4 4z',
  storage: 'M2 20h20v-4H2v4zm2-3h2v2H4v-2zM2 4v4h20V4H2zm4 3H4V5h2v2zm-4 7h20v-4H2v4zm2-3h2v2H4v-2z',
  layers: 'M11.99 18.54l-7.37-5.73L3 14.07l9 7 9-7-1.63-1.27-7.38 5.74zM12 16l7.36-5.73L21 9l-9-7-9 7 1.63 1.27L12 16z',
  groups: 'M12 12.75c1.63 0 3.07.39 4.24.9 1.08.48 1.76 1.56 1.76 2.73V18H6v-1.61c0-1.18.68-2.26 1.76-2.73 1.17-.52 2.61-.91 4.24-.91zM4 13c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm1.13 1.1c-.37-.06-.74-.1-1.13-.1-.99 0-1.93.21-2.78.58C.48 14.9 0 15.62 0 16.43V18h4.5v-1.61c0-.83.23-1.61.63-2.29zM20 13c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm4 3.43c0-.81-.48-1.53-1.22-1.85-.85-.37-1.79-.58-2.78-.58-.39 0-.76.04-1.13.1.4.68.63 1.46.63 2.29V18H24v-1.57zM12 6c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3z',
  school: 'M5 13.18v4L12 21l7-3.82v-4L12 17l-7-3.82zM12 3L1 9l11 6 9-4.91V17h2V9L12 3z',
  notifications: 'M7.58 4.08L6.15 2.65C3.75 4.48 2.17 7.3 2.03 10.5h2c.15-2.65 1.51-4.97 3.55-6.42zm12.39 6.42h2c-.15-3.2-1.73-6.02-4.12-7.85l-1.42 1.43c2.02 1.45 3.39 3.77 3.54 6.42zM18 11c0-3.07-1.64-5.64-4.5-6.32V4c0-.83-.67-1.5-1.5-1.5s-1.5.67-1.5 1.5v.68C7.63 5.36 6 7.92 6 11v5l-2 2v1h16v-1l-2-2v-5zm-6 11c.14 0 .27-.01.4-.04.65-.14 1.18-.58 1.44-1.18.1-.24.15-.5.15-.78h-4c.01 1.1.9 2 2.01 2z',
};

function icon(name) {
  const svg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
  svg.setAttribute('viewBox', '0 0 24 24');
  svg.setAttribute('class', 'icon');
  svg.setAttribute('aria-hidden', 'true');
  const path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  path.setAttribute('d', ICONS[name]);
  svg.append(path);
  return svg;
}

/** Dart 브릿지(aandi_bridge.js)를 로드하고 준비될 때까지 기다린다. */
function loadBridge() {
  return new Promise((resolve, reject) => {
    if (window.aandi) return resolve(window.aandi);
    window.__aandiReady = () => resolve(window.aandi);
    const script = document.createElement('script');
    script.src = `/app/aandi_bridge.js?v=${Date.now()}`;
    script.onload = () => window.aandi && resolve(window.aandi);
    script.onerror = () => reject(new Error('bridge load failed'));
    document.head.appendChild(script);
  });
}

/** 브릿지 비동기 결과(envelope)를 풀어 실패 시 { message, statusCode }를 throw한다. */
async function unwrap(promise) {
  const result = await promise;
  if (!result.ok) throw result.error;
  return result.data;
}

/** 태그와 속성, 자식을 받아 DOM 요소를 만든다. 텍스트는 항상 textContent로 넣는다. */
function h(tag, attrs = {}, ...children) {
  const el = document.createElement(tag);
  for (const [key, value] of Object.entries(attrs)) {
    if (value == null || value === false) continue;
    if (key === 'class') el.className = value;
    else if (key.startsWith('on')) el.addEventListener(key.slice(2), value);
    else el.setAttribute(key, value === true ? '' : value);
  }
  for (const child of children.flat()) {
    if (child == null || child === false) continue;
    el.append(child instanceof Node ? child : document.createTextNode(String(child)));
  }
  return el;
}

function link(path, attrs, ...children) {
  return h('a', { ...attrs, href: path, 'data-link': true }, ...children);
}

/** 이미지 로딩 실패 시 기존 Flutter errorWidget처럼 대체 아이콘을 보여준다. */
function thumbnail(url) {
  const box = h('div', { class: 'thumb' });
  const fallback = h('div', { class: 'thumb__fallback' }, icon('article'));
  if (!url) {
    box.append(fallback);
    return box;
  }
  const img = h('img', { src: url, alt: '', loading: 'lazy', decoding: 'async' });
  img.addEventListener('error', () => img.replaceWith(fallback));
  box.append(img);
  return box;
}

function avatar(url) {
  const el = h('span', { class: 'avatar', 'aria-hidden': 'true' });
  if (url) {
    const img = h('img', { src: url, alt: '' });
    img.addEventListener('error', () => img.replaceWith(icon('person')));
    el.append(img);
  } else {
    el.append(icon('person'));
  }
  return el;
}

function progress() {
  return h('div', { class: 'progress', role: 'progressbar', 'aria-label': '불러오는 중' });
}

function feedback(message, { actionLabel, onAction, modifier } = {}) {
  return h('div', { class: `feedback ${modifier ?? ''}`.trim() },
    h('p', { class: 'feedback__message' }, message),
    actionLabel && onAction ? h('button', { class: 'outlined-button', type: 'button', onclick: onAction }, actionLabel) : null,
  );
}

/* ───────── Top bar ───────── */

function renderTopBar(menus) {
  navEl.replaceChildren(...menus.map((menu) => link(menu.path, { class: 'top-bar__nav-item' }, menu.label)));
  menuEl.replaceChildren(...menus.map((menu) => link(menu.path, { class: 'popup-menu__item', role: 'menuitem' }, menu.label)));
}

function setMenuOpen(open) {
  menuEl.hidden = !open;
  menuButton.setAttribute('aria-expanded', String(open));
}

/* ───────── Home: 내년에 만나요 (PromotionPage 구성) ───────── */

const SVG_NS = 'http://www.w3.org/2000/svg';

function svgEl(tag, attrs) {
  const el = document.createElementNS(SVG_NS, tag);
  for (const [key, value] of Object.entries(attrs)) el.setAttribute(key, value);
  return el;
}

/** GrowthTogetherWidget: 흰색/파란색 계단형 그래프가 차례로 그려지고 끝에 화살촉이 붙는다. */
function growthGraph() {
  const svg = svgEl('svg', { class: 'growth', viewBox: '0 0 100 100', 'aria-hidden': 'true' });
  const lines = [
    { cls: 'growth__secondary', color: '#ffffff', width: 3, d: 'M-3 93H8.25V71H30.75V49H53.25V27H75.75V8', tip: [75.75, 8] },
    { cls: 'growth__primary', color: '#3b83f6', width: 4, d: 'M5 85H16.25V63H38.75V41H61.25V19H83.75V8', tip: [83.75, 8] },
  ];
  for (const line of lines) {
    svg.append(svgEl('path', { class: `${line.cls} growth__blur`, d: line.d, stroke: line.color, 'stroke-width': line.width, pathLength: 1, opacity: 0.6 }));
  }
  for (const line of lines) {
    svg.append(svgEl('path', { class: line.cls, d: line.d, stroke: line.color, 'stroke-width': line.width, pathLength: 1 }));
    const size = line.width * 1.5;
    const [x, y] = line.tip;
    svg.append(svgEl('polygon', {
      class: `growth__head ${line.cls === 'growth__primary' ? 'growth__head--primary' : ''}`,
      points: `${x},${y - size} ${x - size * 0.866},${y + size / 2} ${x + size * 0.866},${y + size / 2}`,
      fill: line.color,
    }));
  }
  return svg;
}

/** AnimateOnVisible: 화면에 들어오면 한 번만 등장 애니메이션을 실행한다. */
function observeReveal(root, signal) {
  const targets = root.querySelectorAll('.reveal, .growth');
  if (!('IntersectionObserver' in window)) {
    targets.forEach((el) => el.classList.add('is-visible', 'is-drawn'));
    return;
  }
  const observer = new IntersectionObserver((entries) => {
    for (const entry of entries) {
      if (!entry.isIntersecting) continue;
      entry.target.classList.add(entry.target.classList.contains('growth') ? 'is-drawn' : 'is-visible');
      observer.unobserve(entry.target);
    }
  }, { threshold: 0.2 });
  targets.forEach((el) => observer.observe(el));
  signal.addEventListener('abort', () => observer.disconnect());
}

function sectionHeader(title, subtitle) {
  return [
    h('h2', { class: 'promo-section__title reveal' }, title),
    h('p', { class: 'promo-section__subtitle reveal' }, subtitle),
  ];
}

function renderPromoHero(status) {
  const hero = h('section', { class: 'promo-hero' },
    h('div', { class: 'promo-hero__content' },
      h('h1', { class: 'promo-hero__title fade-up', style: 'animation-delay: 400ms' }, status.headline),
      h('p', { class: 'promo-hero__subtitle fade-up', style: 'animation-delay: 600ms' }, status.subtitle),
      h('p', { class: 'promo-hero__detail fade-up', style: 'animation-delay: 800ms' }, status.detail),
    ),
    h('button', {
      class: 'promo-hero__scroll',
      type: 'button',
      onclick: () => hero.nextElementSibling?.scrollIntoView({ behavior: 'smooth' }),
    }, '더 알아보기', icon('arrowDown')),
  );
  return hero;
}

function renderPromoIntro() {
  const title = h('p', { class: 'promo-intro__title' },
    h('b', {}, h('span', { class: 'accent' }, 'A&I'), '는'), '\n',
    '개발을 좋아하는\n사람들이 모여\n지식을 공유하고\n함께 성장합니다.',
  );
  return h('section', { class: 'promo-intro' },
    h('div', { class: 'promo-intro__inner' },
      h('div', { class: 'promo-intro__row' },
        h('div', { class: 'promo-intro__text' },
          h('div', { class: 'reveal' }, title),
          h('div', { class: 'promo-intro__underline reveal' }),
        ),
        h('div', { class: 'promo-intro__graph' }, growthGraph()),
      ),
      h('p', { class: 'promo-intro__desc reveal', style: 'transition-delay: 200ms' },
        '문법부터 협업, 실제 프로젝트까지 함께하며\n국내 유명 부트캠프 합격생도 배출해내는 업적을\n이뤄냈습니다.'),
    ),
  );
}

/** PromotionCurriculum 로드맵에 현재 진행 단계를 표시한다. */
const JOURNEY = [
  { icon: 'terminal', tag: 'Foundation', title: '프로그래밍 기초', items: ['프로그래밍 핵심 문법', '기초 설계 및 구현'], state: 'done' },
  { icon: 'storage', tag: 'CS Deep Dive', title: '심화 컴퓨터 공학', items: ['개발자 필수 CS 지식', '아키텍처/디자인 패턴'], state: 'done' },
  { icon: 'layers', tag: 'Framework', title: '프레임워크', items: ['Flutter / Spring Boot', 'AI 주도 개발 활용 능력'], state: 'done' },
  { icon: 'groups', tag: 'Team Project', title: '팀 프로젝트', items: ['애자일 방식의 프로젝트', '멘토주도 코드 리뷰'], state: 'now' },
];

function renderRoadmapItem(step, index) {
  const isLeft = index % 2 === 0;
  const content = h('div', { class: 'roadmap__side roadmap__side--content' },
    h('div', { class: 'roadmap__icon' }, icon(step.icon)),
    h('div', { class: 'roadmap__tag' },
      h('span', {}, step.tag.toUpperCase()),
      h('span', { class: 'roadmap__state' }, step.state === 'now' ? 'NOW' : 'DONE'),
    ),
    h('p', { class: 'roadmap__title' }, step.title),
    h('ul', { class: 'roadmap__items' }, step.items.map((item) => h('li', {}, item))),
  );
  const spacer = h('div', { class: 'roadmap__side' });
  return h('div', { class: `roadmap__item roadmap__item--${isLeft ? 'left' : 'right'} is-${step.state} reveal reveal--slow` },
    isLeft ? content : spacer,
    h('div', { class: 'roadmap__gap' }),
    h('span', { class: 'roadmap__node' }),
    h('div', { class: 'roadmap__gap' }),
    isLeft ? spacer : content,
  );
}

function renderPromoJourney() {
  return h('section', { class: 'promo-section' },
    h('div', { class: 'glow glow--tr', 'aria-hidden': 'true' }),
    h('div', { class: 'promo-section__inner' },
      ...sectionHeader('지금 A&I는', '4기 멤버들이 팀 프로젝트로 함께 성장하고 있어요.'),
      h('div', { class: 'roadmap' },
        h('div', { class: 'roadmap__line', 'aria-hidden': 'true' }),
        JOURNEY.map(renderRoadmapItem),
      ),
    ),
  );
}

function renderPromoCard(post) {
  const thumb = h('div', { class: 'promo-card__thumb' });
  const fallback = h('div', { class: 'thumb__fallback' }, icon('article'));
  if (post.thumbnailUrl) {
    const img = h('img', { src: post.thumbnailUrl, alt: '', loading: 'lazy', decoding: 'async' });
    img.addEventListener('error', () => img.replaceWith(fallback));
    thumb.append(img);
  } else {
    thumb.append(fallback);
  }
  return link(`/articles/${encodeURIComponent(post.id)}`, { class: 'promo-card reveal' },
    thumb,
    h('div', { class: 'promo-card__body' },
      h('span', { class: 'promo-card__chip' }, post.dateLabel),
      h('h3', { class: 'promo-card__title' }, post.title),
      h('p', { class: 'promo-card__meta' }, post.authorNickname, h('span', {}, ' 작성')),
    ),
  );
}

async function renderPromoPosts(bridge, slot, signal) {
  try {
    const { items } = await unwrap(bridge.blog.latest());
    if (signal.aborted || items.length === 0) return;
    const section = h('section', { class: 'promo-section' },
      h('div', { class: 'promo-section__inner' },
        ...sectionHeader('동아리 소식', '멤버들이 배우고 만든 이야기를 블로그에서 만나보세요.'),
        h('div', { class: 'promo-posts' }, items.map(renderPromoCard)),
        link('/articles', { class: 'promo-link' }, '블로그 전체 보기', icon('arrowForwardIos')),
      ),
    );
    slot.replaceWith(section);
    observeReveal(section, signal);
  } catch {
    // 블로그를 불러오지 못하면 섹션을 숨긴다.
  }
}

function renderPromoSchedule(status) {
  const items = [
    { icon: 'school', label: '4기 정규 교육과정', content: '기초 · CS · 프레임워크 과정 완료' },
    { icon: 'groups', label: '팀 프로젝트', content: '4기 멤버들이 프로젝트 진행 중' },
    { icon: 'notifications', label: `${status.nextSeasonYear} 신규 동아리원 모집`, content: '모집 일정은 추후 공지됩니다.' },
  ];
  return h('section', { class: 'promo-section' },
    h('div', { class: 'glow glow--tl', 'aria-hidden': 'true' }),
    h('div', { class: 'glow glow--br', 'aria-hidden': 'true' }),
    h('div', { class: 'promo-section__inner' },
      ...sectionHeader('다음 시즌 안내', `${status.nextSeasonYear}년, 새로운 기수와 함께 다시 만나요!`),
      h('div', { class: 'schedule reveal reveal--slow' },
        h('div', { class: 'schedule__line', 'aria-hidden': 'true' }),
        items.map((item) => h('div', { class: 'schedule__item' },
          h('div', { class: 'schedule__icon' }, icon(item.icon)),
          h('div', { class: 'schedule__body' },
            h('p', { class: 'schedule__label' }, item.label),
            h('p', { class: 'schedule__content' }, item.content),
          ),
        )),
      ),
      link('/articles', { class: 'promo-link' }, '블로그 둘러보기', icon('arrowForwardIos')),
    ),
  );
}

function renderHome(bridge, status, signal) {
  const postsSlot = h('div');
  const page = h('div', { class: 'promo' },
    renderPromoHero(status),
    renderPromoIntro(),
    renderPromoJourney(),
    postsSlot,
    renderPromoSchedule(status),
    h('p', { class: 'promo-copy' }, '© 2026 A&I. All rights reserved.'),
  );
  viewEl.replaceChildren(page);
  observeReveal(page, signal);
  renderPromoPosts(bridge, postsSlot, signal);

  const onScroll = () => headerEl.classList.toggle('is-scrolled', window.scrollY > 10);
  onScroll();
  window.addEventListener('scroll', onScroll, { passive: true });
  signal.addEventListener('abort', () => {
    window.removeEventListener('scroll', onScroll);
    headerEl.classList.remove('is-scrolled');
  });
}

/* ───────── 게시글 목록 ───────── */

function renderArticleCard(post) {
  return link(`/articles/${encodeURIComponent(post.id)}`, { class: 'article-card' },
    thumbnail(post.thumbnailUrl),
    h('div', { class: 'article-card__content' },
      h('div', { class: 'article-card__tags' },
        h('span', { class: 'status-chip' }, post.status),
        h('span', { class: 'article-card__bullet' }, '•'),
        h('span', { class: 'article-card__date' }, post.dateLabel),
      ),
      h('h2', { class: 'article-card__title' }, post.title),
      h('p', { class: 'article-card__summary' }, post.summary),
      h('div', { class: 'article-card__author' }, avatar(post.authorProfileImage), h('span', {}, post.authorNickname)),
    ),
  );
}

function renderBlogList(bridge, signal) {
  const items = h('div', { class: 'article-list__items' });
  viewEl.replaceChildren(
    h('section', { class: 'article-list' },
      h('h1', { class: 'article-list__title' }, '게시글'),
      h('p', { class: 'article-list__subtitle' }, 'A&I 커뮤니티의 최신 기술 동향을 확인하세요.'),
      items,
    ),
  );

  const state = { page: 0, hasMore: false, loading: false, footer: null };

  const setFooter = (node) => {
    state.footer?.remove();
    state.footer = node;
    if (node) items.append(node);
  };

  const loadFirst = async () => {
    state.footer = null;
    items.replaceChildren(h('div', { class: 'list-loading' }, progress()));
    try {
      const result = await unwrap(bridge.blog.list(0, 20));
      if (signal.aborted) return;
      items.replaceChildren();
      if (result.items.length === 0) {
        items.append(feedback('등록된 게시글이 없습니다.'));
        return;
      }
      items.append(...result.items.map(renderArticleCard));
      state.page = result.page;
      state.hasMore = result.hasNext;
      setFooter(state.hasMore ? h('div', { class: 'list-spacer' }) : null);
    } catch {
      if (signal.aborted) return;
      items.replaceChildren(feedback('게시글 목록을 불러오지 못했습니다.', { actionLabel: '다시 시도', onAction: loadFirst }));
    }
  };

  // 기존 화면과 동일하게 스크롤 끝 480px 이내에서 다음 페이지를 불러온다.
  const loadMore = async () => {
    if (state.loading || !state.hasMore) return;
    state.loading = true;
    setFooter(h('div', { class: 'list-loading list-loading--more' }, progress()));
    try {
      const result = await unwrap(bridge.blog.list(state.page + 1, 20));
      if (signal.aborted) return;
      state.footer.before(...result.items.map(renderArticleCard));
      state.page = result.page;
      state.hasMore = result.hasNext;
      setFooter(state.hasMore ? h('div', { class: 'list-spacer' }) : null);
    } catch {
      if (signal.aborted) return;
      setFooter(feedback('게시글을 더 불러오지 못했습니다.', { actionLabel: '더 불러오기 다시 시도', onAction: loadMore, modifier: 'feedback--more' }));
    } finally {
      state.loading = false;
    }
  };

  const onScroll = () => {
    const remaining = document.documentElement.scrollHeight - (window.scrollY + window.innerHeight);
    if (remaining <= 480) loadMore();
  };
  window.addEventListener('scroll', onScroll, { passive: true });
  signal.addEventListener('abort', () => window.removeEventListener('scroll', onScroll));

  loadFirst();
}

/* ───────── 게시글 상세 ───────── */

async function renderBlogDetail(bridge, id, signal) {
  const container = h('article', { class: 'article-detail' }, h('div', { class: 'list-loading feedback--detail' }, progress()));
  viewEl.replaceChildren(container);

  try {
    const post = await unwrap(bridge.blog.detail(id));
    if (signal.aborted) return;
    document.title = `${post.title} | A&I`;

    const content = h('div', { class: 'markdown' });
    if (window.DOMPurify) {
      content.innerHTML = window.DOMPurify.sanitize(post.contentHtml, { USE_PROFILES: { html: true } });
    } else {
      content.textContent = '본문을 표시할 수 없어요. 새로고침해 주세요.';
    }
    // 기존 화면은 링크를 새 창(_blank)으로 연다.
    content.querySelectorAll('a[href]').forEach((a) => {
      a.target = '_blank';
      a.rel = 'noopener noreferrer';
    });
    content.querySelectorAll('img').forEach((img) => { img.loading = 'lazy'; });

    container.replaceChildren(
      h('nav', { class: 'breadcrumb', 'aria-label': '위치' },
        link('/', {}, 'Home'), icon('chevronRight'),
        link('/articles', {}, 'Articles'), icon('chevronRight'),
        h('span', { class: 'breadcrumb__current' }, post.id),
      ),
      h('h1', { class: 'article-detail__title' }, post.title),
      h('div', { class: 'article-detail__author' },
        avatar(post.authorProfileImage),
        h('div', { class: 'article-detail__byline' },
          h('p', { class: 'article-detail__nickname' }, post.authorNickname),
          h('p', { class: 'article-detail__date' }, post.dateLabel),
        ),
        h('span', { class: 'status-pill' }, post.statusLabel),
      ),
      post.thumbnailUrl ? h('div', { class: 'article-detail__cover' }, h('img', { src: post.thumbnailUrl, alt: '' })) : null,
      content,
      h('div', { class: 'article-detail__back' }, link('/articles', {}, icon('arrowBack'), '목록으로 돌아가기')),
    );
  } catch {
    if (signal.aborted) return;
    container.replaceChildren(
      feedback('게시글을 불러오지 못했습니다.', {
        actionLabel: '다시 시도',
        onAction: () => renderBlogDetail(bridge, id, signal),
        modifier: 'feedback--detail',
      }),
    );
  }
}

/* ───────── Router ───────── */

let controller = null;

function route(bridge) {
  const resolved = bridge.site.resolve(location.pathname);
  if (resolved.redirectTo) {
    history.replaceState(null, '', resolved.redirectTo);
    return route(bridge);
  }

  controller?.abort();
  controller = new AbortController();
  const { signal } = controller;

  setMenuOpen(false);
  document.title = resolved.title;
  document.body.dataset.view = resolved.view;
  window.scrollTo(0, 0);

  switch (resolved.view) {
    case 'home':
      renderHome(bridge, bridge.site.status(), signal);
      break;
    case 'blogList':
      renderBlogList(bridge, signal);
      break;
    case 'blogDetail':
      renderBlogDetail(bridge, resolved.params.id, signal);
      break;
  }
}

async function start() {
  menuButton.append(icon('menu'));
  let bridge;
  try {
    bridge = await loadBridge();
  } catch {
    viewEl.replaceChildren(feedback('페이지를 불러오지 못했습니다.', { actionLabel: '다시 시도', onAction: () => location.reload() }));
    return;
  }

  renderTopBar(bridge.site.status().menus);

  document.addEventListener('click', (event) => {
    if (!event.target.closest('[data-menu-root]')) setMenuOpen(false);
    const anchor = event.target.closest('a[data-link]');
    if (!anchor || event.metaKey || event.ctrlKey || event.shiftKey || event.button !== 0) return;
    event.preventDefault();
    if (anchor.getAttribute('href') !== location.pathname) {
      history.pushState(null, '', anchor.getAttribute('href'));
    }
    route(bridge);
  });
  menuButton.addEventListener('click', () => setMenuOpen(menuEl.hidden));
  document.addEventListener('keydown', (event) => {
    if (event.key === 'Escape') setMenuOpen(false);
  });
  window.addEventListener('popstate', () => route(bridge));

  route(bridge);
}

start();
