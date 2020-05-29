[01] 테스트 데이터 생성

1. 테이블 구조
 
-- PURGE: 테이블 삭제 시 휴지통에 저장하지 않고 즉시 삭제
-- XE 개발자 버전은 지원 안함(RECYCLE 기능 지원X)
DROP TABLE itpay PURGE;
 
CREATE TABLE itpay(
    payno   NUMBER(7)   NOT NULL,  -- 1 ~ 9999999
    part    VARCHAR(20) NOT NULL,  -- 부서명
    sawon   VARCHAR(10) NOT NULL,  -- 사원명
    age     NUMBER(3)   NOT NULL,  -- 나이, 1 ~ 999
    address VARCHAR(50) NOT NULL,  -- 주소
    month   CHAR(6)     NOT NULL,  -- 급여달, 200805
    gdate   DATE        NOT NULL,  -- 수령일
    bonbong NUMBER(8)   DEFAULT 0, -- 본봉  
    tax     NUMBER(7, 2)   DEFAULT 0, -- 세금, 전체 자리, +-99999.99
    bonus   NUMBER(7)       NULL,  -- 보너스
    family  NUMBER(7)       NULL,  -- 가족 수당
    PRIMARY KEY(payno)
);
 
 
2. 기초 데이터 추가
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax, bonus)
VALUES(1, '디자인팀', '가길동', 27, '경기도 성남시',
       '200801', sysdate, 1530000, 12345.67, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax, bonus)
VALUES(2, '디자인팀', '나길동', 30, '인천시 계양구',
       '200801', sysdate-5, 1940000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax, bonus)
VALUES(3, '개발팀', '다길동', 34, '경기도 성남시',
       '200801', sysdate-3, 2890000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax, bonus)
VALUES(4, '개발팀', '라길동', 36, '경기도 부천시',
       '200802', sysdate-1, 4070000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax, bonus)
VALUES(5, 'DB설계팀', '마길동', 38, '경기도 부천시',
       '200802', sysdate-0, 2960000, 0, 0);
 
SELECT * FROM itpay;
 
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax, bonus)
VALUES(6, '기획설계팀', '바길동', 40, '서울시 강서구',
       '200802', sysdate-0, 3840000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax, bonus)
VALUES(7, '개발팀', '사길동', 42, '인천시 계양구',
       '200803', sysdate-0, 4230000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax, bonus)
VALUES(8, 'DB설계팀', '김길동', 42, '경기도 부천시',
       '200803', sysdate-1, 4010000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax, bonus)
VALUES(9, 'DB설계팀', '이길동', 42, '서울시 강서구',
       '200803', sysdate-1, 3500000, 0, 0);
 
SELECT * FROM itpay;
 
 
-- null 컬럼값 추가, 보너스 칼럼에 값이 없음
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax)
VALUES(10, '개발팀', '신길동', 33, '서울시 관악구',
       '200804', sysdate, 3500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax)
VALUES(11, '개발팀', '최길동', 31, '서울시 관악구',
       '200804', sysdate, 4500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax)
VALUES(12, '개발팀', '마길동', 29, '서울시 관악구',
       '200804', sysdate, 3200000, 0);
 
 
SELECT * FROM itpay;
 
 
2. 컬럼 추가
 
ALTER TABLE itpay
ADD (test VARCHAR2(9));
 
DESCRIBE itpay;
이름      널?       유형           
------- -------- ------------ 
PAYNO   NOT NULL NUMBER(7)    
PART    NOT NULL VARCHAR2(20) 
SAWON   NOT NULL VARCHAR2(10) 
AGE     NOT NULL NUMBER(3)    
ADDRESS NOT NULL VARCHAR2(50) 
MONTH   NOT NULL CHAR(6)      
GDATE   NOT NULL DATE         
BONBONG          NUMBER(8)    
TAX              NUMBER(7,2)  
BONUS            NUMBER(7)    
FAMILY           NUMBER(7)    
TEST             VARCHAR2(9)  

 
3. 컬럼 속성 수정
 
ALTER TABLE itpay
MODIFY (test VARCHAR2(30));
 
 
4. 컬럼명 수정
ALTER TABLE itpay
RENAME COLUMN test to test2;
 
 
5. 컬럼 삭제
ALTER TABLE itpay
DROP COLUMN test2;
 
 
6. 테이블 삭제
 
DROP TABLE itpay;
 
-- DROP TABLE itpay PURGE; -- 테이블 완전 삭제
 
 
7. 테이블 복구(XE 지원 안함)
FLASHBACK TABLE itpay TO BEFORE DROP;
 
SELECT * FROM itpay;
 
 
8. 휴지통 비우기
- 삭제된 테이블 완전 삭제, 복구 불가능
 
PURGE RECYCLEBIN;



[02] Single-Row Function(단일행 함수)
     - 레코드 단위로 함수가 적용 됩니다.
     - 테스트 데이터
     
          PAYNO PART                 SAWON             AGE ADDRESS                                            MONTH  GDATE                  BONBONG        TAX      BONUS     FAMILY
---------- -------------------- ---------- ---------- -------------------------------------------------- ------ ------------------- ---------- ---------- ---------- ----------
         1 디자인팀             가길동             27 경기도 성남시                                      200801 2019-12-27 11:56:58    1530000   12345.67          0           
         2 디자인팀             나길동             30 인천시 계양구                                      200801 2019-12-22 11:56:58    1940000          0          0           
         3 개발팀               다길동             34 경기도 성남시                                      200801 2019-12-24 11:56:58    2890000          0          0           
         4 개발팀               라길동             36 경기도 부천시                                      200802 2019-12-26 11:56:58    4070000          0          0           
         5 DB설계팀             마길동             38 경기도 부천시                                      200802 2019-12-27 11:56:58    2960000          0          0           

    
1. UPPER, LOWER
 
-- 소문자로 변경
SELECT payno, LOWER(part), sawon, age, address,
       month, gdate, bonbong, tax, bonus
FROM itpay
ORDER BY sawon ASC;

     PAYNO LOWER(PART)          SAWON             AGE ADDRESS                                            MONTH  GDATE                  BONBONG        TAX      BONUS
---------- -------------------- ---------- ---------- -------------------------------------------------- ------ ------------------- ---------- ---------- ----------
         1 디자인팀             가길동             27 경기도 성남시                                      200801 2020-05-29 10:12:06    1530000   12345.67          0
         8 db설계팀             김길동             42 경기도 부천시                                      200803 2020-05-28 10:12:54    4010000          0          0
         2 디자인팀             나길동             30 인천시 계양구                                      200801 2020-05-24 10:12:10    1940000          0          0
         3 개발팀               다길동             34 경기도 성남시                                      200801 2020-05-26 10:12:12    2890000          0          0
...

-- 대문자로 변경
SELECT payno, UPPER(part), sawon, age, address,
       month, gdate, bonbong, tax, bonus
FROM itpay
ORDER BY sawon ASC;
 
 
2. CONCAT(2개의 컬럼만 결합 가능)
SELECT payno, CONCAT(part, '-' || sawon) as name, age, address,
       month, gdate, bonbong, tax, bonus
FROM itpay
ORDER BY sawon ASC;

     PAYNO NAME                                   AGE ADDRESS                                            MONTH  GDATE                  BONBONG        TAX      BONUS
---------- ------------------------------- ---------- -------------------------------------------------- ------ ------------------- ---------- ---------- ----------
         1 디자인팀-가길동                         27 경기도 성남시                                      200801 2020-05-29 10:12:06    1530000   12345.67          0
         8 DB설계팀-김길동                         42 경기도 부천시                                      200803 2020-05-28 10:12:54    4010000          0          0
         2 디자인팀-나길동                         30 인천시 계양구                                      200801 2020-05-24 10:12:10    1940000          0          0
...
 
3. SUBSTR, index는 1부터 시작
-- 3번째 문자부터 출력
SELECT payno, SUBSTR(address, 3),
       month, gdate, bonbong, tax, bonus
FROM itpay
ORDER BY sawon ASC;

     PAYNO SUBSTR(ADDRESS,3)                                MONTH  GDATE                  BONBONG        TAX      BONUS
---------- ------------------------------------------------ ------ ------------------- ---------- ---------- ----------
         1 도 성남시                                        200801 2020-05-29 10:12:06    1530000   12345.67          0
         8 도 부천시                                        200803 2020-05-28 10:12:54    4010000          0          0
         2 시 계양구                                        200801 2020-05-24 10:12:10    1940000          0          0
...
 
-- 1번째 문자부터 3개의 문자 출력
SELECT payno, SUBSTR(address, 1, 3),
       month, gdate, bonbong, tax, bonus
FROM itpay
ORDER BY sawon ASC;
 
 
-- 2번째 기준 4개의 문자 출력 -> (경)기도 성(남시)
SELECT payno, SUBSTR(address, 2, 4),
       month, gdate, bonbong, tax, bonus
FROM itpay
ORDER BY sawon ASC;

     PAYNO SUBS MONTH  GDATE                  BONBONG        TAX      BONUS
---------- ---- ------ ------------------- ---------- ---------- ----------
         1 기도 성 200801 2020-05-29 10:12:06    1530000   12345.67          0
         8 기도 부 200803 2020-05-28 10:12:54    4010000          0          0
         2 천시 계 200801 2020-05-24 10:12:10    1940000          0          0
 ...    
 
4. LENGTH
 
SELECT payno, address, address,
       month, gdate, bonbong, tax, bonus
FROM itpay
ORDER BY sawon ASC;
 
-- 공백과 한글 모두 1자로 취급
SELECT payno, address, LENGTH(address) as len,
       month, gdate, bonbong, tax, bonus
FROM itpay
ORDER BY sawon ASC;

     PAYNO ADDRESS                                                   LEN MONTH  GDATE                  BONBONG        TAX      BONUS
---------- -------------------------------------------------- ---------- ------ ------------------- ---------- ---------- ----------
         1 경기도 성남시                                               7 200801 2020-05-29 10:12:06    1530000   12345.67          0
         8 경기도 부천시                                               7 200803 2020-05-28 10:12:54    4010000          0          0
         2 인천시 계양구                                               7 200801 2020-05-24 10:12:10    1940000          0          0
...
 
5. INSTR, index는 1부터 시작, 존재하지 않으면 0
-- 특정 문자의 위치를 반환
SELECT payno, address, INSTR(address, '천') as idx,
       month, gdate, bonbong, tax, bonus
FROM itpay
ORDER BY sawon ASC;

     PAYNO ADDRESS                                                   IDX MONTH  GDATE                  BONBONG        TAX      BONUS
---------- -------------------------------------------------- ---------- ------ ------------------- ---------- ---------- ----------
         1 경기도 성남시                                               0 200801 2020-05-29 10:12:06    1530000   12345.67          0
         8 경기도 부천시                                               6 200803 2020-05-28 10:12:54    4010000          0          0
         2 인천시 계양구                                               2 200801 2020-05-24 10:12:10    1940000          0          0
    

 
6. LPAD, RPAD 참고
-- 자리수를 맞춰줌, 10자리를 맞추려 왼쪽으로 0을 추가함
SELECT bonbong, LPAD(bonbong, 10, 0)
FROM itpay
ORDER BY sawon ASC;

   BONBONG LPAD(BONBO
---------- ----------
   1530000 0001530000
   4010000 0004010000
   1940000 0001940000
 
SELECT bonbong, RPAD(bonbong, 10, 0)
FROM itpay
ORDER BY sawon ASC;

  BONBONG RPAD(BONBO
---------- ----------
   1530000 1530000000
   4010000 4010000000
 
SELECT bonbong,LPAD(bonbong, 10, '*')
FROM itpay
ORDER BY sawon ASC;

   BONBONG LPAD(BONBO
---------- ----------
   1530000 ***1530000
   4010000 ***4010000
   1940000 ***1940000
 
7. REPLACE
-- REPLACE(컬럼명, 변경할 문자열, 최종 변경된 문자열)
SELECT payno, address, REPLACE(address, '계양구','남동구') as ADDR,
       month, gdate, bonbong, tax, bonus
FROM itpay
WHERE address LIKE '%인천%'
ORDER BY sawon ASC;
 
      PAYNO ADDRESS                                            ADDR                                                                                                                                                                                                                                                                                                                                                                                                                                                               MONTH  GDATE                  BONBONG        TAX      BONUS
---------- -------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ------ ------------------- ---------- ---------- ----------
         2 인천시 계양구                                      인천시 남동구                                                                                                                                                                                                                                                                                                                                                                                                                                                      200801 2020-05-24 10:12:10    1940000          0          0
         7 인천시 계양구                                      인천시 남동구         
 
8. ROUND
-- SQL 형식을 만들기 위한 시스템 테이블, --   MYSQL은 dual 생략 가능
SELECT * FROM dual; -- d라는 칼럼에 x값이 있다.

-- 소수 둘째 자리까지 반올림
SELECT ROUND(55.634, 2), ROUND(55.635, 2)
FROM dual;

ROUND(55.634,2) ROUND(55.635,2)
--------------- ---------------
          55.63           55.64

-- 정수 영역 반올림
-- -1: 1의 자리, -2: 10의 자리에서 반올림
-- 반올림 안됨
SELECT ROUND(23541, -1), ROUND(23541.25, -2)
FROM dual;

ROUND(23541,-1) ROUND(23541.25,-2)
--------------- ------------------
          23540              23500

-- 반올림됨.
SELECT ROUND(23551, -1), ROUND(23551.25, -2)
FROM dual;
 
 ROUND(23551,-1) ROUND(23551.25,-2)
--------------- ------------------
          23550              23600

9. TO_CHAR(): 날짜의 출력 및 비교
-- 현재 날짜 출력
SELECT sysdate FROM dual;

SYSDATE            
-------------------
2020-05-29 10:52:51

-- 2020-05-29일에 급여를 받는 사람 출력
SELECT gdate, SUBSTR(gdate, 1, 10) as rdate
FROM itpay;
GDATE               RDATE     
------------------- ----------
2020-05-29 10:13:18 2020-05-29
 
-- DB에서 커팅하면 원 데이터가 손상되기 때문에, 자바 개발자가 시분초가 필요할 때 사용할 수 없다.
-- 그래서 자바 어플리케이션 단에서 잘라서 사용할 수 있게 해주는 것이 중요하다.
SELECT gdate, TO_CHAR(gdate, 'yyyy-mm-dd') as rdate
FROM itpay;
 
 
-- 형식 적용
SELECT gdate, TO_CHAR(gdate, 'yyyy-mm-dd hh:mi:ss') as newgdate
FROM itpay;
 
 
SELECT * FROM itpay;
 
-- 날짜 검색 안됨
-- gdate는 년월일시분초 형식
SELECT payno, part, sawon, age, address,
       month, gdate, bonbong, tax, bonus
FROM itpay
WHERE gdate = '2020-05-29';
 
-- 날짜 검색 안됨
SELECT payno, part, sawon, age, address,
       month, gdate, bonbong, tax, bonus
FROM itpay
WHERE gdate = '20/05/29';
 
-- TO_CHAR() 함수를 통한 문자열 형변환
SELECT payno, part, sawon, age, address,
       month, gdate, bonbong, tax, bonus
FROM itpay
WHERE TO_CHAR(gdate, 'yyyy-mm-dd') = '2020-05-29';
 
-- 24시간 기준이면 hh24로 명시해줘야 함
SELECT payno, part, sawon, age, address,
       month, gdate, bonbong, tax, bonus
FROM itpay
WHERE TO_CHAR(gdate, 'yyyy-mm-dd hh24') = '2020-05-29 10';
--  WHERE TO_CHAR(gdate, 'yyyy-mm-dd hh24') = '2018-02-28 15';
  
10. 두 날짜 사이의 차 출력
    - sysdate+1: 오늘 날짜에 1일을 더함

SELECT sysdate + 1 FROM dual;

SYSDATE+1          
-------------------
2020-05-30 11:02:01

SELECT sysdate - 1 FROM dual;

SYSDATE-1          
-------------------
2020-05-28 11:02:15

SELECT MONTHS_BETWEEN(sysdate+1, sysdate) 
FROM dual;
MONTHS_BETWEEN(SYSDATE+1,SYSDATE)
---------------------------------
                      .0322580645

SELECT MONTHS_BETWEEN(sysdate+31, sysdate) 
FROM dual;

MONTHS_BETWEEN(SYSDATE+31,SYSDATE)
----------------------------------
                                 1
 
11. 월 더하기
SELECT ADD_MONTHS(sysdate, 1) FROM dual;
 
-- ADD_MONTHS(SYSDATE,
---------------------
--2020-06-29 11:04:02
 
12. 돌아오는 월요일의 날짜 출력
SELECT NEXT_DAY(sysdate, '월요일') as nextday FROM dual;

NEXTDAY            
-------------------
2020-06-01 11:05:04
 
13. 이번달의 마지막날 출력
SELECT LAST_DAY(sysdate) as lastday FROM dual;

LASTDAY            
-------------------
2020-05-31 11:05:53
 
14. TO_CHAR
SELECT TO_CHAR(sysdate, 'yyyy-mm-dd hh:mi:ss') 
FROM dual;

--TO_CHAR(SYSDATE,'YY
---------------------
--2020-05-29 11:06:28
 
SELECT TO_CHAR(sysdate, 'yyyy-mm-dd hh24:mi:ss') 
FROM dual;
 
-- TO_CHAR(SYSDATE,'YY
---------------------
--2020-05-29 11:06:41
 
-- 나머지 문자열 0으로 채움, 9: 숫자
SELECT TO_CHAR(1500, '0999999') FROM dual;

-- TO_CHAR(
----------
-- 0001500
 
-- 출력 형식보다 값이 크면 '# 출력
SELECT TO_CHAR(150000, '9,999') FROM dual;

TO_CHA
------
######
 
-- 천단위 구분자 출력
SELECT TO_CHAR(150000, '999,999') FROM dual;
-- 연산이 필요한 경우, 자바 개발자가 콤마를 빼는 작업을 해야 함
 
-- 부호 출력
SELECT TO_CHAR(150000, 'S999,999') FROM dual;
 
 TO_CHAR(
--------
+150,000
 
SELECT TO_CHAR(-150000, 'S999,999') FROM dual;
 
 TO_CHAR(
--------
-150,000
 
SELECT TO_CHAR(1500.55, '9,999.99') FROM dual;
 
 TO_CHAR(1
---------
 1,500.55
 
-- 소수점 자리수가 작으면 자동 반올림
SELECT TO_CHAR(1500.55, '9,999.9') FROM dual;
 
 TO_CHAR(
--------
 1,500.6
 
-- 소수점 자리수가 작으면 0으로 채워짐.
SELECT TO_CHAR(1500.5, '9,999.999') FROM dual;
 
 TO_CHAR(15
----------
 1,500.500
 
15 NVL 함수
SELECT payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus, family
FROM itpay;
 
 -- null 칼럼은 산술 연산을 해도 null임, 수당 못 받는 사람 발생, 에러가 발생하지도 않는다.
SELECT payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus+300000, family
FROM itpay;

        10 개발팀               신길동             33 서울시 관악구                                      200804 2020-05-29 10:13:18    3500000    (null)      0                        
        11 개발팀               최길동             31 서울시 관악구                                      200804 2020-05-29 10:13:18    4500000    (null)      0                        
        12 개발팀               마길동             29 서울시 관악구                                      200804 2020-05-29 10:13:18    3200000    (null)      0                        


-- null이 아니면 컬럼 값을 그대로 사용하나 
-- null이면 값을 0으로 변경
SELECT payno, part, sawon, age, address,
       month, gdate, bonbong, tax, 
       NVL(bonus, 0) + 500000 as bonus,
       NVL(family, 0) as family
FROM itpay;
 
 
16. TRUNC() 함수를 이용한 소수점 이하 삭제
 
-- 정수만 출력, 0의 자리까지 남김
SELECT tax, TRUNC(tax, 0) as tax
FROM itpay;
 
       TAX        TAX
---------- ----------
  12345.67      12345
         0          0
         0          0
 
-- 소수 첫째 자리만 출력, 반올림 안됨
SELECT tax, TRUNC(tax, 1) as tax
FROM itpay;
 
       TAX        TAX
---------- ----------
  12345.67    12345.6
         0          0
         0          0
 
-- 10의자리부터 출력, 1의자리 이하 삭제, 반올림 안됨
SELECT tax, TRUNC(tax, -1) as tax
FROM itpay;
 
        TAX        TAX
---------- ----------
  12345.67      12340
         0          0
         0          0
 
-- 함수의 중첩, 12,340
SELECT tax, TO_CHAR(TRUNC(tax, -1), '9,999,999') as tax
FROM itpay;
 
        TAX TAX       
---------- ----------
  12345.67     12,340
         0          0
         0          0
 
17. CASE 문
-- 개발팀은 본봉에 0.5% 보너스
-- DB설계팀 본봉에 0.4% 보너스
-- 디자인팀 본봉에 0.3% 보너스
-- 그 밖에는 10프로의 보너스
SELECT payno, part, sawon, age, address, month, gdate, bonbong, tax,
       CASE part WHEN '개발팀'     THEN bonbong*0.5
                      WHEN 'DB설계팀' THEN bonbong*0.4
                      WHEN '디자인팀' THEN bonbong*0.3
       ELSE bonbong*0.1 END bonus
FROM itpay;

--이렇게 가능하지만, 자바 개발에서 사용하기 힘든 패턴
-- 웹 사이트에서 직접 입력되어야 하고, %도 쉽게 바뀌기 때문

 
18. null 컬럼값의 검색
-- 데이터 준비
     PAYNO PART                 SAWON             AGE ADDRESS                                            MONTH  GDATE                  BONBONG        TAX      BONUS     FAMILY
---------- -------------------- ---------- ---------- -------------------------------------------------- ------ ------------------- ---------- ---------- ---------- ----------
        10 개발팀               신길동             33 서울시 관악구                                      200804 2019-12-27 12:55:54    3500000          0                      
        11 개발팀               최길동             31 서울시 관악구                                      200804 2019-12-27 12:55:54    4500000          0                      
        12 개발팀               마길동             29 서울시 관악구                                      200804 2019-12-27 12:55:54    3200000          0                      

SELECT payno, part, sawon, age, address,
       month, gdate, bonbong, tax, bonus,
       family
FROM itpay;
 
-- 인센티브를 받지 못하는 직원 출력, null 비교 안됨 -> IS NULL로 비교
SELECT payno, part, sawon, age, address,
       month, gdate, bonbong, tax, bonus,
       family
FROM itpay
WHERE bonus = null;
 
SELECT payno, part, sawon, age, address,
       month, gdate, bonbong, tax, bonus,
       family
FROM itpay
WHERE bonus is null;
 
-- 인센티브를 받지 못하는 직원의 수를 찾으려 했으나, 0 출력, 
--bonus 컬럼의 값 중에 null이 있으므로 null은 개수 인식 안됨 
SELECT COUNT(bonus) as cnt
FROM itpay
WHERE bonus is null;
 
        CNT
----------
         0
 
-- 인센티브를 받지 못하는 직원의 수 
SELECT COUNT(*) as cnt
FROM itpay
WHERE bonus is null;
 
       CNT
----------
        3
 