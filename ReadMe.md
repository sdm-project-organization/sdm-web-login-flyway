# GUARD FlywayDB

## 시작하기전에

- GUARD(로그인서버 RESTful API) 프로젝트의 SQL 형상관리 프로젝트
  - `Flyway`를 이용한 SQL 형상관리
  - `Profiles`을 이용하여 상황별 다른 SQL을 적용

## 환경설정

- [ ] Local 환경에서는 환경변수를 local로 설정해야 합니다.
- [ ] VPN이 연결되야 Stage, Live 서버에 반영이 가능합니다.
- [ ] Jenkins를 이용하여 SQL 반영이 가능합니다.

## Jenkins 연동전략

- `git repository`에 반영함으로써 Jenkins 빌드를 유발시킵니다.
- 빌드를 유발시키는 branch는 다음과 같습니다. `live, stage, dev` 
    - 차후 해당 브런치는 관리자만 반영이 가능하게 설정해야 합니다.
    - `Git 계정`에 따라 브런치에 접근하지 못하게 하는 것이 가능한지
    - Jenkins에서 `Git 계정`에 따라 처리하는 것이 가능한지

