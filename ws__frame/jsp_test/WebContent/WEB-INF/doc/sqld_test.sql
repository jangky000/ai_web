DROP TABLE sqld_test;

CREATE TABLE sqld_test(
sqldid NUMBER(10) NOT NULL,
col1 NUMBER(10) CHECK (col1 < 5),
col2 NUMBER(10),
colstr VARCHAR(100),
PRIMARY KEY(sqldid)
);

-- 제약조건 변경
ALTER TABLE sqld_test 
ADD CONSTRAINT col1_check CHECK(col1 < 5);

-- 제약 조건 위배로 오류 발생
INSERT INTO sqld_test(sqldid, col1)
VALUES (1, 5);

-- NULL이지만 제약 조건 무시하고 그냥 삽입됨
INSERT INTO sqld_test(sqldid, col1)
VALUES (1, NULL);

SELECT * FROM sqld_test;

-- 모든 컬럼 입력 시 칼럼명 생략 가능
INSERT INTO sqld_test
VALUES (1, 1, 1, '1');

INSERT INTO sqld_test
VALUES (2, 2, 2, 'eng');

INSERT INTO sqld_test
VALUES (3, 3, 3, '한');

SELECT * FROM sqld_test ORDER BY colstr ASC;
SELECT * FROM sqld_test ORDER BY colstr DESC;

-- 복수 컬럼 정렬
INSERT INTO sqld_test(sqldid, col1, col2 )
VALUES (1, 1, 1);

INSERT INTO sqld_test(sqldid, col1, col2 )
VALUES (2, 1, 2);

INSERT INTO sqld_test(sqldid, col1, col2 )
VALUES (3, 2, 1);

INSERT INTO sqld_test(sqldid, col1, col2 )
VALUES (4, 2, 2);

SELECT * FROM sqld_test ORDER BY col1 ASC, col2 ASC;
-- SQLDID       COL1       COL2 COLSTR                                                                                              
------------ ---------- ---------- ----------------------------------------------------------------------------------------------------
--         1          1          1                                                                                                     
--         2          1          2                                                                                                     
--         3          2          1                                                                                                     
--         4          2          2   
SELECT * FROM sqld_test ORDER BY col1 ASC, col2 DESC;
--    SQLDID       COL1       COL2 COLSTR                                                                                              
------------ ---------- ---------- ----------------------------------------------------------------------------------------------------
--         2          1          2                                                                                                     
--         1          1          1                                                                                                     
--         4          2          2                                                                                                     
--         3          2          1         

SELECT * FROM sqld_test ORDER BY col2 ASC, col1 ASC;
--    SQLDID       COL1       COL2 COLSTR                                                                                              
------------ ---------- ---------- ----------------------------------------------------------------------------------------------------
--         1          1          1                                                                                                     
--         3          2          1                                                                                                     
--         2          1          2                                                                                                     
--         4          2          2               



-- COALESCE는 여러 expression 중에 NULL이 아닌 첫번째 값을 SELECT한다.
SELECT * FROM DUAL;
SELECT COALESCE(NULL, '2', '1') FROM DUAL;
SELECT COALESCE(colstr, '100', '200') FROM sqld_test;

-- NULL을 1로 대체
SELECT NVL(NULL, 1) FROM DUAL;

--에러 expression은 2개까지만 가능
SELECT NVL(NULL, NULL, 1) FROM DUAL;

 
-- 외래키 추가하기, 참조키 생성시엔 제약조건을 명시 하는걸 권고하고 있다 https://namsieon.com/36
DROP TABLE emp;

CREATE TABLE emp(
    col1 NUMBER(5),
    col2 NUMBER(5),
    PRIMARY KEY(col1)
);

DROP TABLE dept;

CREATE TABLE dept(
    deptno NUMBER(5),
    PRIMARY KEY(deptno)
);

ALTER TABLE emp ADD( fk_dept NUMBER(5) );
ALTER TABLE emp ADD CONSTRAINT dept_deptno_fk FOREIGN KEY(fk_dept) REFERENCES dept(deptno);

DESC emp;

DROP TABLE table1;

CREATE TABLE table1(
 a VARCHAR(30),
 b VARCHAR(30)
);

INSERT INTO table1 VALUES('사과', '바나나');
INSERT INTO table1 VALUES('멜론', '딸기');

DROP TABLE table2;

CREATE TABLE table2(
    a VARCHAR(30),
    b VARCHAR(30)
);

INSERT INTO table2 VALUES('오렌지', '파인애플');
INSERT INTO table2 VALUES('한라봉', '체리');

SELECT * FROM table1, table2 WHERE table1.a (+)=table2.a;
A                              B                              A                              B                             
------------------------------ ------------------------------ ------------------------------ ------------------------------
                                                              오렌지                         파인애플                      
                                                              한라봉                         체리                          
            

SELECT * FROM table1, table2 WHERE table2.a (+)=table1.a;
A                              B                              A                              B                             
------------------------------ ------------------------------ ------------------------------ ------------------------------
사과                           바나나                                                                                      
멜론                           딸기                                                                                                  


SELECT *  /*+ use_hash(e d) */
FROM table1 e, table2 d;

A                              B                              A                              B                             
------------------------------ ------------------------------ ------------------------------ ------------------------------
사과                           바나나                         오렌지                         파인애플                      
사과                           바나나                         한라봉                         체리                          
멜론                           딸기                           오렌지                         파인애플                      
멜론                           딸기                           한라봉                         체리           


SELECT * FROM table1 CROSS JOIN table2;
A                              B                              A                              B                             
------------------------------ ------------------------------ ------------------------------ ------------------------------
사과                           바나나                         오렌지                         파인애플                      
사과                           바나나                         한라봉                         체리                          
멜론                           딸기                           오렌지                         파인애플                      
멜론                           딸기                           한라봉                         체리                


DROP TABLE table3;

CREATE TABLE table3(
    deptno NUMBER(10),
    job VARCHAR(30),
    sal NUMBER(10)
);

INSERT INTO table3 VALUES(1000, 'CLERK', 100);
INSERT INTO table3 VALUES(1001, 'SALESMAN', 100);
INSERT INTO table3 VALUES(1001, 'president', 100);
INSERT INTO table3 VALUES(1002, 'manager', 100);
INSERT INTO table3 VALUES(1003, 'CLERK', 100);
INSERT INTO table3 VALUES(1000, 'manager', 100);
INSERT INTO table3 VALUES(1000, 'president', 100);

SELECT deptno, job, sum(sal)
FROM table3
GROUP BY GROUPING SETS (deptno, job );
    DEPTNO JOB                              SUM(SAL)
---------- ------------------------------ ----------
      1000                                       300
      1003                                       100
      1001                                       200
      1002                                       100
           CLERK                                 200
           SALESMAN                              100
           president                             200
           manager                               200

SELECT deptno, job, sum(sal)
FROM table3
GROUP BY CUBE (deptno, job );
    DEPTNO JOB                              SUM(SAL)
---------- ------------------------------ ----------
                                                 700
           CLERK                                 200
           manager                               200
           SALESMAN                              100
           president                             200
      1000                                       300
      1000 CLERK                                 100
      1000 manager                               100
      1000 president                             100
      1001                                       200
      1001 SALESMAN                              100
      1001 president                             100
      1002                                       100
      1002 manager                               100
      1003                                       100
      1003 CLERK                                 100
      
      
-- 총합
SELECT deptno, job, sal, sum(sal) OVER (ORDER BY sal ROWS BETWEEN unbounded preceding AND unbounded following) totsal
FROM table3;      
      
      
-- 누계
SELECT deptno, job, sal, sum(sal) OVER (ORDER BY sal ROWS BETWEEN unbounded preceding AND current row) totsal
FROM table3;
    DEPTNO JOB                                   SAL     TOTSAL
---------- ------------------------------ ---------- ----------
      1000 CLERK                                 100        100
      1001 SALESMAN                              100        200
      1001 president                             100        300
      1000 president                             100        400
      1003 CLERK                                 100        500
      1000 manager                               100        600
      1002 manager                               100        700


SELECT deptno, job, sal, 
RANK() OVER (ORDER BY sal DESC) all_rank, 
RANK() OVER (PARTITION BY job ORDER BY sal DESC) job_rank
FROM table3;


SELECT * FROM DUAL WHERE null = null;

SELECT * from sql1 where rownum = 1;

SELECT * from sql2 WHERE rownum > 0;


DROP TABLE student;
CREATE TABLE student(
sno NUMBER(10) PRIMARY KEY,
sname VARCHAR2(100),
address VARCHAR2(100),
score NUMBER(10),
dept NUMBER(10),
CONSTRAINT dept_fk FOREIGN KEY(dept) REFERENCES department(dno)
);

INSERT INTO student VALUES(01, '홍길동', '서울', 80, 100);
INSERT INTO student VALUES(02, '김철수', '대전', 90, 200);
INSERT INTO student VALUES(03, '이순자', '강릉', 90, 100);
INSERT INTO student VALUES(04, '이원영', '부산', 95, 200);
INSERT INTO student VALUES(05, '홍남순', '서울', 65, 300);
INSERT INTO student VALUES(06, '이름', '지역', null, null);

DROP TABLE department;
CREATE TABLE department(
dno NUMBER(10) PRIMARY KEY,
dname VARCHAR2(100),
manager VARCHAR2(100)
);

INSERT INTO department VALUES(100, '정통', '이순신');
INSERT INTO department VALUES(200, '전자', '강감찬');
INSERT INTO department VALUES(300, '기계', '김유신');

SELECT * FROM student s, department d WHERE s.dept > 100;

SELECT * FROM student;

SELECT count(*) FROM student;
SELECT count(*) FROM student WHERE score >=10 or score<10;

SELECT score, count(score) FROM student;


SELECT NEXT_DAY(ADD_MONTH(sysdate, 6), '월요일') FROM DUAL;