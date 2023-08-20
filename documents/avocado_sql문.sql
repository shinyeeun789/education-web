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

-- QnA 리스트
SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev,
       a.par AS par, b.name AS name
FROM qna a, member b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC;