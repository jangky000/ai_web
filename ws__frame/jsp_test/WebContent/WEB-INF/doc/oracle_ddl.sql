--1. 테이블 구조
-- 개발자 모드에서는 PURGE 설정 사용할 수 없다. 자동 PURGE
DROP TABLE itpay;
 
CREATE TABLE itpay(
    payno    NUMBER(7)   NOT NULL,   -- -9999999 ~ 9999999, 1부터 사용
    part       VARCHAR(20) NOT NULL,  -- 부서명
    sawon    VARCHAR(20) NOT NULL,  -- 사원명
    age       NUMBER(3)   NOT NULL,   -- 나이, 1 ~ 999
    address  VARCHAR(100) NULL,       -- 주소
    month    CHAR(6)     NOT NULL,    -- 급여달, 201905
    gdate     DATE        NOT NULL,     -- 수령일
    PRIMARY KEY(payno)
);
 
 
-- 2. 기초 데이터 추가
-- sysdate는 가감이 가능하다
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate)
VALUES(1, '개발팀', '가길동', 27, '성남시', '201901', sysdate);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate)
VALUES(2, '개발팀', '나길동', 30, '인천시', '201901', sysdate-5);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate)
VALUES(3, '객체설계팀', '다길동', 34, '성남시', '201901', sysdate-3);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate)
VALUES(4, '객체설계팀', '라길동', 36, '부천시', '201902', sysdate-1);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate)
VALUES(5, 'DB설계팀', '마길동', 38, '부천시', '201902', sysdate-0);
 
SELECT * FROM itpay;
-- PAYNO PART  SAWON AGE ADDRESS MONTH  GDATE
-- ----- ----- ----- --- ------- ------ ---------------------
--     1 개발팀   가길동    27 성남시     201901 2019-09-20 13:11:44.0
--     2 개발팀   나길동    30 인천시     201901 2019-09-15 13:11:45.0
--     3 객체설계팀 다길동    34 성남시     201901 2019-09-17 13:11:46.0
--     4 객체설계팀 라길동    36 부천시     201902 2019-09-19 13:11:47.0
--     5 DB설계팀 마길동    38 부천시     201902 2019-09-20 13:11:47.0

 
-- null 허용 컬럼 생략, address 컬럼 생략
INSERT INTO itpay(payno, part, sawon, age, month, gdate)
VALUES(6, '개발팀', '신길동', 33, '201904', sysdate+1);
 
SELECT * FROM itpay;
 
-- PAYNO PART  SAWON AGE ADDRESS MONTH  GDATE
-- ----- ----- ----- --- ------- ------ ---------------------
--     1 개발팀   가길동    27 성남시     201901 2019-09-20 13:11:44.0
--     2 개발팀   나길동    30 인천시     201901 2019-09-15 13:11:45.0
--     3 객체설계팀 다길동    34 성남시     201901 2019-09-17 13:11:46.0
--     4 객체설계팀 라길동    36 부천시     201902 2019-09-19 13:11:47.0
--     5 DB설계팀 마길동    38 부천시     201902 2019-09-20 13:11:47.0
--     6 개발팀   신길동    33 NULL    201904 2019-09-20 13:12:39.0

 
-- varchar(20) 저장할 수 있는 글자의 수는?
-- sawon   VARCHAR(10) NOT NULL,  -- 사원명
INSERT INTO itpay(payno, part, sawon, age, month, gdate)
VALUES(7, '개발팀', '1234567890', 33, '200804', sysdate);
 
INSERT INTO itpay(payno, part, sawon, age, month, gdate)
VALUES(8, '개발팀', 'ABCDEFGHIJ', 29, '200804', sysdate);
 
INSERT INTO itpay(payno, part, sawon, age, month, gdate)
VALUES(9, '개발팀', 'ABCDEFGHIJ123', 29, '200804', sysdate);
 
INSERT INTO itpay(payno, part, sawon, age, month, gdate)
VALUES(10, '개발팀', '가나다라마바사', 29, '200804', sysdate);
--오류 보고 -
--ORA-12899: value too large for column "AI6"."ITPAY"."SAWON" (actual: 21, maximum: 20)


--2. 컬럼 추가
ALTER TABLE itpay
ADD(test VARCHAR(9));

--테이블 상세 보기 명령
DESC itpay;

--3. 컬럼 속성 수정
ALTER TABLE itpay
MODIFY (test varchar(30));

DESC itpay;

--4. 컬럼명 수정
ALTER TABLE itpay
RENAME COLUMN test to test2;

DESC itpay;

--5. 컬럼 삭제
ALTER TABLE itpay
DROP COLUMN test2;

DESC itpay;

--6. 테이블 삭제
DROP TABLE itpay;

