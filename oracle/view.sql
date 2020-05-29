1. 기본적인 View의 생성
 
1) 테이블 구조
DROP TABLE test PURGE;
 
CREATE TABLE test(
    testno NUMBER(5)   NOT NULL, -- 일련번호
    name   VARCHAR(30) NOT NULL, -- 성명
    mat    NUMBER(3)   NOT NULL, -- 수학
    eng    NUMBER(3)   NOT NULL, -- 영어
    tot    NUMBER(3)       NULL, -- 총점
    avg    NUMBER(4, 1)    NULL, -- 평균
    PRIMARY KEY (testno) 
);
 
DELETE FROM test;
 
 
 
2) 기초 데이터 추가
 
INSERT INTO test(testno, name, mat, eng)
VALUES((SELECT NVL(MAX(testno), 0)+1 as cnt FROM test),    
    '피어스 브러스넌', 80, 100
);
 
INSERT INTO test(testno, name, mat, eng)
VALUES((SELECT NVL(MAX(testno), 0)+1 as cnt FROM test),    
    '메릴스트립', 80, 100
);
 
INSERT INTO test(testno, name, mat, eng)
VALUES((SELECT NVL(MAX(testno), 0)+1 as cnt FROM test),    
    '사이프리드', 85, 80
);
 
INSERT INTO test(testno, name, mat, eng)
VALUES((SELECT NVL(MAX(testno), 0)+1 as cnt FROM test),    
    '콜린퍼스', 65, 60
);
 
INSERT INTO test(testno, name, mat, eng)
VALUES((SELECT NVL(MAX(testno), 0)+1 as cnt FROM test),    
    '스텔란 스카스가드', 75, 70
);
 
 SELECT * FROM test;
 
     TESTNO NAME                                  MAT        ENG        TOT        AVG
---------- ------------------------------ ---------- ---------- ---------- ----------
         1 피어스 브러스넌                        80        100        
         2 메릴스트립                             80        100        
         3 사이프리드                             85         80        
         4 콜린퍼스                               65         60        
         5 스텔란 스카스가드                      75         70       
 
 -- 업데이트에서 칼럼을 사용하여 바로 연산 + 저장할 수 있다.
UPDATE test SET tot = mat+eng;
UPDATE test SET avg = tot/2;
 
SELECT * FROM test;
 
     TESTNO NAME                                  MAT        ENG        TOT        AVG
---------- ------------------------------ ---------- ---------- ---------- ----------
         1 피어스 브러스넌                        80        100        180         90
         2 메릴스트립                             80        100        180         90
         3 사이프리드                             85         80        165       82.5
         4 콜린퍼스                               65         60        125       62.5
         5 스텔란 스카스가드                      75         70        145       72.5
 
3) VIEW의 생성
-- 우수생 목록
DROP VIEW vtest_90;
 
CREATE VIEW vtest_90
AS 
SELECT testno, name, mat, eng, tot, avg
FROM test
WHERE avg >= 90;
 
SELECT * FROM tab;
-- TNAME                          TABTYPE  CLUSTERID
-------------------------------- ------- ----------
--USER_COUPON                    TABLE             
--VTEST_90                       VIEW    
 
-- View 사용, 평균 90점 이상인 사원 출력
SELECT testno, name, mat, eng, tot, avg FROM vtest_90;
--    TESTNO NAME                                  MAT        ENG        TOT        AVG
------------ ------------------------------ ---------- ---------- ---------- ----------
--         1 피어스 브러스넌                        80        100        180         90
--         2 메릴스트립                             80        100        180         90 

-- SELECT READ에서만 쓰는 것을 권장
-- 자바 개발자가 개발하기에 아주 쉬워진다.

2. 일부 컬럼만 View의 대상으로 지정
 
DROP VIEW vtest_80;
 
CREATE VIEW vtest_80
AS 
SELECT testno, name, tot, avg
FROM test
WHERE avg >= 80;
 
-- View에 만들어진 컬럼만(mat, eng은 제외) 출력됨.
SELECT * FROM vtest_80; 
SELECT testno, name, tot, avg FROM vtest_80; 
--     TESTNO NAME                                  TOT        AVG
------------ ------------------------------ ---------- ----------
--         1 피어스 브러스넌                       180         90
--         2 메릴스트립                            180         90
--         3 사이프리드                            165       82.5
 
 
-- ERROR, View에 없는 컬럼(mat, eng) 접근 못함.
SELECT testno, name, mat, eng, tot, avg FROM vtest_80; 
 
 -- 뷰의 수정, 변경 create or replace
3. ()안의 컬럼은 생성되는 View의 컬럼의 별명입니다.
- 실제 컬럼명이 감추어짐.
CREATE OR REPLACE VIEW vtest_70(
    hakbun, student_name, total, average
)
AS 
SELECT testno, name, tot, avg
FROM test
WHERE avg >= 70;
 
SELECT * FROM vtest_70;
--     HAKBUN STUDENT_NAME                        TOTAL    AVERAGE
------------ ------------------------------ ---------- ----------
--         1 피어스 브러스넌                       180         90
--         2 메릴스트립                            180         90
--         3 사이프리드                            165       82.5
--         5 스텔란 스카스가드                     145       72.5
 
-- 함수를 이용해 바로 뷰 생성
4. 함수를 이용한 View의 생성
CREATE OR REPLACE VIEW vtest_func(
    max_total, min_total, avg_total
)
AS 
SELECT MAX(tot), MIN(tot), AVG(tot) 
FROM test;
   
 
SELECT * FROM vtest_func;
SELECT max_total, min_total, avg_total FROM vtest_func;
--  MAX_TOTAL  MIN_TOTAL  AVG_TOTAL
------------ ---------- ----------
--       180        125        159
 
5. WITH CHECK OPTION 
   - WHERE문에 명시한 컬럼의 값을 변경 할 수 없습니다.
 
1) 실습용 테이블
DROP TABLE employee;
 
CREATE TABLE employee(
    name          varchar(10) not null,
    salary        number(7)   not null,
    department_id number(4)   not null
);
 
INSERT INTO employee(name, salary,department_id)
VALUES('aaa', 1000000, 20);
INSERT INTO employee(name, salary,department_id)
VALUES('bbb', 1100000, 20);
INSERT INTO employee(name, salary,department_id)
VALUES('ccc', 1200000, 20);
INSERT INTO employee(name, salary,department_id)
VALUES('ddd', 1300000, 30);
INSERT INTO employee(name, salary,department_id)
VALUES('eee', 1400000, 40);
 
SELECT * FROM employee;
NAME           SALARY DEPARTMENT_ID
---------- ---------- -------------
aaa           1000000            20
bbb           1100000            20
ccc           1200000            20
ddd           1300000            30
eee           1400000            40
 
COMMIT;
 
2) WITH CHECK OPTION 사용하지 않은 경우
CREATE OR REPLACE VIEW vemp20
AS 
SELECT *
FROM employee
WHERE department_id=20;
 
SELECT * FROM vemp20;
NAME           SALARY DEPARTMENT_ID
---------- ---------- -------------
aaa           1000000            20
bbb           1100000            20
ccc           1200000            20
 
-- vemp20은 20번 부서만 작업 대상으로 하나
-- WHERE문에 나타난 부서를 30번으로 변경함으로 논리적 에러가
-- 발생합니다.
-- View를 이용한 UPDATE는 권장이 아닙니다.
UPDATE vemp20 SET department_id=30;
 
-- 부서가 모두 30번으로 변경되어 결과가 없습니다.
SELECT * FROM vemp20;
-- 선택된 행 없음
 
SELECT * FROM employee;
AME           SALARY DEPARTMENT_ID
---------- ---------- -------------
aaa           1000000            30
bbb           1100000            30
ccc           1200000            30
ddd           1300000            30
eee           1400000            40
 
-- INSERT, DELETE, UPDATE 실행 취소
ROLLBACK;
 
SELECT * FROM employee;
NAME           SALARY DEPARTMENT_ID
---------- ---------- -------------
aaa           1000000            20
bbb           1100000            20
ccc           1200000            20
ddd           1300000            30
eee           1400000            40
 
 
 
3) WITH CHECK OPTION을 사용한 경우
-- WHERE 문에 들어간 값만 못 바꾸게 함
CREATE VIEW vemp_c20
AS 
SELECT *
FROM employee
WHERE department_id=20
WITH CHECK OPTION CONSTRAINT vemp_c20_ck;
   
SELECT * FROM vemp_c20;
NAME           SALARY DEPARTMENT_ID
---------- ---------- -------------
aaa           1000000            20
bbb           1100000            20
ccc           1200000            20
 
-- UPDATE가 금지되어 실행이 안됩니다. UPDATE를 실행하고자 할 경우는
-- 실제의 테이블을 대상으로 합니다.
-- SQL 오류: ORA-01402: view WITH CHECK OPTION where-clause violation
-- 01402. 00000 -  "view WITH CHECK OPTION where-clause violation"
UPDATE vemp_c20 SET department_id=30;
 
UPDATE vemp_c20 SET salary = 5000000 WHERE name = 'ccc';
 
SELECT * FROM vemp_c20;
-- NAME           SALARY DEPARTMENT_ID
------------ ---------- -------------
--aaa           1000000            20
--bbb           1100000            20
--ccc           5000000            20
 
SELECT * FROM employee;
--NAME           SALARY DEPARTMENT_ID
------------ ---------- -------------
--aaa           1000000            20
--bbb           1100000            20
--ccc           5000000            20
--ddd           1300000            30
--eee           1400000            40
 
ROLLBACK;


SELECT * FROM employee;
롤백 완료.
NAME           SALARY DEPARTMENT_ID
---------- ---------- -------------
aaa           1000000            20
bbb           1100000            20
ccc           1200000            20
ddd           1300000            30
eee           1400000            40
 
  
6. WITH READ ONLY 옵션
  - View에서 UPDATE, INSERT, DELETE 기능을 금지시킵니다.
 
CREATE VIEW test_read(num, name, total)
AS 
SELECT testno, name, tot
FROM test
WHERE tot >= 60
WITH READ ONLY;
 
 
SELECT * FROM test_read;
 
 -- 에러, 삽입 불가
INSERT INTO test_read(num,
    name, total)
VALUES((SELECT NVL(MAX(testno), 0)+1 as cnt FROM test),    
    '줄리 월터스', 150
);
 
-- SQL 오류: ORA-42399: cannot perform a DML operation on a read-only view
-- 42399.0000 - "cannot perform a DML operation on a read-only view"
UPDATE test_read SET total = 200;
 
 
※ VIEW는 INSERT, UPDATE, DELETE에는 사용을 권장하지 않습니다.
 
 
7. FROM 절에 기록된 Subquery는 INLINE VIEW라고 해서
   SQL 내부에 포함된 임시 VIEW라고 부릅니다.
   - Top-n Analysis에서 많이 사용( == 페이징)
   
 
1) 레코드 정렬
 
SELECT testno, name, mat, eng, tot, avg
FROM test
ORDER BY testno DESC;
 
2) rownum 산출
SELECT testno, name, mat, eng, tot, avg, rownum r
FROM(
    SELECT testno, name, mat, eng, tot, avg -- Inline View
    FROM test
    ORDER BY testno DESC
);
   
3) record 분할
SELECT testno, name, mat, eng, tot, avg, r
FROM(
    SELECT testno, name, mat, eng, tot, avg, rownum as r
    FROM(
        SELECT testno, name, mat, eng, tot, avg -- Inline View
        FROM test
        ORDER BY testno DESC
    )
)
WHERE r > =1 AND r <= 3;
 
SELECT testno, name, mat, eng, tot, avg, r
FROM(
    SELECT testno, name, mat, eng, tot, avg, rownum as r
    FROM(
        SELECT testno, name, mat, eng, tot, avg -- Inline View
        FROM test
        ORDER BY testno DESC
    )
)
WHERE r > =4 AND r <= 6;
 
 
4) 검색
SELECT testno, name, mat, eng, tot, avg, r
FROM(
    SELECT testno, name, mat, eng, tot, avg, rownum as r
    FROM(
        SELECT testno, name, mat, eng, tot, avg -- Inline View
        FROM test
        WHERE name LIKE '%메릴%'
        ORDER BY testno DESC
    )
)
WHERE r > =1 AND r <= 3;
 
5) Subquery의 View 생성
 
CREATE OR REPLACE VIEW v_test_list
AS
SELECT testno, name, mat, eng, tot, avg -- Inline View
FROM test
ORDER BY testno DESC;
 
6) Subquery의 View의 사용
 -- 뷰를 생성함으로 인해 검색이나 페이징이 간단해진다
 -- 3단 쿼리가 2단 쿼리로 줄어들 수 있다 -> 그러면 코드를 보기에 편해진다.
 -- 페이징을 할때 3단 구성이기 때문에, 뷰를 사용하는 것이 좋다. 
 
SELECT testno, name, mat, eng, tot, avg, rownum r
FROM v_test_list;
 
SELECT testno, name, mat, eng, tot, avg, r
FROM (
    SELECT testno, name, mat, eng, tot, avg, rownum r
    FROM v_test_list
)
WHERE r > =1 AND r <= 3;
 
 
SELECT testno, name, mat, eng, tot, avg, r
FROM (
    SELECT testno, name, mat, eng, tot, avg, rownum r
    FROM v_test_list
)
WHERE r > = 4 AND r <= 6;
 
-- 검색
SELECT testno, name, mat, eng, tot, avg, r
FROM (
    SELECT testno, name, mat, eng, tot, avg, rownum r
    FROM v_test_list
    WHERE name LIKE '%메릴%'
)
WHERE r > = 1 AND r <= 3;
 
 
 