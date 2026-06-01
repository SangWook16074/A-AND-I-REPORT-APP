import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';

gsap.registerPlugin(ScrollTrigger);

const SCRUB = 0.7;

/**
 * 스크롤 위치에 묶인 reversible 애니메이션 세트.
 * - 스크롤 다운 → 트윈 진행
 * - 스크롤 업   → 트윈 되감기
 * `prefers-reduced-motion` 사용자는 즉시 최종 상태로 노출한다.
 */
export function setupScrollAnimations(): void {
  const reduced = matchMedia('(prefers-reduced-motion: reduce)').matches;

  if (reduced) {
    document
      .querySelectorAll('.reveal, .reveal-stagger')
      .forEach((el) => el.classList.add('is-in'));
    document
      .querySelectorAll<HTMLElement>('.about__big .h-inner, .hero__title-word')
      .forEach((el) => (el.style.transform = 'translateY(0)'));
    return;
  }

  // 1) 기본 reveal — 페이드 + 슬라이드
  gsap.utils.toArray<HTMLElement>('.reveal').forEach((el) => {
    gsap.fromTo(
      el,
      { autoAlpha: 0, y: 40 },
      {
        autoAlpha: 1,
        y: 0,
        ease: 'power2.out',
        scrollTrigger: {
          trigger: el,
          start: 'top 88%',
          end: 'top 55%',
          scrub: SCRUB,
        },
      }
    );
  });

  // 2) Stagger 컨테이너 — 자식 요소들이 차례대로
  gsap.utils.toArray<HTMLElement>('.reveal-stagger').forEach((wrap) => {
    const items = Array.from(wrap.children) as HTMLElement[];
    if (items.length === 0) return;

    gsap.fromTo(
      items,
      { autoAlpha: 0, y: 28 },
      {
        autoAlpha: 1,
        y: 0,
        stagger: 0.06,
        ease: 'power2.out',
        scrollTrigger: {
          trigger: wrap,
          start: 'top 90%',
          end: 'top 40%',
          scrub: SCRUB,
        },
      }
    );
  });

  // 3) About 큰 헤드라인 — 단어별 슬라이드 업
  const aboutInners = gsap.utils.toArray<HTMLElement>('.about__big .h-inner');
  if (aboutInners.length) {
    gsap.fromTo(
      aboutInners,
      { yPercent: 110 },
      {
        yPercent: 0,
        stagger: 0.1,
        ease: 'power3.out',
        scrollTrigger: {
          trigger: '.about__big',
          start: 'top 95%',
          end: 'top 35%',
          scrub: SCRUB,
        },
      }
    );
  }

  // 4) Who-Card — 5장 카드 스크롤 진행에 맞춰 차례로
  const whoCards = gsap.utils.toArray<HTMLElement>('.who-card');
  if (whoCards.length) {
    gsap.fromTo(
      whoCards,
      { autoAlpha: 0, y: 60 },
      {
        autoAlpha: 1,
        y: 0,
        stagger: 0.08,
        ease: 'power2.out',
        scrollTrigger: {
          trigger: '.who__grid',
          start: 'top 92%',
          end: 'top 35%',
          scrub: SCRUB,
        },
      }
    );
  }

  // 5) Bento cell — 살짝 스케일 + 슬라이드
  gsap.utils.toArray<HTMLElement>('.bento__cell').forEach((cell) => {
    gsap.fromTo(
      cell,
      { autoAlpha: 0, y: 40, scale: 0.96 },
      {
        autoAlpha: 1,
        y: 0,
        scale: 1,
        ease: 'power2.out',
        scrollTrigger: {
          trigger: cell,
          start: 'top 92%',
          end: 'top 60%',
          scrub: SCRUB,
        },
      }
    );
  });

  // 6) Step Card — 선발 절차
  gsap.utils.toArray<HTMLElement>('.step-card').forEach((card) => {
    gsap.fromTo(
      card,
      { autoAlpha: 0, y: 50, scale: 0.94 },
      {
        autoAlpha: 1,
        y: 0,
        scale: 1,
        ease: 'power2.out',
        scrollTrigger: {
          trigger: card,
          start: 'top 92%',
          end: 'top 55%',
          scrub: SCRUB,
        },
      }
    );
  });

  // 7) FAQ item — 부드럽게 줄지어 등장
  gsap.utils.toArray<HTMLElement>('.faq-item').forEach((item) => {
    gsap.fromTo(
      item,
      { autoAlpha: 0, y: 24 },
      {
        autoAlpha: 1,
        y: 0,
        ease: 'power2.out',
        scrollTrigger: {
          trigger: item,
          start: 'top 92%',
          end: 'top 70%',
          scrub: SCRUB,
        },
      }
    );
  });

  // 8) 타임라인 progress bar — 섹션을 지나는 속도와 동기화
  const timeline = document.getElementById('timeline');
  const progress = document.getElementById('timeline-progress');
  if (timeline && progress) {
    gsap.fromTo(
      progress,
      { height: '0%' },
      {
        height: '100%',
        ease: 'none',
        scrollTrigger: {
          trigger: timeline,
          start: 'top 65%',
          end: 'bottom 75%',
          scrub: 0.3,
        },
      }
    );

    // 타임라인 노드 활성/비활성 (되감기 시 자동 해제)
    gsap.utils.toArray<HTMLElement>('.timeline__node').forEach((node) => {
      ScrollTrigger.create({
        trigger: node,
        start: 'top 60%',
        end: 'bottom 30%',
        toggleClass: { targets: node, className: 'is-active' },
      });
    });
  }

  // 9) Hero 스크롤 인디케이터 — 스크롤 시작과 함께 자연스럽게 사라짐
  const heroScroll = document.querySelector<HTMLElement>('.hero__scroll');
  if (heroScroll) {
    gsap.to(heroScroll, {
      autoAlpha: 0,
      y: 20,
      ease: 'none',
      scrollTrigger: {
        trigger: '.hero',
        start: 'top top',
        end: '35% top',
        scrub: true,
      },
    });
  }

  // 10) Hero 메시(blur blob) 파라랙스 — 깊이감 추가
  gsap.to('.hero__mesh', {
    yPercent: -15,
    ease: 'none',
    scrollTrigger: {
      trigger: '.hero',
      start: 'top top',
      end: 'bottom top',
      scrub: true,
    },
  });

  // Stat counter — 뷰 진입 시 0 → target 카운트업, 되돌아가면 다시 0
  document.querySelectorAll<HTMLElement>('[data-counter]').forEach((el) => {
    const target = Number(el.dataset.target ?? '0');
    if (!Number.isFinite(target) || target <= 0) return;
    const obj = { val: 0 };
    gsap.to(obj, {
      val: target,
      ease: 'power2.out',
      snap: { val: 1 },
      scrollTrigger: {
        trigger: el,
        start: 'top 90%',
        end: 'top 55%',
        scrub: 0.8,
        onUpdate: () => {
          el.textContent = String(Math.round(obj.val));
        },
      },
    });
  });

  // (제거됨) 섹션 타이틀 parallax — .reveal과 동일 transform 충돌.
  // (제거됨) cta-footer__title 전용 트윈 — .reveal로 통일.
  // (제거됨) keyword char stagger — 부모 핀 타임라인과 어긋남.

  ScrollTrigger.refresh();
}

/** ScrollTrigger 인스턴스를 외부에서 접근할 때 사용 (smooth scroll 연동 등) */
export { ScrollTrigger };
