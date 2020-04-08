-- 파일명: notice_v1jc.sql
-- 테이블명: 공지사항(notice)
-- 속성: 공지번호, 제목, 내용, 등록자 성명, 패스워드, 등록일
DROP TABLE notice;

CREATE TABLE notice (
  noticeno  NUMBER(7)      NOT NULL, -- -9999999 ~ 9999999, 공지사항 번호
  title        VARCHAR(100)  NOT NULL, -- 제목
  content CLOB                 NOT NULL,-- 내용이 많을 수 있으므로 CLOB
  rname     VARCHAR(20)     NOT NULL, -- 등록자 성명
  passwd VARCHAR(20)    NOT NULL, -- 패스워드
  rdate      DATE               NOT NULL, -- 등록일
  PRIMARY KEY(noticeno)
);



CREATE SEQUENCE notice_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE  9999999
  CACHE  2
  NOCYCLE;

-- 시퀀스 정보를 볼 수 있다.
-- 테이블에 기록이 저장되고 있다.
SELECT * FROM user_sequences;
SEQUENCE_NAME                   MIN_VALUE  MAX_VALUE INCREMENT_BY C O CACHE_SIZE LAST_NUMBER
------------------------------ ---------- ---------- ------------ - - ---------- -----------
MEMO_SEQ                                1    9999999            1 N N          2           7
NOTICE_SEQ                              1    9999999            1 N N          2           1
SALES_SEQ                               1   99999999            1 N N          2          13

-- 등록(INSERT INTO VALUES)
INSERT INTO notice(noticeno, title, content, rname, passwd, rdate )
VALUES (notice_seq.nextval, '4월 open 안내.', '코로나19 극복 치킨 "50%" 할인', '아로미', '1234', sysdate);

INSERT INTO notice(noticeno, title, content, rname, passwd, rdate )
VALUES (notice_seq.nextval, '방역 안내.', '우리 매장은 안전합니다.', '왕눈이', '1234', sysdate);

-- 목록(SELECT FROM ORDER BY)
-- 최신 공지사항이 위로
-- 비밀번호는 아직 암호화 되지 않음
SELECT noticeno, title, content, rname, passwd, rdate
FROM notice
ORDER BY noticeno DESC;
NOTICENO TITLE                        CONTENT                                      RNAME                PASSWD               RDATE              
---------- ---------------------------------------------------------------------------------------------------- -----------------------------------------------
         2 방역 안내.                       우리 매장은 안전합니다.                     왕눈이               1234                 2020-03-26 10:20:42
         1 4월 open 안내.                코로나19 극복 치킨 "50%" 할인           아로미               1234                 2020-03-26 10:15:37

-- 조회(SELECT FROM WHERE)
SELECT noticeno, title, content, rname, passwd, rdate
FROM notice
WHERE noticeno=2;
NOTICENO TITLE                        CONTENT                                      RNAME                PASSWD               RDATE              
---------- ---------------------------------------------------------------------------------------------------- -----------------------------------------------
         1 4월 open 안내.                코로나19 극복 치킨 "50%" 할인           아로미               1234                 2020-03-26 10:15:37

-- 패스워드 검사: 1: 일치 0: 불일치
SELECT COUNT(*) AS passwd_cnt
FROM notice
WHERE noticeno = 2 AND passwd='1234';


-- 수정(UPDATE SET WHERE)
-- PK는 통일된 데이터 관리가 어려움으로 변경하지 않음
-- 관계형 데이터베이스, RDBMS의 구조상 일반적으로 변경 불가능
UPDATE notice 
SET title='포인트 금액 증가 안내', content='결제 금액의 10% 무조건 캐시백', rname='홍길동' 
WHERE noticeno=1;

  NOTICENO TITLE                      CONTENT                                 RNAME                PASSWD               RDATE              
---------- --------------------------------------------------------------------------------------------------------------- -------------------- ----------
         1 포인트 금액 증가 안내      결제 금액의 10% 무조건 캐시백       홍길동               1234                 2020-03-26 10:15:37

-- 삭제
DELETE FROM notice WHERE noticeno=1;

-- 등록 공지사항 수
SELECT COUNT(*) AS cnt 
FROM notice;


       CNT
----------
         1
         
-- 조회수, 수정 날짜 등의 컬럼 추가 가능

-- 변경 사항 저장, 자바와 sqldeveloper 동기화
COMMIT;







-- 페이징 구현 step1
SELECT noticeno, title, rname, passwd, rdate
FROM notice
ORDER BY noticeno DESC;

-- 페이징 구현 step2
-- rownum 생성
 SELECT noticeno, title, rname, passwd, rdate, rownum as r
 FROM(
        SELECT noticeno, title, rname, passwd, rdate
        FROM notice
        ORDER BY noticeno DESC
);


-- 페이징 구현 step3
-- rownum 생성
-- content처럼 필요 없는 데이터 칼럼은 가져오지 않는 것이 좋다. 메모리 부하 발생
SELECT noticeno, title, rname, passwd, rdate, r
FROM(
        SELECT noticeno, title, rname, passwd, rdate, rownum as r
        FROM(
                SELECT noticeno, title, rname, passwd, rdate
                FROM notice
                ORDER BY noticeno DESC
        )
)
WHERE r>=4 AND r<=6;













