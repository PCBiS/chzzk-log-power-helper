# 치지직 통나무 파워 자동 획득 — Firefox 포트

치지직 라이브 방송에서 통나무(파워)를 자동으로 획득하고, 보유 파워와 채널별 랭킹을 표시하는 Firefox용 WebExtension입니다.

지원 버전은 Firefox 데스크톱/Android 142 이상입니다.

이 저장소는 [choco-lily/chzzk_auto_log_power](https://github.com/choco-lily/chzzk_auto_log_power)의 최신 Chrome 코드를 Firefox Manifest V2에 맞게 포팅한 파생 프로젝트입니다. 치지직 또는 네이버의 공식 확장 프로그램이 아닙니다.

## 포팅 내용

- 변경된 치지직 CSS 클래스와 버튼 텍스트(`통나무`, `파워`, `1시간` + `받기`)를 함께 사용해 획득 버튼을 탐색합니다.
- `WATCH_1_HOUR` 보상은 API로 직접 요청하지 않고 화면의 실제 받기 버튼을 클릭합니다.
- 최신 Chrome판의 파워 표시, 시계, 움직이는 GIF 프로필, 파워 요약, 예측 로그 기능을 포함합니다.
- Firefox Manifest V2의 콜백 기반 `chrome.*` API에서 최신 코드의 `await` 저장소 호출이 동작하도록 Promise 래퍼를 사용합니다.
- Firefox 전용 `browser_specific_settings.gecko` 확장 ID와 API 호스트 권한을 선언합니다.

## 임시 설치

1. [Releases](../../releases)에서 ZIP을 받거나 `npm run package`로 패키지를 만듭니다.
2. Firefox에서 `about:debugging#/runtime/this-firefox`를 엽니다.
3. **임시 부가 기능 로드**를 누릅니다.
4. 압축을 푼 폴더의 `manifest.json`을 선택합니다.

임시 부가 기능은 Firefox를 재시작하면 제거됩니다. 일반 Firefox에 영구 설치하려면 Mozilla 서명이 된 XPI가 필요합니다.

## 개발 및 검증

Node.js가 설치된 환경에서 다음을 실행합니다.

```sh
npm run check
npm run package
```

실제 획득 동작은 치지직에 로그인한 Firefox에서 라이브 방송을 1시간 이상 시청한 뒤, 개발자 도구 콘솔과 파워 로그를 함께 확인해야 합니다.

## 라이선스 및 저작자 표시

원본 저작권은 chocolily에게 있으며, 이 파생 프로젝트도 원본과 동일하게 GNU GPL v3.0을 따릅니다.

- 원본 저장소: https://github.com/choco-lily/chzzk_auto_log_power
- 원본 Chrome Web Store: https://chromewebstore.google.com/detail/mdammcmmopljkpnokoodkahdhnpijhib
- 라이선스: [GPL-3.0](LICENSE)
