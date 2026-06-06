export const RECRUIT = {
  forms: 'https://forms.gle/QHuzcBn3yzm59jGX9',
  kakao: 'https://open.kakao.com/o/s6u9iDxi',
  generation: '4기',
  role: 'UX/UI 디자이너',
  university: '인덕대학교',
  club: 'A&I',
  shippedAppCount: 8,
  recruitStart: '2026.06.01',
  recruitEnd: '2026.08.30',
  activityStart: '2026.07.01',
  activityEnd: '2027.01.10',
};

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

export const WHO_WE_WANT: { num: string; title: string; hint: string }[] = [
  {
    num: '01',
    title: '프로젝트 기간 중 충분한 시간을 함께 쓸 수 있는 분',
    hint: '활동 기간 동안 팀 일정에 맞춰 꾸준히 참여하실 수 있어요.',
  },
  {
    num: '02',
    title: 'UX/UI 포트폴리오를 진짜 출시 프로젝트로 채우고 싶은 분',
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
    desc: '문자 메시지로 결과를 안내드리고, 4기 활동에 함께해요.',
  },
];

export const FAQS = [
  {
    q: '활동 시간과 장소는 어떻게 되나요?',
    a: '팀별 일정에 따라 자율적으로 조율합니다. 오프라인은 서울 노원구를 기본으로 하되, 팀 위치에 따라 조정될 수 있어요.',
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
    a: 'UI 디자인, 미디어·이미지·아이콘 제작, 개발팀 협업, 출시 준비까지 앱 출시의 전 과정을 함께해요.',
  },
  {
    q: '어떤 툴을 주로 사용하나요?',
    a: 'Figma를 메인 디자인 툴로 사용합니다.',
  },
];
