/*

1. SQL
- 논리적 모델링 속성: 영화번호, 제목, 평점, 출연, 등록 날짜
- 물리적 모델링 컬럼: movieno, title, good, name, rdate
- 목록

 movieno title           score name    rdate
 ------- --------------- ----- ------- ---------------------
       1 업사이드(영화, 2017)   10.0 케빈 하트   2019-09-02 12:39:51.0
       2 사일런스(영화, 2019)   10.0 스탠리 투치  2019-09-02 12:46:54.0
       3 인터스텔라(영화, 2014)  10.0 매튜 맥커너히 2019-09-02 12:48:59.0

*/

CREATE TABLE movie(
	movieno 	INT 				NOT NULL AUTO_INCREMENT,
	title 	VARCHAR(100) 	NOT NULL,
	score 	FLOAT 			NOT NULL,
	actor 		VARCHAR(100) 	NOT NULL,
	rdate 	DATETIME 		NOT NULL,
	PRIMARY KEY(movieno)
);

-- DROP TABLE movie;

-- 등록
INSERT INTO movie(title, score, actor, rdate)
	VALUES('업사이드(영화, 2017)', 10.0, '케빈 하트', NOW());
-- float 타입의 10.0을 넣지만 결과에서 소수점 자리가 0이면 소수점이 나오지 않는다.
INSERT INTO movie(title, score, actor, rdate)
	VALUES('사일런스(dudghk, 2019)', 10.0, '스탠리 투치', NOW());
INSERT INTO movie(title, score, actor, rdate)
	VALUES('인터스텔라(영화, 2014)', 10.0, '매튜 맥커너히', NOW());

SELECT * FROM movie;

-- 3) 목록
SELECT movieno, title, score, actor, rdate
FROM movie
ORDER BY title ASC;

SELECT movieno, title, score, actor, rdate
FROM movie
ORDER BY rdate DESC;


SELECT movieno, title
FROM movie
ORDER BY movieno ASC;

-- 4) 조회
SELECT movieno, title, score, actor, rdate
FROM movie
WHERE movieno = 1;


-- 5) 수정
-- 기본키는 일반적으로 바꾸지 않는다. 또한 제약조건으로 인해 변경 제한이 되어 있는 경우가 많다.
UPDATE movie 
SET title = '택시운전사(영화, 2017)', score='9.5', actor='송강호', rdate=NOW() 
WHERE movieno = 3;

SELECT movieno, title, score, actor, rdate
FROM movie
WHERE movieno = 3;


-- 6) 삭제
DELETE FROM movie 
WHERE movieno = 4;

-- 등록된 레코드 개수 COUNT(*)
-- 컬럼 이름 설정 AS
SELECT COUNT(*)
FROM movie;


SELECT COUNT(*) AS cnt
FROM movie;