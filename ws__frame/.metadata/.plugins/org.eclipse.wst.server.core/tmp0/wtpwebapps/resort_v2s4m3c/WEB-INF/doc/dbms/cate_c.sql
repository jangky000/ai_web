--2) 테이블 삭제: 자식 -> 부모
--① 부모 테이블 삭제 시 에러 발생: DROP TABLE categrp; : ORA-02449: unique/primary keys in table referenced by foreign keys
--② 자식 테이블 삭제: DROP TABLE cate;
--③ 부모 테이블 삭제: DROP TABLE categrp;
-- 
-- 
--3) 테이블 생성: 부모 -> 자식
--① FK cate 자식 테이블 생성 시 에러 발생: ORA-00942: table or view does not exist
--② 부모 테이블 먼저 생성: categrp
--③ 자식 테이블 생성: cate

/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
--DROP TABLE categrp;
--CREATE TABLE categrp(
--		categrpno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
--		name                          		VARCHAR2(50)		 NOT NULL,
--		seqno                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
--		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
--		rdate                         		DATE		 NOT NULL
--);
--
--COMMENT ON TABLE categrp is '카테고리 그룹';
--COMMENT ON COLUMN categrp.categrpno is '카테고리 그룹번호';
--COMMENT ON COLUMN categrp.name is '이름';
--COMMENT ON COLUMN categrp.seqno is '출력 순서';
--COMMENT ON COLUMN categrp.visible is '출력 모드';
--COMMENT ON COLUMN categrp.rdate is '그룹 생성일';


/**********************************/
/* Table Name: 카테고리 */
/**********************************/
DROP TABLE cate;
CREATE TABLE cate(
		cateno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		categrpno                     		NUMBER(10)		 NOT NULL,
		name                          		VARCHAR2(100)		 NOT NULL,
		seqno                         		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		cnt                           		NUMBER(10)		 DEFAULT 0		 NOT NULL,
  FOREIGN KEY (categrpno) REFERENCES categrp (categrpno)
);

COMMENT ON TABLE cate is '카테고리';
COMMENT ON COLUMN cate.cateno is '카테고리 번호';
COMMENT ON COLUMN cate.categrpno is '카테고리 그룹번호';
COMMENT ON COLUMN cate.name is '카테고리 이름';
COMMENT ON COLUMN cate.seqno is '출력 순서';
COMMENT ON COLUMN cate.visible is '출력 모드';
COMMENT ON COLUMN cate.rdate is '등록일';
COMMENT ON COLUMN cate.cnt is '등록된 글수';

-- 시퀀스 삭제
DROP SEQUENCE cate_seq;
-- 시퀀스 생성
CREATE SEQUENCE cate_seq
    START WITH 1            -- 시작 번호
    INCREMENT BY 1        -- 증가 단위
    MAXVALUE 9999999999    -- 최대값ㅣ 9999999999 -- NUMBER(10)이 선언 되어 있어야 함
    CACHE 2                     -- 2번은 메모리에서 계산, 2번 간 업데이트를 하지 않음 -> 속도 향상
    NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지

-- 3) ERROR 발생하는 등록
INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, 'SF', 1 , 'Y', sysdate, 0);

SELECT * FROM categrp;
-- 외래키가 존재하지 않는 경우
-- ORA-02291: integrity constraint (AI6.SYS_C007187) violated - parent key not found

-- 부모테이블에 레코드가 없어서 등록이 실패

-- 시퀀스 삭제
DROP SEQUENCE categrp_seq;

-- 시퀀스 생성
CREATE SEQUENCE categrp_seq
    START WITH 1            -- 시작 번호
    INCREMENT BY 1        -- 증가 단위
    MAXVALUE 9999999999    -- 최대값ㅣ 9999999999 -- NUMBER(10)이 선언 되어 있어야 함
    CACHE 2                     -- 2번은 메모리에서 계산, 2번 간 업데이트를 하지 않음 -> 속도 향상
    NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지

INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '영화', 1, 'Y', sysdate);
 
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '여행', 2, 'Y', sysdate);
 
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '캠핑', 3, 'Y', sysdate);

COMMIT;

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 영화                                                        1 Y 2020-04-27 12:01:49
         2 여행                                                        2 Y 2020-04-27 12:01:49
         3 캠핑                                                        3 Y 2020-04-27 12:01:49
         
-- 4) 정상 등록
INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, 'SF', 1 , 'Y', sysdate, 0);

INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, '드라마', 1 , 'Y', sysdate, 0);

INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, '스릴러', 1 , 'Y', sysdate, 0);

-- 5) 목록
SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
ORDER BY seqno;
    CATENO  CATEGRPNO NAME    SEQNO  V  RDATE      CNT
---------- ---------- ------------------- ---------- - ------------------- ----------
         1          1              SF             1       Y 2020-04-27 12:17:04          0
         2          1              드라마       1       Y 2020-04-27 12:17:04          0
         3          1              스릴러        1      Y 2020-04-27 12:17:04          0


-- 6) 자식 레코드 삭제
DELETE FROM cate
WHERE cateno = 1;
    CATENO  CATEGRPNO NAME    SEQNO  V  RDATE      CNT
---------- ---------- ------------------- ---------- - ------------------- ----------
         2          1              드라마       1       Y 2020-04-27 12:17:04          0
         3          1              스릴러        1      Y 2020-04-27 12:17:04          0


--DELETE
DELETE FROM categrp
WHERE categrpno=1;
-- ORA-02292: integrity constraint (AI6.SYS_C007208) violated - child record found
-- 자식 레코드 중에 grpno=1을 사용하는 레코드가 있으면 부모 레코드 삭제 불가

-- 7) categrpno FK 값을 이용한 삭제
DELETE FROM cate
WHERE categrpno=1;

-- cate 테이블에 레코드가 없는 경우 삭제 가능
DELETE FROM categrp
WHERE categrpno=1;

SELECT * FROM categrp;
 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         2 여행                                                        2 Y 2020-04-27 12:01:49
         3 캠핑                                                        3 Y 2020-04-27 12:01:49

COMMIT;

-- 8) 조회, 수정폼
SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
WHERE cateno=1;

-- 9) 수정
UPDATE cate
SET categrpno=1, name='식당', seqno = 10, visible='N', cnt=0
WHERE cateno = 5;

commit;













