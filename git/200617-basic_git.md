## Branch

* checkout : 시점 변경 (master -> branch)
* merge : 땡기는 개념
* git branch -D : branch 삭제
* CONFLICT (content): Merge conflict in <파일이름> -> 충돌 발생, 파일이름의 코드 내용 확인 (파일은 가능한 잘라서 작업하는 것이 좋다.)

## git flow

* git flow init : git flow로 사용하기위한 초기화

* feature : 기능 개발
* release : 테스트 단계
	* first vi : master에 적힐 내용 (merge
	* second vi : release note (잘쓰면 따로 문서화 할 필요가 없지용
	* third vi : develop에 들어간다

* 실습 순서
```
1. 생성
	1_1. repo를 생성하여 자신의 컴퓨터로 clon
	1_2. git flow init -> 자기소개 -> add, commit, push on develop
	1_3.노티스
	
2. 사용
 2_1. 노티스를 받으면 팀장의 레포 방문 후 fork
 2_2. 팀장 repo에서 이슈 작성
 2_3. fork를 뜬 내 레포를 clone
 2_4. develop 브랜치에서 feature/{username}
 2_5. README.md에 나의 소개 작성
 2_6. add, commit
 2_7. develop으로 이동 후 merge f/u -> push on develop
 2_8. pull request 링크를 눌러 새로운 pull request를 생성

3. 확인
	3_1. pull request 이동하여 작성상태를 확인
	3_2. merge
	3_3. pull request가 merge 되었음을 노티스
	
4. 업데이트

    4_1. git remote add pmorigin {팀장 레포 주소}

    4_2. git pull pmorigin develop하여 머지하여 확인
```
## 협업방법

* 다른사람의 repo를 자신의 것인것처럼 사용 (Collbaration) -> 비추

* Fork and Merge