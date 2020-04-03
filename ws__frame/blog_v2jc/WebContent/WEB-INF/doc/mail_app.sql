-- 파일명: notice_v1jc.sql
-- 테이블명: 공지사항(notice)
-- 속성: 공지번호, 제목, 내용, 등록자 성명, 패스워드, 등록일
DROP TABLE mail_app;

CREATE TABLE mail_app (
  mailno    NUMBER(7)      NOT NULL, -- -9999999 ~ 9999999, 공지사항 번호
  title         VARCHAR(100)  NOT NULL, -- 제목
  content   CLOB                 NOT NULL,-- 내용이 많을 수 있으므로 CLOB
  mail_from     VARCHAR(100)     NOT NULL, -- 보내는 사람 ip
  mail_to       VARCHAR(100) NOT NULL, -- 받는 사람 ip
  rdate      DATE               NOT NULL, -- 등록일
  url1        VARCHAR(1000), -- 첨부 링크
  url2        VARCHAR(1000), -- 첨부 링크
  youtube        VARCHAR(1000), -- 첨부 링크
  cnt         NUMBER(7) DEFAULT 0, -- 조회수
  PRIMARY KEY(mailno)
);

-- url1의 입력 가능 길이를 변경
ALTER TABLE mail_app 
MODIFY(url1 VARCHAR(1000));

DROP SEQUENCE mail_seq;

CREATE SEQUENCE mail_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE  9999999
  CACHE  2
  NOCYCLE;

-- 시퀀스 정보를 볼 수 있다.
-- 테이블에 기록이 저장되고 있다.
SELECT * FROM user_sequences;


-- 등록(INSERT INTO VALUES)
--INSERT INTO mail_app(mailno, title, content, mail_from, mail_to, rdate )
--VALUES (mail_seq.nextval, '메일에 가입해주셔서 감사합니다', '메일에 가입해주셔서 감사합니다. 많은 이용 부탁드립니다.', '172.16.12.4', '172.16.12.4', sysdate);
--
--INSERT INTO mail_app(mailno, title, content, mail_from, mail_to, rdate )
--VALUES (mail_seq.nextval, '사용법', '상대의 아이피와 보낼 제목/내용을 입력해주세요', '172.16.12.4', '172.16.12.4', sysdate);

-- FOR LOOP 사용법
SET serveroutput ON;
BEGIN
	FOR i in 1..100 LOOP
            INSERT INTO mail_app(mailno, title, content, mail_from, mail_to, rdate ) VALUES (mail_seq.nextval, '메일에 가입해주셔서 감사합니다', '메일에 가입해주셔서 감사합니다. 많은 이용 부탁드립니다.', '172.16.12.4', '172.16.12.'||i, sysdate);
			INSERT INTO mail_app(mailno, title, content, mail_from, mail_to, rdate ) VALUES (mail_seq.nextval, '사용법', '상대의 아이피를 기입하여 메일을 보내보세요', '172.16.12.4', '172.16.12.'||i, sysdate);
	END LOOP;
END;

SELECT mailno, title, content, mail_from, mail_to, rdate, url1, url2, youtube, cnt
FROM mail_app
WHERE mail_from = '172.16.12.4' -- ""는 문자열로 인식하지 못함 싱글코테이션 사용해야 함
ORDER BY mailno DESC;



-- 조회(SELECT FROM WHERE)
SELECT mailno, title, content, mail_from, mail_to, rdate, url1
FROM mail_app
WHERE mailno=2;


-- 수정(UPDATE SET WHERE)
-- PK는 통일된 데이터 관리가 어려움으로 변경하지 않음
-- 관계형 데이터베이스, RDBMS의 구조상 일반적으로 변경 불가능
UPDATE mail_app 
SET title='메일에 가입해주셔서 감사합니다', content='메일에 가입해주셔서 감사합니다'
WHERE mailno=1;


-- 삭제
DELETE FROM mail_app WHERE mailno=1;

-- 등록 공지사항 수
SELECT COUNT(*) AS cnt FROM mail_app;
  
-- 조회수, 수정 날짜 등의 컬럼 추가 가능

-- 변경 사항 저장, 자바와 sqldeveloper 동기화
COMMIT;

SELECT mailno, title, content, mail_from, mail_to, rdate, url1, url2, youtube
FROM mail_app
ORDER BY mailno DESC;

--SET serveroutput ON;
--BEGIN
--	FOR i in 1..100 LOOP
--	  	if mod(i, 2) = 1 then 
--            INSERT INTO mail_app(mailno, title, content, mail_from, mail_to, rdate ) VALUES (100+i, '메일에 가입해주셔서 감사합니다', '메일에 가입해주셔서 감사합니다. 많은 이용 부탁드립니다.', '172.16.12.4', '172.16.12.'||i, sysdate);
--		else
--			INSERT INTO mail_app(mailno, title, content, mail_from, mail_to, rdate ) VALUES (100+i, '사용법', '상대의 아이피와 보낼 제목/내용을 입력해주세요', '172.16.12.4', '172.16.12.'||i, sysdate);
--		end if;
--	END LOOP;
--END;

     
UPDATE mail_app SET cnt=2 WHERE mailno=8;

SELECT mailno, title, content, mail_from, mail_to, rdate, url1, url2, youtube, cnt
FROM mail_app
WHERE mail_from = '172.16.12.4' -- ""는 문자열로 인식하지 못함 싱글코테이션 사용해야 함
ORDER BY mailno DESC;