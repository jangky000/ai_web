1) 테이블 구조 생성
-- parent table
DROP TABLE employee;
 
CREATE TABLE employee(
  employeeno NUMBER(7) NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);
 
INSERT INTO employee(employeeno, name)
VALUES((SELECT NVL(MAX(employeeno), 0)+1 as employeeno FROM employee), '아로미');
 
INSERT INTO employee(employeeno, name)
VALUES((SELECT NVL(MAX(employeeno), 0)+1 as employeeno FROM employee), '왕눈이');
 
SELECT employeeno, name FROM employee;
 
 EMPLOYEENO NAME
 ---------- ----
          1 아로미
          2 왕눈이
 
-- child table
CREATE TABLE sungjuk(
  sungjukno NUMBER(7) NOT NULL PRIMARY KEY,
  subject     VARCHAR(30) NOT NULL,
  score       NUMBER(7) DEFAULT 0,
  employeeno NUMBER(7) NOT NULL,
  FOREIGN KEY (employeeno) REFERENCES employee (employeeno)
);
 
INSERT INTO sungjuk(sungjukno, subject, score, employeeno)
VALUES((SELECT NVL(MAX(sungjukno), 0)+1 as sungjukno FROM sungjuk), 
            'JAVA', 90, 1);
INSERT INTO sungjuk(sungjukno, subject, score, employeeno)
VALUES((SELECT NVL(MAX(sungjukno), 0)+1 as sungjukno FROM sungjuk), 
            'JSP', 75, 1);
INSERT INTO sungjuk(sungjukno, subject, score, employeeno)
VALUES((SELECT NVL(MAX(sungjukno), 0)+1 as sungjukno FROM sungjuk), 
            'JAVA', 80, 2);
INSERT INTO sungjuk(sungjukno, subject, score, employeeno)
VALUES((SELECT NVL(MAX(sungjukno), 0)+1 as sungjukno FROM sungjuk), 
            'JSP', 65, 2);        
            
SELECT employeeno, sungjukno, subject, score 
FROM sungjuk
ORDER BY employeeno, subject;
 
 EMPLOYEENO SUNGJUKNO SUBJECT SCORE
 ---------- --------- ------- -----
          1         1 JAVA       90
          1         2 JSP        75
          2         3 JAVA       80
          2         4 JSP        65
 
         
2) 제약조건 조회(대소문자 주의)
- CONSTRAINT_TYPE: P: Primary Key, R: Foreign Key, C: Not NULL
SELECT * FROM  ALL_CONSTRAINTS
WHERE  TABLE_NAME = 'SUNGJUK';
 
 OWNER CONSTRAINT_NAME CONSTRAINT_TYPE TABLE_NAME SEARCH_CONDITION         R_OWNER R_CONSTRAINT_NAME DELETE_RULE STATUS  DEFERRABLE     DEFERRED  VALIDATED GENERATED      BAD  RELY LAST_CHANGE           INDEX_OWNER INDEX_NAME  INVALID VIEW_RELATED
 ----- --------------- --------------- ---------- ------------------------ ------- ----------------- ----------- ------- -------------- --------- --------- -------------- ---- ---- --------------------- ----------- ----------- ------- ------------
 AI  SYS_C007193     R               SUNGJUK    NULL                     KOR1    SYS_C007188       NO ACTION   ENABLED NOT DEFERRABLE IMMEDIATE VALIDATED GENERATED NAME NULL NULL 2018-02-28 12:19:11.0 NULL        NULL        NULL    NULL
 AI  SYS_C007189     C               SUNGJUK    "SUNGJUKNO" IS NOT NULL  NULL    NULL              NULL        ENABLED NOT DEFERRABLE IMMEDIATE VALIDATED GENERATED NAME NULL NULL 2018-02-28 12:19:11.0 NULL        NULL        NULL    NULL
 AI  SYS_C007190     C               SUNGJUK    "SUBJECT" IS NOT NULL    NULL    NULL              NULL        ENABLED NOT DEFERRABLE IMMEDIATE VALIDATED GENERATED NAME NULL NULL 2018-02-28 12:19:11.0 NULL        NULL        NULL    NULL
 AI  SYS_C007191     C               SUNGJUK    "EMPLOYEENO" IS NOT NULL NULL    NULL              NULL        ENABLED NOT DEFERRABLE IMMEDIATE VALIDATED GENERATED NAME NULL NULL 2018-02-28 12:19:11.0 NULL        NULL        NULL    NULL
 AI  SYS_C007192     P               SUNGJUK    NULL                     NULL    NULL              NULL        ENABLED NOT DEFERRABLE IMMEDIATE VALIDATED GENERATED NAME NULL NULL 2018-02-28 12:19:11.0 NULL        SYS_C007192 NULL    NULL
 
  
3) 제약 조건이 선언되지 않은 테이블
-- parent table
DROP TABLE sungjuk;
DROP TABLE employee;
 
CREATE TABLE employee(
  employeeno NUMBER(7) NOT NULL,
  name VARCHAR(30) NOT NULL
);
 
-- child table
DROP TABLE sungjuk;
 
CREATE TABLE sungjuk(
  sungjukno NUMBER(7) NOT NULL,
  subject     VARCHAR(30) NOT NULL,
  score       NUMBER(7) DEFAULT 0,
  employeeno NUMBER(7) NOT NULL
);
 
 -- 없던 제약조건을 추가하기
4) PK 제약조건 추가
ALTER TABLE employee ADD PRIMARY KEY (employeeno);
 
-- 제약조건 조회(대소문자 주의)
SELECT * FROM ALL_CONSTRAINTS
WHERE  TABLE_NAME = 'EMPLOYEE';
 
 OWNER CONSTRAINT_NAME CONSTRAINT_TYPE TABLE_NAME SEARCH_CONDITION         R_OWNER R_CONSTRAINT_NAME DELETE_RULE STATUS  DEFERRABLE     DEFERRED  VALIDATED GENERATED      BAD  RELY LAST_CHANGE           INDEX_OWNER INDEX_NAME  INVALID VIEW_RELATED
 ----- --------------- --------------- ---------- ------------------------ ------- ----------------- ----------- ------- -------------- --------- --------- -------------- ---- ---- --------------------- ----------- ----------- ------- ------------
 AI  SYS_C007201     C               EMPLOYEE   "EMPLOYEENO" IS NOT NULL NULL    NULL              NULL        ENABLED NOT DEFERRABLE IMMEDIATE VALIDATED GENERATED NAME NULL NULL 2018-02-28 12:38:56.0 NULL        NULL        NULL    NULL
 AI  SYS_C007202     C               EMPLOYEE   "NAME" IS NOT NULL       NULL    NULL              NULL        ENABLED NOT DEFERRABLE IMMEDIATE VALIDATED GENERATED NAME NULL NULL 2018-02-28 12:38:56.0 NULL        NULL        NULL    NULL
 AI  SYS_C007203     P               EMPLOYEE   NULL                     NULL    NULL              NULL        ENABLED NOT DEFERRABLE IMMEDIATE VALIDATED GENERATED NAME NULL NULL 2018-02-28 12:39:58.0 NULL        SYS_C007203 NULL    NULL
 
-- 테이블의 PK 제약조건 삭제
ALTER TABLE employee DROP PRIMARY KEY;
 
-- 제약조건 조회(대소문자 주의)
SELECT * FROM ALL_CONSTRAINTS
WHERE  TABLE_NAME = 'EMPLOYEE';
 
OWNER                          CONSTRAINT_NAME                C TABLE_NAME                     SEARCH_CONDITION                                                                 R_OWNER                        R_CONSTRAINT_NAME              DELETE_RU STATUS   DEFERRABLE     DEFERRED  VALIDATED     GENERATED      BAD RELY LAST_CHANGE INDEX_OWNER                    INDEX_NAME                     INVALID VIEW_RELATED 
------------------------------ ------------------------------ - ------------------------------ -------------------------------------------------------------------------------- ------------------------------ ------------------------------ --------- -------- -------------- --------- ------------- -------------- --- ---- ----------- ------------------------------ ------------------------------ ------- --------------
AI                           SYS_C007276                    C EMPLOYEE                       "EMPLOYEENO" IS NOT NULL                                                                         ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          18/02/28                                                                                        
AI                           SYS_C007277                    C EMPLOYEE                       "NAME" IS NOT NULL                                                                         ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          18/02/28                                                                                        
 
 
5) PK 제약조건 추가(제약조건명 지정), 제약 조건 이름을 확인하고 처리하기가 쉬움.
ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY (employeeno);
 
-- 제약조건 조회(대소문자 주의)
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'EMPLOYEE';
 
 OWNER CONSTRAINT_NAME CONSTRAINT_TYPE TABLE_NAME SEARCH_CONDITION         R_OWNER R_CONSTRAINT_NAME DELETE_RULE STATUS  DEFERRABLE     DEFERRED  VALIDATED GENERATED      BAD  RELY LAST_CHANGE           INDEX_OWNER INDEX_NAME  INVALID VIEW_RELATED
 ----- --------------- --------------- ---------- ------------------------ ------- ----------------- ----------- ------- -------------- --------- --------- -------------- ---- ---- --------------------- ----------- ----------- ------- ------------
 AI  SYS_C007201     C               EMPLOYEE   "EMPLOYEENO" IS NOT NULL NULL    NULL              NULL        ENABLED NOT DEFERRABLE IMMEDIATE VALIDATED GENERATED NAME NULL NULL 2018-02-28 12:38:56.0 NULL        NULL        NULL    NULL
 AI  SYS_C007202     C               EMPLOYEE   "NAME" IS NOT NULL       NULL    NULL              NULL        ENABLED NOT DEFERRABLE IMMEDIATE VALIDATED GENERATED NAME NULL NULL 2018-02-28 12:38:56.0 NULL        NULL        NULL    NULL
 AI  EMPLOYEE_PK    P               EMPLOYEE   NULL                     NULL    NULL              NULL        ENABLED NOT DEFERRABLE IMMEDIATE VALIDATED USER NAME      NULL NULL 2018-02-28 12:42:22.0 NULL        EMPLOYEE_PK NULL    NULL
 
 
6) FK 제약조건 추가
ALTER TABLE sungjuk ADD CONSTRAINT sungjuk_fk FOREIGN KEY(employeeno) 
REFERENCES employee(employeeno);
 
-- 제약조건 조회(대소문자 주의)
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'SUNGJUK';
 
OWNER                          CONSTRAINT_NAME                C TABLE_NAME                     SEARCH_CONDITION                                                                 R_OWNER                        R_CONSTRAINT_NAME              DELETE_RU STATUS   DEFERRABLE     DEFERRED  VALIDATED     GENERATED      BAD RELY LAST_CHANGE INDEX_OWNER                    INDEX_NAME                     INVALID VIEW_RELATED 
------------------------------ ------------------------------ - ------------------------------ -------------------------------------------------------------------------------- ------------------------------ ------------------------------ --------- -------- -------------- --------- ------------- -------------- --- ---- ----------- ------------------------------ ------------------------------ ------- --------------
AI                           SUNGJUK_FK                     R SUNGJUK                         KOR1                           EMPLOYEE_PK                    NO ACTION ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               18/02/28                                                                                        
AI                           SYS_C007278                    C SUNGJUK                        "SUNGJUKNO" IS NOT NULL                                                                         ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          18/02/28                                                                                        
AI                           SYS_C007279                    C SUNGJUK                        "SUBJECT" IS NOT NULL                                                                         ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          18/02/28                                                                                        
AI                           SYS_C007280                    C SUNGJUK                        "EMPLOYEENO" IS NOT NULL                                                                         ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          18/02/28                                                                                        

 
7) 제약조건 삭제
ALTER TABLE sungjuk DROP CONSTRAINT sungjuk_fk;
 
-- 제약조건 조회(대소문자 주의)
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'SUNGJUK';
 
OWNER                          CONSTRAINT_NAME                C TABLE_NAME                     SEARCH_CONDITION                                                                 R_OWNER                        R_CONSTRAINT_NAME              DELETE_RU STATUS   DEFERRABLE     DEFERRED  VALIDATED     GENERATED      BAD RELY LAST_CHANGE INDEX_OWNER                    INDEX_NAME                     INVALID VIEW_RELATED 
------------------------------ ------------------------------ - ------------------------------ -------------------------------------------------------------------------------- ------------------------------ ------------------------------ --------- -------- -------------- --------- ------------- -------------- --- ---- ----------- ------------------------------ ------------------------------ ------- --------------
AI                           SYS_C007278                    C SUNGJUK                        "SUNGJUKNO" IS NOT NULL                                                                         ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          18/02/28                                                                                        
AI                           SYS_C007279                    C SUNGJUK                        "SUBJECT" IS NOT NULL                                                                         ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          18/02/28                                                                                        
AI                           SYS_C007280                    C SUNGJUK                        "EMPLOYEENO" IS NOT NULL                                                                         ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          18/02/28                                                                                        
 
 
8) ON DELETE CASCADE 옵션
-- parent table
DROP TABLE sungjuk;
DROP TABLE employee;
 
CREATE TABLE employee(
  employeeno NUMBER(7) NOT NULL CONSTRAINT employeeno_pk PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);
 
INSERT INTO employee(employeeno, name)
VALUES((SELECT NVL(MAX(employeeno), 0)+1 as employeeno FROM employee), '아로미');
 
INSERT INTO employee(employeeno, name)
VALUES((SELECT NVL(MAX(employeeno), 0)+1 as employeeno FROM employee), '왕눈이');
 
SELECT employeeno, name FROM employee;
 
 EMPLOYEENO NAME
 ---------- ----
          1 아로미
          2 왕눈이
 
-- child table
DROP TABLE sungjuk;
 
CREATE TABLE sungjuk(
  sungjukno NUMBER(7) NOT NULL PRIMARY KEY,
  subject     VARCHAR(30) NOT NULL,
  score       NUMBER(7) DEFAULT 0,
  employeeno NUMBER(7) NOT NULL,
  CONSTRAINT employeeno_fk FOREIGN KEY (employeeno) REFERENCES employee (employeeno) ON DELETE CASCADE
);
 
INSERT INTO sungjuk(sungjukno, subject, score, employeeno)
VALUES((SELECT NVL(MAX(sungjukno), 0)+1 as sungjukno FROM sungjuk), 
            'JAVA', 90, 1);
INSERT INTO sungjuk(sungjukno, subject, score, employeeno)
VALUES((SELECT NVL(MAX(sungjukno), 0)+1 as sungjukno FROM sungjuk), 
            'JSP', 75, 1);
INSERT INTO sungjuk(sungjukno, subject, score, employeeno)
VALUES((SELECT NVL(MAX(sungjukno), 0)+1 as sungjukno FROM sungjuk), 
            'JAVA', 80, 2);
INSERT INTO sungjuk(sungjukno, subject, score, employeeno)
VALUES((SELECT NVL(MAX(sungjukno), 0)+1 as sungjukno FROM sungjuk), 
            'JSP', 65, 2);        
 
-- sungjuk 테이블의 FK는 'employeeno' 컬럼임.            
SELECT employeeno, sungjukno, subject, score 
FROM sungjuk
ORDER BY employeeno, subject;
 
 EMPLOYEENO SUNGJUKNO SUBJECT SCORE
 ---------- --------- ------- -----
          1         1 JAVA       90
          1         2 JSP        75
          2         3 JAVA       80
          2         4 JSP        65
 
-- 일반적으로 지울 수 없으나 ON DELETE CASCADE 옵션 때문에 여기서는 삭제됨.          
DELETE FROM employee WHERE employeeno=2;
 
SELECT employeeno, name FROM employee;
 
EMPLOYEENO NAME                         
---------- ------------------------------
         1 아로미               
 
-- 부모테이블의 PK 컬럼의 값이 삭제되면 자식테이블의 레코드가 자동으로 삭제됨.         
SELECT employeeno, sungjukno, subject, score 
FROM sungjuk
ORDER BY employeeno, subject;
 
EMPLOYEENO  SUNGJUKNO SUBJECT                             SCORE
---------- ---------- ------------------------------ ----------
         1          1 JAVA                                   90
         1          2 JSP                                    75
 
 
  
9) UNIQUE 제약조건 추가
ALTER TABLE employee ADD UNIQUE (name);
 
 SELECT * FROM ALL_CONSTRAINTS
 WHERE TABLE_NAME='EMPLOYEE';
 
-- OWNER                          CONSTRAINT_NAME                C TABLE_NAME                     SEARCH_CONDITION                                                                 R_OWNER                        R_CONSTRAINT_NAME              DELETE_RU STATUS   DEFERRABLE     DEFERRED  VALIDATED     GENERATED      BAD RELY LAST_CHANGE         INDEX_OWNER                    INDEX_NAME                     INVALID VIEW_RELATED  
-------------------------------- ------------------------------ - ------------------------------ -------------------------------------------------------------------------------- ------------------------------ ------------------------------ --------- -------- -------------- --------- ------------- -------------- --- ---- ------------------- ------------------------------ ------------------------------ ------- --------------
--AI6                            SYS_C007584                    C EMPLOYEE                       "EMPLOYEENO" IS NOT NULL                                                                                                                                 ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          2020-05-29 05:02:55                                                                                     
--AI6                            SYS_C007585                    C EMPLOYEE                       "NAME" IS NOT NULL                                                                                                                                       ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          2020-05-29 05:02:55                                                                                     
--AI6                            EMPLOYEENO_PK                  P EMPLOYEE                                                                                                                                                                                ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               2020-05-29 05:02:55                                EMPLOYEENO_PK                                        
--AI6                            SYS_C007592                    U EMPLOYEE                                                                                                                                                                                ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          2020-05-29 05:08:19                                SYS_C007592                                          

-- UNIQUE 제약조건 삭제
ALTER TABLE employee DROP CONSTRAINT SYS_C007592;

--Unique 제약조건 이름 지정하기
ALTER TABLE employee ADD CONSTRAINT employee_unique_unique UNIQUE (name);
 
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME='EMPLOYEE';
 
 
 OWNER                          CONSTRAINT_NAME                C TABLE_NAME                     SEARCH_CONDITION                                                                 R_OWNER                        R_CONSTRAINT_NAME              DELETE_RU STATUS   DEFERRABLE     DEFERRED  VALIDATED     GENERATED      BAD RELY LAST_CHANGE         INDEX_OWNER                    INDEX_NAME                     INVALID VIEW_RELATED  
------------------------------ ------------------------------ - ------------------------------ -------------------------------------------------------------------------------- ------------------------------ ------------------------------ --------- -------- -------------- --------- ------------- -------------- --- ---- ------------------- ------------------------------ ------------------------------ ------- --------------
AI6                            SYS_C007584                    C EMPLOYEE                       "EMPLOYEENO" IS NOT NULL                                                                                                                                 ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          2020-05-29 05:02:55                                                                                     
AI6                            SYS_C007585                    C EMPLOYEE                       "NAME" IS NOT NULL                                                                                                                                       ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          2020-05-29 05:02:55                                                                                     
AI6                            EMPLOYEENO_PK                  P EMPLOYEE                                                                                                                                                                                ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               2020-05-29 05:02:55                                EMPLOYEENO_PK                                        
AI6                            EMPLOYEE_UNIQUE_UNIQUE         U EMPLOYEE                                                                                                                                                                                ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               2020-05-29 05:11:52                                EMPLOYEE_UNIQUE_UNIQUE                               

-- 삭제할 수 없다. 제약조건 때문에
DROP TABLE employee;

-- 개발시에는 자주 사용할 수도 있다.
-- 제약조건을 무시한 테이블 삭제
DROP TABLE employee CASCADE CONSTRAINTS;
