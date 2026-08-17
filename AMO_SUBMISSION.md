# AMO 제출 정보

## 표시 정보

- 이름: 치지직 통나무 파워 도우미
- 요약: 치지직 통나무 파워 자동 수령과 보유량·획득 로그 표시를 돕습니다.
- 라이선스: GNU General Public License v3.0 only
- 지원 사이트: https://github.com/PCBiS/chzzk-log-power-helper
- 개인정보처리방침: https://github.com/PCBiS/chzzk-log-power-helper/blob/main/PRIVACY.md

## 업로드 파일

- 부가 기능 파일: GitHub Releases의 `AMO-UPLOAD-chzzk-log-power-helper-1.3.2.zip`
- GitHub의 자동 생성 `Source code (zip)` 또는 `*-source.zip`을 부가 기능 파일 칸에 업로드하지 마세요.
- 올바른 배포 ZIP은 루트에 `manifest.json`이 있습니다. 상위 폴더를 포함하지 않습니다.
- AMO가 별도의 소스 코드 제출을 요구할 때만 소스 ZIP을 소스 코드 칸에 제출합니다.

## 상세 설명

치지직 라이브 방송에서 화면의 통나무 파워 받기 버튼을 감지해 자동으로 누르고, 보유 통나무 파워와 채널별 순위 및 획득·승부예측 로그를 표시합니다.

이 확장은 치지직, 네이버 또는 Mozilla의 공식 제품이 아닙니다. choco-lily/chzzk_auto_log_power의 GPL-3.0 기반 파생 프로젝트이며, 변경된 치지직 DOM 탐색, Firefox 비동기 API 호환, Android 호환 선언과 개인정보 공개를 추가했습니다.

## 심사자 메모

1. 테스트하려면 치지직에 로그인하고 `https://chzzk.naver.com/live/{channelId}` 형식의 라이브 채널을 엽니다.
2. 채팅 입력 영역 옆에 통나무 보유량 버튼과 선택한 경우 시계가 표시됩니다.
3. 1시간 시청 보상은 치지직 화면의 실제 `받기` 버튼이 나타날 때 자동 클릭합니다. 심사 시간 중 버튼이 나타나지 않으면 DOM 탐색 코드는 `content.js`의 `clickPowerButtonIfExists`에서 확인할 수 있습니다.
4. 확장은 `api.chzzk.naver.com`의 통나무 잔액, 보상 청구, 구독 및 승부예측 API와 통신합니다. 요청에는 사용자의 기존 치지직 로그인 세션이 브라우저에 의해 포함될 수 있습니다.
5. 개발자 서버, 원격 코드, 광고, 분석 또는 추적 기능은 없습니다. 설정과 로그는 WebExtension storage에만 저장합니다.
6. 배포 파일은 난독화·최소화·번들링하지 않은 HTML/JavaScript 원본입니다. 빌드는 파일을 ZIP으로 묶는 과정뿐이며 공개 소스는 위 GitHub 저장소에 있습니다.
7. 원본 프로젝트: https://github.com/choco-lily/chzzk_auto_log_power
