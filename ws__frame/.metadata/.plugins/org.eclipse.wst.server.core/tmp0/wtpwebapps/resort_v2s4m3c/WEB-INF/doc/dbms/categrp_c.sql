/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
DROP TABLE categrp;

CREATE TABLE categrp(
		categrpno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(50)		 NOT NULL,
		seqno                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE categrp is '카테고리 그룹';
COMMENT ON COLUMN categrp.categrpno is '카테고리 그룹번호';
COMMENT ON COLUMN categrp.name is '이름';
COMMENT ON COLUMN categrp.seqno is '출력 순서';
COMMENT ON COLUMN categrp.visible is '출력 모드';
COMMENT ON COLUMN categrp.rdate is '그룹 생성일';



-- 시퀀스 생성
CREATE SEQUENCE categrp_seq
    START WITH 1            -- 시작 번호
    INCREMENT BY 1        -- 증가 단위
    MAXVALUE 9999999999    -- 최대값ㅣ 9999999999 -- NUMBER(10)이 선언 되어 있어야 함
    CACHE 2                     -- 2번은 메모리에서 계산, 2번 간 업데이트를 하지 않음 -> 속도 향상
    NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
    
-- 시퀀스 삭제
DROP SEQUENCE categrp_seq;

-- SQL 만들기 시작

-- INSERT
INSERT INTO categrp( categrpno, name, seqno, visible, rdate )
VALUES(categrp_seq.nextval, '국내 여행', 1, 'Y', sysdate);

INSERT INTO categrp( categrpno, name, seqno, visible, rdate )
VALUES(categrp_seq.nextval, '해외 여행', 2, 'Y', sysdate);

INSERT INTO categrp( categrpno, name, seqno, visible, rdate )
VALUES(categrp_seq.nextval, '개발 자료', 3, 'Y', sysdate);


-- LIST
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY categrpno ASC;

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 국내 여행                                                   1 Y 2020-04-17 04:49:18
         2 해외 여행                                                   2 Y 2020-04-17 04:49:18
         3 개발 자료                                                   3 Y 2020-04-17 04:49:18

-- READ
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
WHERE categrpno=1;


--UPDATE
--1번 레코드 이름 영화로 수정
UPDATE categrp 
SET name='영화' 
WHERE categrpno=1;

--1번 레코드 seqno 수정
UPDATE categrp 
SET seqno=10 
WHERE categrpno=1;

--1번 레코드 visible 수정
UPDATE categrp 
SET visible='N' 
WHERE categrpno=1;


--DELETE
DELETE FROM categrp
WHERE categrpno=1;

-- 레코드 개수
SELECT COUNT(*) as cnt
FROM categrp;


--INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
--VALUES((SELECT NVL(MAX(categrpno), 0)+1 as categrpno FROM categrp),
--  '영화', 1, 'Y', sysdate);
-- 
--INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
--VALUES((SELECT NVL(MAX(categrpno), 0)+1 as categrpno FROM categrp),
--  '여행', 2, 'Y', sysdate);
-- 
--INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
--VALUES((SELECT NVL(MAX(categrpno), 0)+1 as categrpno FROM categrp),
--  '캠핑', 3, 'Y', sysdate);


INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '영화', 1, 'Y', sysdate);
 
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '여행', 2, 'Y', sysdate);
 
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '캠핑', 3, 'Y', sysdate);

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 영화                                                        1 Y 2020-04-22 10:10:38
         2 여행                                                        2 Y 2020-04-22 10:10:38
         3 캠핑                                                        3 Y 2020-04-22 10:10:38




