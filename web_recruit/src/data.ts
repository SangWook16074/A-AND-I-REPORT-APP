export const RECRUIT = {
  forms: 'https://forms.gle/QHuzcBn3yzm59jGX9',
  kakao: 'https://open.kakao.com/o/s6u9iDxi',
  generation: '4기',
  role: 'UX/UI 디자이너',
  university: '인덕대학교',
  club: 'A&I',
  shippedAppCount: 8,
  recruitStart: '2026.10.09',
  recruitEnd: '2026.10.30',
  activityStart: '2026.11.01',
  activityEnd: '2027.01.10',
};

/** 페이지 경로 — dev 서버는 web_recruit 루트, 배포는 /recruit-designer/ 아래에서 서빙된다. */
export const PAGES = import.meta.env.DEV
  ? { main: '/', team: '/team/' }
  : { main: '/recruit-designer', team: '/recruit-designer/team/' };

/** "YYYY.MM.DD" → Date (현지 시각 기준). 잘못된 입력은 NaN Date 반환. */
function parseDot(s: string, endOfDay = false): Date {
  const [y, m, d] = s.split('.').map((v) => Number(v));
  return endOfDay
    ? new Date(y, (m ?? 1) - 1, d ?? 1, 23, 59, 59, 999)
    : new Date(y, (m ?? 1) - 1, d ?? 1, 0, 0, 0, 0);
}

/** 모집 종료 시각 (현지 시각 자정 직전) — 카운트다운 타깃. */
export const RECRUIT_END_AT: Date = parseDot(RECRUIT.recruitEnd, true);
/** 모집 시작 시각 — 모집 전/중/후 분기용. */
export const RECRUIT_START_AT: Date = parseDot(RECRUIT.recruitStart, false);

/** 팀 소개 페이지(모아모아) 콘텐츠 — sections/team.ts에서 사용. */
export const TEAM = {
  name: '모아모아',
  intro:
    'A&I 4기 수료생들이 현업 개발자 멘토들과 함께 모임 서비스 모아모아를 만들어 나가고 있어요.',
  features: [
    {
      key: 'schedule',
      label: '일정 조율',
      title: '가장 많이 모일 수 있는 시간을 자동으로 추천해요',
      desc: '관리자가 후보 날짜와 시간을 올리면 멤버들이 가능한 시간에 투표하고, 모아모아가 최적의 시간대를 골라줘요.',
    },
    {
      key: 'attendance',
      label: '출석',
      title: '출석 인증과 관리를 한 번에',
      desc: '멤버는 간편하게 출석을 인증하고, 관리자는 출석 현황을 한눈에 확인해요.',
    },
    {
      key: 'fee',
      label: '회비 · 정산',
      title: '납부 현황과 정산 내역을 투명하게',
      desc: '회비 납부 여부와 정산 내역을 모두가 같은 화면에서 확인해요.',
    },
    {
      key: 'notice',
      label: '공지',
      title: '공지는 공지대로, 따로 모아서',
      desc: '중요한 공지가 대화에 묻히지 않도록 별도로 모아 보여줘요.',
    },
  ],
  tech: 'OCR · 위치 기반 인증 같은 기술로 실제 운영 과정의 번거로움을 줄여요.',
  closing: '우리 서비스를 빛내줄 UX/UI 디자이너님을 모시고 있습니다.',
  /** 팀 구성 */
  members: ['현업 개발자를 포함한 멘토 3명', '개발팀원 6명 (A&I 4기 수료생)', '그리고 UX/UI 디자이너'],
  /** 합류 후 맡게 될 일 */
  duties: [
    '모아모아의 첫 화면부터 UX/UI를 처음부터 설계해요.',
    '일정 투표, 출석 인증, 회비 정산 등 핵심 기능의 사용자 흐름을 정의해요.',
    '아이콘, 이미지 등 서비스에 필요한 시각 요소를 만들어요.',
    '개발팀과 함께 리뷰하며 디자인이 실제 앱으로 구현되도록 협업해요.',
    '스토어 출시에 필요한 디자인까지 함께 준비해요.',
  ],
  /** 우대 사항 */
  preferred: [
    'Figma로 앱 화면을 설계해 본 경험이 있는 분',
    '동아리·스터디 등 모임을 직접 운영해 본 분',
    '개발자와 협업하며 디자인을 구현해 본 경험이 있는 분',
  ],
};

/** 멘토 이미지 경로 — public/mentors/ (dev는 루트, 배포는 /recruit-designer/ 아래). */
const MENTOR_IMG_BASE = import.meta.env.DEV ? '/mentors' : '/recruit-designer/mentors';

/** 멘토 및 운영진 — Flutter `PromotionMentors`(promotion_mentors.dart)의 멘토 A · C · E. */
export const MENTORS: { image: string; name: string; role: string; achievements: string[] }[] = [
  { image: `${MENTOR_IMG_BASE}/mentor_a.webp`, name: '한상욱', role: 'Mobile', achievements: ['1년차 모바일 엔지니어', '부스트캠프 Web/Mobile 9기 수료', 'Flutter Seoul 바이브코딩 해커톤 3위'] },
  { image: `${MENTOR_IMG_BASE}/mentor_c.webp`, name: '허동현', role: 'Backend', achievements: ['우아한 테크코스 수료', 'A&I 2기 백엔드과정'] },
  { image: `${MENTOR_IMG_BASE}/mentor_e.webp`, name: '구승민', role: 'AI', achievements: ['부스트캠프 AI Tech 8기 수료', '교육 과정 프로젝트 1위', 'A&I 3기 백엔드과정'] },
];

export const WHO_WE_WANT: { num: string; title: string; hint: string }[] = [
  {
    num: '01',
    title: '합류 후 바로 팀과 함께 달릴 수 있는 분',
    hint: '진행 중인 프로젝트 일정에 맞춰 꾸준히 참여하실 수 있어요.',
  },
  {
    num: '02',
    title: '실제 출시되는 앱을 포트폴리오에 담고 싶은 분',
    hint: '실제 앱 출시까지 함께하며 결과물을 만들어요.',
  },
  {
    num: '03',
    title: 'Figma 같은 디자인 툴을 깊게 다뤄보고 싶은 분',
    hint: '인터랙션·모션까지 만들어내는 디자이너로 성장합니다.',
  },
  {
    num: '04',
    title: 'UX/UI 분야에 진심인 분',
    hint: '리서치, 정보 구조, 사용성 — 모든 단계가 흥미로워요.',
  },
  {
    num: '05',
    title: '함께 즐겁게 활동할 동아리 분위기를 좋아하는 분',
    hint: '서로의 작업을 응원하고 피드백하는 문화를 만듭니다.',
  },
];

export const PROCESS_STEPS = [
  {
    num: '01',
    title: '지원서 작성',
    desc: '구글 폼으로 지원해 주세요. 멘토진이 한 분 한 분의 지원서를 꼼꼼히 읽어요.',
  },
  {
    num: '02',
    title: '대면 인터뷰',
    desc: '편안한 분위기에서 디자인 이야기와 활동 기대를 함께 나눠요.',
  },
  {
    num: '03',
    title: '최종 합격 안내',
    desc: '문자 메시지로 결과를 안내드리고, 바로 프로젝트에 합류해요.',
  },
];

export const FAQS = [
  {
    q: '이미 진행 중인 프로젝트에 합류해도 괜찮을까요?',
    a: '물론이에요. 기획과 개발이 진행 중이라 바로 실제 화면 작업에 참여할 수 있고, 합류 초기에 지금까지의 진행 상황을 함께 공유해 드려요.',
  },
  {
    q: '활동 시간과 장소는 어떻게 되나요?',
    a: '모아모아 프로젝트 일정에 맞춰 함께 조율합니다. 오프라인은 서울 노원구를 기본으로 해요.',
  },
  {
    q: '모집 인원은 몇 명인가요?',
    a: '소수 정예로 운영합니다. 함께 호흡 맞춰 깊이 협업하는 것을 중요하게 생각해요.',
  },
  {
    q: '디자인 경험이 많지 않아도 지원할 수 있나요?',
    a: 'UX/UI에 대한 관심과 열정이 있다면 환영해요. 실제 프로젝트에서 실력을 함께 키워갑니다.',
  },
  {
    q: '활동 내용에 어떤 게 포함되나요?',
    a: '모아모아 앱의 UI 디자인, 디자인 시스템 정리, 미디어·이미지·아이콘 제작, 개발팀 협업, 출시 준비까지 함께해요.',
  },
  {
    q: '어떤 툴을 주로 사용하나요?',
    a: 'Figma를 메인 디자인 툴로 사용합니다.',
  },
];
