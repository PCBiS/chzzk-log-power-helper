# 치지직 통나무 파워 도우미

치지직 라이브 방송에서 통나무(파워)를 자동으로 획득하고, 보유 파워와 채널별 랭킹을 표시하는 Firefox용 WebExtension입니다.

지원 버전은 Firefox 데스크톱/Android 142 이상입니다.

이 저장소는 [MedeiaBeliar/chzzk_auto_log_power](https://github.com/MedeiaBeliar/chzzk_auto_log_power)의 최신 Chrome 코드를 Firefox Manifest V2에 맞게 포팅하고, 최신 치지직 DOM 대응과 Android 호환성을 보완한 파생 프로젝트입니다. 치지직, 네이버 또는 Mozilla의 공식 확장 프로그램이 아닙니다.

## 포팅 내용

현재 버전 1.3.3은 원본 v1.3.3(커밋 `5462329`, 2026-11-08)을 기준으로 합니다.

원본에서 그대로 가져온 기능:

- 변경된 치지직 CSS 클래스와 버튼 텍스트(`통나무`, `파워`, `1시간` + `받기`)를 함께 사용한 획득 버튼 탐색
- `WATCH_1_HOUR` 보상은 API로 직접 요청하지 않고 화면의 실제 받기 버튼 클릭
- 파워 표시, 시계, 움직이는 GIF 프로필, 파워 요약, 승부예측 로그, 파트너·챌린저 인증 마크

Firefox용으로 바꾼 부분:

- Firefox Manifest V2의 콜백 기반 `chrome.*` API에서 원본의 `await` 저장소 호출이 동작하도록 Promise 래퍼를 사용합니다.
- AMO 검사 기준에 맞춰 `innerHTML` 문자열 렌더링을 DOM API로 바꾸고, 외부 이미지 URL은 `https:`만 허용합니다.
- Firefox 전용 `browser_specific_settings.gecko` 확장 ID와 API 호스트 권한을 선언합니다.

## 임시 설치

1. [Releases](../../releases)에서 `AMO-UPLOAD-chzzk-log-power-helper-1.3.3.zip`을 받거나 `npm run package`로 패키지를 만듭니다.
2. Firefox에서 `about:debugging#/runtime/this-firefox`를 엽니다.
3. **임시 부가 기능 로드**를 누릅니다.
4. 압축을 푼 폴더의 `manifest.json`을 선택합니다.

임시 부가 기능은 Firefox를 재시작하면 제거됩니다. 일반 Firefox에 영구 설치하려면 Mozilla 서명이 된 XPI가 필요합니다.

## AMO 제출 시 주의

AMO의 **부가 기능 파일 업로드**에는 릴리스 자산 `AMO-UPLOAD-chzzk-log-power-helper-1.3.3.zip`만 사용하세요. GitHub가 자동으로 제공하는 **Source code (zip)**, 저장소 전체를 받은 ZIP, 또는 `*-source.zip`은 확장 설치 파일이 아닙니다.

올바른 ZIP을 열면 첫 화면에 `manifest.json`, `content.js`, `popup.js` 등이 바로 보여야 합니다. `chzzk-log-power-helper/manifest.json`처럼 상위 폴더가 먼저 보이면 AMO가 `manifest.json was not found` 오류를 냅니다. 패키징 스크립트는 이 구조를 자동 검사하며 잘못된 ZIP이면 실패합니다.

## 개발 및 검증

Node.js가 설치된 환경에서 다음을 실행합니다.

```sh
npm run check
npm run package
```

실제 획득 동작은 치지직에 로그인한 Firefox에서 라이브 방송을 1시간 이상 시청한 뒤, 개발자 도구 콘솔과 파워 로그를 함께 확인해야 합니다.

## 개인정보 보호

확장은 현재 보고 있는 치지직 채널을 식별하고 화면의 받기 버튼을 클릭하며, 로그인된 사용자의 치지직 통나무 잔액·보상·승부예측 정보를 치지직 API에서 조회합니다. 데이터는 개발자 서버로 전송하지 않으며 획득 로그와 설정은 브라우저 저장소에만 보관합니다. 자세한 내용은 [개인정보처리방침](PRIVACY.md)을 확인하세요.

## 라이선스 및 저작자 표시

이 프로젝트는 아래 원본 프로젝트를 수정한 파생 저작물이며, 원본과 같은 GNU GPL v3.0으로 전체 소스를 공개합니다.

```
치지직 통나무 파워 자동 획득 — Copyright © 2025 chocolily
원본 저장소: https://github.com/MedeiaBeliar/chzzk_auto_log_power
원본 Chrome Web Store: https://chromewebstore.google.com/detail/mdammcmmopljkpnokoodkahdhnpijhib
라이선스: GPL-3.0
```

- 원본 저장소는 `choco-lily/chzzk_auto_log_power`에서 `MedeiaBeliar/chzzk_auto_log_power`로 이전되었습니다.
- 라이선스 전문: [LICENSE](LICENSE)
- 이 프로그램은 어떠한 보증도 제공하지 않습니다. 자세한 내용은 GPL-3.0 제15조·제16조를 참조하세요.

### 수정 고지 (GPL-3.0 제5조 a항)

원본 대비 수정한 파일은 `content.js`, `log.js`이며 각 파일 머리에 수정 고지를 두었습니다. `popup.js`, `index.html`, `log.html`, `icon.png`는 원본 v1.3.3과 같습니다. `manifest.json`은 Firefox용으로 새로 작성했습니다.

| 날짜 | 기준 원본 | 변경 |
| --- | --- | --- |
| 2026-11-23 | v1.3.3 (`5462329`) | 원본 업데이트 반영: 파트너·챌린저 인증 마크 구분, 전체 기간 날짜 표기 개선, 로그 전체 삭제 후에도 다음 획득 시간 유지(실제 획득 시각 `lastPowerAcquisitionTime` 기준 계산) |
| 2026-08-17 | v1.3.2 | 최초 Firefox 포트: MV2 매니페스트, 저장소 Promise 래퍼, DOM API 렌더링, Android 호환 선언, 개인정보처리방침 |
