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