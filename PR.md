# [CI] 테스트 호스팅 자동 배포 워크플로우 추가

## 📌 개요
`main` 브랜치에 코드가 업데이트될 때마다 자동으로 **테스트용 Firebase Hosting 사이트**(`sub` 타겟)로 배포되도록 CI/CD 파이프라인을 구축했습니다. 이를 통해 개발 변경 사항을 테스트 환경에서 즉시 확인할 수 있습니다.

## 🛠 주요 변경 사항
- **`.github/workflows/deploy-test.yml` 추가**
  - **Trigger**: `main` 브랜치에 `push` 이벤트 발생 시 실행.
  - **Build**: Flutter Web 릴리즈 빌드 (`dart-define`으로 `API_URL` 주입).
  - **Deploy**: Firebase Hosting의 `sub` 타겟(테스트 도메인)으로 배포.
  - **Target**: 기존 프로덕션 배포(`firebase-hosting-merge.yml`)와 분리하여 테스트 전용 타겟으로 설정.

## ⚙️ 설정 필요 사항 (GitHub Secrets)
이 워크플로우가 정상 작동하려면 리포지토리 설정(`Settings > Secrets and variables > Actions`)에 다음 값이 등록되어 있어야 합니다.

| Secret 이름 | 설명 |
| :--- | :--- |
| `FIREBASE_SERVICE_ACCOUNT_AANDI_REPORT_WEB` | Firebase 서비스 계정 키 (JSON 전체 내용) |
| `BASE_URL` | 테스트 환경에서 사용할 API 서버 URL |

## 🚀 동작 방식
1. 개발자가 `main` 브랜치에 코드를 푸시합니다.
2. GitHub Actions가 `Deploy to Test Channel (Main Branch)` 워크플로우를 시작합니다.
3. 빌드 성공 시, `.firebaserc`에 정의된 `sub` 타겟(`aandi-report-web-test`)으로 배포됩니다.
4. 프로덕션 배포는 기존대로 `v*` 태그 푸시 시에만 수행됩니다.
