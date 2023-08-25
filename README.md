<div align="center">
  <img src="https://github.com/shinyeeun789/education-web/assets/70800414/d7a962e3-4404-49fb-8baa-eaf103db4132" height="120px">

</div>

#
특성화고등학교 학생들을 위한 교육 웹 애플리케이션 개발 프로젝트입니다.

## 💻 프로젝트 소개

### 🕰 개발 기간
2023.08.01 ~ 2023.08.24

### 📚 개발 환경
![Java](https://img.shields.io/badge/Java-007396.svg?&style=for-the-badge&logo=Java&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![css3](https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
![ApacheTomcat](https://img.shields.io/badge/ApacheTomcat-F8DC75?style=for-the-badge&logo=ApacheTomcat&logoColor=black)

<br/>

## 📌 프로젝트 산출물
### 1. Usecase Diagram
<img width="1300" alt="usecase diagram1" src="https://github.com/shinyeeun789/education-web/assets/70800414/01942bac-7bed-436c-8080-cb9d1298d3e2">
<img width="1300" alt="usecase diagram2" src="https://github.com/shinyeeun789/education-web/assets/70800414/9ca39252-d46a-4bc5-8f3a-0c20a33ca528">
<img width="1300" alt="usecase diagram3" src="https://github.com/shinyeeun789/education-web/assets/70800414/28c75ac8-acb7-4b3b-ac71-4d6ccd02a6c7">

### 2. 화면 설계도
화면 설계 링크 : https://ovenapp.io/view/JWrQHuEthPSUtPzJw18KRBkI6qvziHP8/


### 3. ERD
<img width="1300" alt="ERD" src="https://github.com/shinyeeun789/education-web/assets/70800414/678a932c-6702-4baa-8b46-2b44ebb9d9d2">


### 4. Class Diagram
<img width="1300" alt="class diagram" src="https://github.com/shinyeeun789/education-web/assets/70800414/ccd7d13e-bc8f-4fed-9555-a1aa6eb406f5">


<br/>
<br/>

## 📱 주요 기능
### 1. 회원 기능
#### (1) 회원가입
- 아이디 중복 체크, 비밀번호와 비밀번호 확인의 값이 동일한지 체크한 후, 모든 조건이 true인 경우에만 회원가입할 수 있도록 구현
#### (2) 로그인
- 아보카도의 기능을 사용하기 위해서는 로그인 필수
- 비로그인 시 FAQ 리스트만 접근 가능
#### (3) 마이페이지
- 로그인한 사용자의 개인 정보 변경 가능
- mariaDB에 저장되어 있는 암호화된 비밀번호를 복호화하여 input에 password type으로 출력
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img src="https://github.com/shinyeeun789/education-web/assets/70800414/7b5fc60a-9ecb-4528-9963-23a71c7a215b" width="1300" alt=""/> <br/>
      <sub><b> PIC1 : 회원가입</sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/shinyeeun789/education-web/assets/70800414/cce3f68e-da79-4fda-8262-25d8ea9b95c5" width="1300" alt=""/> <br/>
      <sub><b> PIC2 : 로그인 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/shinyeeun789/education-web/assets/70800414/5c276246-8051-45fa-957b-d75d791fdcd6" width="1300" alt=""/> <br/>
      <sub><b> PIC3 : 마이페이지 </sub></b>
    </td>
  </tr>
</table>

### 2. 온라인 강의 기능
#### (1) 과목별 강의 목록
- 과목별 온라인 강의 목록을 확인할 수 있는 화면
#### (2) 강의 추천
- 강의를 다른 사용자에게 추천할 수 있는 기능 구현
- 추천수를 바탕으로 메인 페이지에 인기 강의 리스트 출력
#### (3) 강의 플레이어
- 비디오 플레이어를 통해 온라인 강의를 수강할 수 있는 기능 구현
- 재생, 일시정지, 중지, 음량 조 기능이 포함되어 있는 비디오 플레이어 구현
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img src="https://github.com/shinyeeun789/education-web/assets/70800414/eb727169-2914-4db5-9bf9-f2bea1f80d7f" width="1300" alt=""/> <br/>
      <sub><b> PIC1 : 과목별 강의 목록 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/shinyeeun789/education-web/assets/70800414/0e1b9f42-66c2-42ed-a2ea-63dffb6123bd" width="1300" alt=""/> <br/>
      <sub><b> PIC2 : 강의 정보 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/shinyeeun789/education-web/assets/70800414/ea563b20-d1b1-4edd-ace9-d70532daac98" width="1300" alt=""/> <br/>
      <sub><b> PIC3 : 강의 목록 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/shinyeeun789/education-web/assets/70800414/7b078efe-b8e0-400a-ade2-f913406ba18f" width="1300" alt=""/> <br/>
      <sub><b> PIC4 : 강의 플레이어 </sub></b>
    </td>
  </tr>
</table>

### 3. 커뮤니티
#### (1) 커뮤니티
- 커뮤니티 글 작성, 수정, 삭제, 상세 글 보기 기능 구현
- 댓글 기능 구현
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img src="https://github.com/shinyeeun789/education-web/assets/70800414/3e11e3e0-f8e7-4b01-be99-f1744180fc80" width="1300" alt=""/> <br/>
      <sub><b> PIC1 : 커뮤니티 목록 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/education-web/assets/70800414/b33e7e8f-d53e-4d70-a7b1-27ec9a5de41e"> <br/>
      <sub><b> PIC2 : 게시글 상세 보기 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/education-web/assets/70800414/9dcd84ca-bd73-4bc1-8432-5b70501c6880"> <br/>
      <sub><b> PIC3 : 글 수정하기 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/education-web/assets/70800414/fd5363f6-d58b-4d52-a7e9-fd4634a62dea"> <br/>
      <sub><b> PIC4 : 글 작성하기 </sub></b>
    </td>
  </tr>
</table>

#### (2) 공지사항
- 공지사항 글 작성, 수정, 삭제, 상세 글 보기 기능 구현
- 관리자만 공지사항의 글을 작성, 수정, 삭제 가능
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/education-web/assets/70800414/f314b9d9-ee56-4593-9bb4-04f9472c75d4"> <br/>
      <sub><b> PIC1 : 공지사항 목록 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/education-web/assets/70800414/0efc35be-114e-4014-ae45-8e9d4385dacf"> <br/>
      <sub><b> PIC2 : 게시글 상세 보기 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/education-web/assets/70800414/106c8948-f268-417a-b7a0-8f9d81fbe582"> <br/>
      <sub><b> PIC3 : 글 수정하기 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/education-web/assets/70800414/3b8b93fa-26de-4c36-82bf-c854ba26ee99"> <br/>
      <sub><b> PIC4 : 글 작성하기 </sub></b>
    </td>
  </tr>
</table>
        
#### (3) QnA
- QnA의 질문과 답변 글 작성, 수정, 삭제, 상세 보기 기능 구현
- 답변 글 추가 시 화면의 상단에 질문 글이 보이도록 구현
- 질문 글 삭제 시 답변 글도 같이 삭제되도록 구현
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/education-web/assets/70800414/3273441e-aa81-4c89-9bb8-99cafc0246ab"> <br/>
      <sub><b> PIC1 : QnA 목록 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/education-web/assets/70800414/5aaadd28-f6ae-4742-8fb7-9d421dd934f7"> <br/>
      <sub><b> PIC2 : 글 상세 보기 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/education-web/assets/70800414/9dccb1e4-a0e6-4cd6-8d8a-a4d06e3cea45"> <br/>
      <sub><b> PIC3 : 글 수정하기 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/education-web/assets/70800414/b684070a-b7e2-4e68-aaad-c631e1869517"> <br/>
      <sub><b> PIC4 : 질문 글 작성하기 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/education-web/assets/70800414/a271417a-0c8e-42d6-b4d4-537e3f1d675a"> <br/>
      <sub><b> PIC5 : 답변 글 작성하기 </sub></b>
    </td>
  </tr>
</table>

#### (4) FAQ
- 자주 묻는 질문 리스트를 연동된 mariaDB에서 가져와 화면에 출력
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/education-web/assets/70800414/68a80e0a-279f-45ba-9417-9cfa703707ac"> <br/>
      <sub><b> PIC1 : QnA 목록 </sub></b>
    </td>
  </tr>
</table>

### 5. 회사소개
#### (1) 오시는 길
- Daum Map API를 활용하여 특정 위도와 경도의 위치를 표현하는 화면 구현
#### (2) 회사소개
- 아보카도의 슬로건과 비전을 설명하는 화면 구현
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="image" src="https://github.com/shinyeeun789/education-web/assets/70800414/e7b8510a-6798-447c-bff5-b9578a01c86c"> <br/>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="스크린샷 2023-08-23 171743" src="https://github.com/shinyeeun789/education-web/assets/70800414/c1a6e6d5-4aeb-472c-81f5-11e96252678b"> <br/>
    </td>
  </tr>
</table>
