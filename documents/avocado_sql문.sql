USE avocado;

-- 한글 깨짐 처리
ALTER DATABASEado DEFAULT CHARACTER SET utf8 COLLATE UTF8_GENERAL_CI;
ALTER TABLE member CONVERT TO CHARSET UTF8;

-- 회원(member) 테이블 생성
CREATE TABLE member(
  id VARCHAR(16) NOT NULL,
  pw VARCHAR(330) NOT NULL,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  tel VARCHAR(13),
  resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (id));
  
SELECT * FROM member;

----------------------------------------------------------------------------------------------------

-- 게시판(board) 테이블 생성
CREATE TABLE board(
   bno INT PRIMARY KEY AUTO_INCREMENT,
   title VARCHAR(200) NOT NULL,
   content VARCHAR(1000),
   author VARCHAR(16) NOT NULL,
   resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   cnt INT DEFAULT 0,
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE
);

-- 게시판 더미글 추가 8건
INSERT INTO board(title, content, author)
VALUES ('게시판1', '여기는 게시판1입니다', 'admin');
INSERT INTO board(title, content, author)
VALUES ('게시판2', '여기는 게시판2입니다', 'shin');
INSERT INTO board(title, content, author)
VALUES ('게시판3', '여기는 게시판3입니다', 'shin');
INSERT INTO board(title, content, author)
VALUES ('게시판4', '여기는 게시판4입니다', 'admin');
INSERT INTO board(title, content, author)
VALUES ('게시판5', '여기는 게시판5입니다', 'admin');
INSERT INTO board(title, content, author)
VALUES ('게시판6', '여기는 게시판6입니다', 'shin');
INSERT INTO board(title, content, author)
VALUES ('게시판7', '여기는 게시판7입니다', 'admin');
INSERT INTO board(title, content, author)
VALUES ('게시판8', '여기는 게시판8입니다', 'admin');

COMMIT;

SELECT * FROM board;

------------------------------------------------------
-- 댓글(comment) 테이블 생성
create table comment(
	cno INT AUTO_INCREMENT PRIMARY KEY,
	bno INT,
	author VARCHAR(16),
   resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
   content VARCHAR(200),
   FOREIGN KEY(bno) REFERENCES board(bno) ON DELETE CASCADE
);

SELECT * FROM comment;
-------------------------------------------------------------------------------------------------------------------

-- 공지사항(notice) 테이블 생성
CREATE TABLE notice(
 nno INT PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(200) NOT NULL,
 content VARCHAR(1000),
 author VARCHAR(16),
 resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 cnt INT DEFAULT 0);

-- 공지사항 더미글 추가 8건
INSERT INTO notice(title, content, author) VALUES ('공지사항1', '여기는 공지사항1입니다', 'admin');
INSERT INTO notice(title, content, author) VALUES ('공지사항2', '여기는 공지사항2입니다', 'admin');
INSERT INTO notice(title, content, author) VALUES ('공지사항3', '여기는 공지사항3입니다', 'admin');
INSERT INTO notice(title, content, author) VALUES ('공지사항4', '여기는 공지사항4입니다', 'admin');
INSERT INTO notice(title, content, author) VALUES ('공지사항5', '여기는 공지사항5입니다', 'admin');
INSERT INTO notice(title, content, author) VALUES ('공지사항6', '여기는 공지사항6입니다', 'admin');
INSERT INTO notice(title, content, author) VALUES ('공지사항7', '여기는 공지사항7입니다', 'admin');
INSERT INTO notice(title, content, author) VALUES ('공지사항8', '여기는 공지사항8입니다', 'admin');

COMMIT;

------------------------------------------------------------------------------------------------------------------
-- 질문 및 답변 테이블 생성
CREATE TABLE qna(
  qno INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(200) NOT NULL,
  content VARCHAR(1000),
  author VARCHAR(16),
  resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  cnt INT DEFAULT 0,
  lev INT DEFAULT 0,		-- 질문(0), 답변(1)
  par INT DEFAULT 0,						-- 부모 글번호 -> 질문(자신 레코드의 qno), 답변(질문의 글번호)
  FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE
);

-- 더미 데이터 작성
INSERT INTO qna(title, content, author, lev) VALUES('질문1', '질문입니다. 1', 'shin', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=1;

INSERT INTO qna(title, content, author, lev) VALUES('질문2', '질문입니다. 2', 'shin', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=2;

INSERT INTO qna(title, content, author, lev) VALUES('질문3', '질문입니다. 3', 'admin', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=3;

INSERT INTO qna(title, content, author, lev) VALUES('질문4', '질문입니다. 4', 'admin', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=4;

INSERT INTO qna(title, content, author, lev) VALUES('질문5', '질문입니다. 5', 'shin', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=5;

INSERT INTO qna(title, content, author, lev) VALUES('질문6', '질문입니다. 6', 'admin', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=6;

INSERT INTO qna(title, content, author, lev) VALUES('질문7', '질문입니다. 7', 'shin', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=7;

INSERT INTO qna(title, content, author, lev) VALUES('질문8', '질문입니다. 8', 'shin', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=8;

INSERT INTO qna(title, content, author, lev) VALUES('질문9', '질문입니다. 9', 'admin', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=9;

INSERT INTO qna(title, content, author, lev) VALUES('질문10', '질문입니다. 10', 'admin', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=10;

INSERT INTO qna(title, content, author, lev, par) VALUES ('질문1에 대한 답변', '답변입니다. 1', 'admin', 1, 1);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문2에 대한 답변', '답변입니다. 2.', 'admin', 1, 2);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문3에 대한 답변', '답변입니다. 3', 'admin', 1, 3);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문4에 대한 답변', '답변입니다. 4', 'admin', 1, 4);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문5에 대한 답변', '답변입니다. 5', 'admin', 1, 5);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문6에 대한 답변', '답변입니다. 6', 'admin', 1, 6);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문7에 대한 답변', '답변입니다. 7', 'admin', 1, 7);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문8에 대한 답변', '답변입니다. 8', 'admin', 1, 8);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문9에 대한 답변', '답변입니다. 9', 'admin', 1, 9);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문10에 대한 답변', '답변입니다. 10', 'admin', 1, 10);

COMMIT;

UPDATE qna SET par=qno WHERE par=0 AND lev=0;

-- QnA 리스트
SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev,
       a.par AS par, b.name AS name
FROM qna a, member b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC;

------------------------------------------------------------------------------------------------------------------------------
-- FAQ 테이블 생성
CREATE TABLE faq(
  fno INT PRIMARY KEY AUTO_INCREMENT,
  question VARCHAR(1000) NOT NULL,
  answer VARCHAR(1000),
  cnt INT DEFAULT 0
);

INSERT INTO faq(question, answer)
VALUES('자주 묻는 질문1', '자주 묻는 질문에 대한 답변1입니다.');
INSERT INTO faq(question, answer, cnt)
VALUES('자주 묻는 질문2', '자주 묻는 질문에 대한 답변2입니다.', 5);
INSERT INTO faq(question, answer, cnt)
VALUES('자주 묻는 질문3', '자주 묻는 질문에 대한 답변3입니다.', 10);
INSERT INTO faq(question, answer, cnt)
VALUES('자주 묻는 질문4', '자주 묻는 질문에 대한 답변4입니다.', 3);
INSERT INTO faq(question, answer, cnt)
VALUES('자주 묻는 질문5', '자주 묻는 질문에 대한 답변5입니다.', 4);
INSERT INTO faq(question, answer)
VALUES('자주 묻는 질문6', '자주 묻는 질문에 대한 답변6입니다.');

COMMIT;

--------------------------------------------------------------------------------------------------------------------------
-- 강의(lecture) 테이블 생성
CREATE TABLE lecture(
	lno INT AUTO_INCREMENT PRIMARY KEY,
	lname VARCHAR(200) NOT NULL,
	lteacher VARCHAR(50) NOT NULL,
	lexplain VARCHAR(1000) NOT NULL,
	filePath VARCHAR(500) NOT NULL,
	category VARCHAR(50) CHECK (category IN ('경영','회계','프론트엔드','백엔드','데이터베이스','메이크업','헤어')),
	likes INT DEFAULT 0);

SELECT * FROM lecture;

INSERT INTO lecture(lname, lteacher, lexplain, filePath, category)
VALUES('상업경제', '김상경', '비즈니스와 경제 원리를 연구하여 기업과 시장의 동작을 이해하고, 조직과 소비자에 대한 전략을 개발할 수 있습니다', '/lecture01.jpg', '경영');
INSERT INTO lecture(lname, lteacher, lexplain, filePath, category)
VALUES('금융실무', '이금융', '금융 업무의 기초를 다루며, 금융상품, 투자 전략, 리스크 관리 등을 학습하여 재무 분석과 금융 거래에 필요한 기술을 습득할 수 있습니다.', '/lecture02.jpg', '경영');
INSERT INTO lecture(lname, lteacher, lexplain, filePath, category)
VALUES('회계학원론', '임회계', '회계의 기본 원리와 개념을 다루며, 재무보고서 작성, 재무상태 분석, 원가 계산 등을 통해 조직의 경제적 활동을 이해하고 분석하는 기초를 제공합니다.', '/lecture03.jpg', '회계');
INSERT INTO lecture(lname, lteacher, lexplain, filePath, category)
VALUES('재무회계', '박재무', '기업의 재무상태, 손익계산서 등을 기록하고 보고하는 과정을 다루며, 재무정보를 통해 기업의 경제적 건강상태와 성과를 평가하는 방법을 배우는 강의입니다.', '/lecture04.jpg', '회계');
INSERT INTO lecture(lname, lteacher, lexplain, filePath, category)
VALUES('세무회계', '김세무', '세법과 규정을 준수하며 세금 신고 및 납부 절차를 이해하는 것에 초점을 두며, 기업과 개인이 세무 요구사항을 충족시키는 데 필요한 지식과 기술을 제공하는 강의입니다.', '/lecture05.jpg', '회계');
INSERT INTO lecture(lname, lteacher, lexplain, filePath, category)
VALUES('원가회계', '이원가', '제품 또는 서비스의 생산 비용을 추적하고 분석하는 방법을 습득할 수 있습니다. 원가 산정, 원가 분석, 가격 결정 등을 통해 효율적인 생산 및 경영 의사결정을 지원합니다.', '/lecture06.jpg', '회계');
INSERT INTO lecture(lname, lteacher, lexplain, filePath, category)
VALUES('빠르게 배우는 HTML5와 CSS3', '박프론', '웹 개발 기초를 다루는 강의로, 웹 페이지의 구조와 디자인을 위한 HTML5와 CSS3를 학습하여 원하는 웹 사이트를 구축하는 방법을 배웁니다.', '/lecture01.jpg','프론트엔드');
INSERT INTO lecture(lname, lteacher, lexplain, filePath, category)
VALUES('빠르게 배우는 Javascript', '박프론', '웹 페이지에 상호작용과 동적 요소를 추가하는 방법을 배우고, 사용자 경험 향상과 웹 애플리케이션 개발을 위한 프로그래밍 언어를 학습할 수 있습니다.', '/lecture02.jpg', '프론트엔드');
INSERT INTO lecture(lname, lteacher, lexplain, filePath, category)
VALUES('빠르게 배우는 jQuery', '박프론', '웹 개발에서 사용되는 제이쿼리 라이브러리의 활용법을 배우고, HTML 문서 조작, 이벤트 처리, 애니메이션 등을 단순화하여 웹 페이지를 동적으로 만드는 기술을 학습할 수 있습니다.','/lecture03.jpg', '프론트엔드');

COMMIT;
-----------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE lectureInfo(
	dno INT AUTO_INCREMENT PRIMARY KEY,
	lno INT NOT NULL,
	title VARCHAR(500) NOT NULL,
	filePath VARCHAR(500) NOT NULL,
	duration VARCHAR(20) NOT NULL,
	FOREIGN KEY lectureInfo(lno) REFERENCES lecture(lno) ON DELETE CASCADE);
	
INSERT INTO lectureInfo(lno, title, filePath, duration)
VALUES(7, '[1강] HTML 소개 및 기본 구조 학습', '/lecture01', '02:30');
INSERT INTO lectureInfo(lno, title, filePath, duration)
VALUES(7, '[2강] 제목, 단락, 줄바꿈 태그 사용법 익히기', '/lecture02', '03:25');
INSERT INTO lectureInfo(lno, title, filePath, duration)
VALUES(7, '[3강] 목록과 링크 생성하기', '/lecture03', '04:00');
INSERT INTO lectureInfo(lno, title, filePath, duration)
VALUES(7, '[4강] 이미지 삽입 및 이미지 링크 만들기', '/lecture01', '02:30');
INSERT INTO lectureInfo(lno, title, filePath, duration)
VALUES(7, '[5강] 테이블 작성과 데이터 정렬 기초 학습', '/lecture02', '03:25');
INSERT INTO lectureInfo(lno, title, filePath, duration)
VALUES(7, '[6강] 폼(Form) 요소와 입력 타입 활용', '/lecture03', '04:00');
INSERT INTO lectureInfo(lno, title, filePath, duration)
VALUES(7, '[7강] 미디어 요소: 비디오 및 오디오 삽입하기', '/lecture01', '02:30');
INSERT INTO lectureInfo(lno, title, filePath, duration)
VALUES(7, '[8강] 시맨틱 태그를 활용한 웹페이지 구조화', '/lecture02', '03:25');
INSERT INTO lectureInfo(lno, title, filePath, duration)
VALUES(7, '[9강] CSS 스타일 시트 연동하기', '/lecture03', '04:00');
INSERT INTO lectureInfo(lno, title, filePath, duration)
VALUES(7, '[10강] 웹 폰트와 아이콘 사용법', '/lecture01', '02:30');
INSERT INTO lectureInfo(lno, title, filePath, duration)
VALUES(7, '[11강] 반응형 웹 디자인: 미디어 쿼리 및 뷰포트 설정', '/lecture02', '03:25');
INSERT INTO lectureInfo(lno, title, filePath, duration)
VALUES(7, '[12강] HTML5 API 활용: 지오로케이션, 웹 스토리지, 웹 워커', '/lecture03', '04:00');