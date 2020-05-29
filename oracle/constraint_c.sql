1) ���̺� ���� ����
-- parent table
DROP TABLE employee;
 
CREATE TABLE employee(
  employeeno NUMBER(7) NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);
 
INSERT INTO employee(employeeno, name)
VALUES((SELECT NVL(MAX(employeeno), 0)+1 as employeeno FROM employee), '�Ʒι�');
 
INSERT INTO employee(employeeno, name)
VALUES((SELECT NVL(MAX(employeeno), 0)+1 as employeeno FROM employee), '�մ���');
 
SELECT employeeno, name FROM employee;
 
 EMPLOYEENO NAME
 ---------- ----
          1 �Ʒι�
          2 �մ���
 
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
 
         
2) �������� ��ȸ(��ҹ��� ����)
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
 
  
3) ���� ������ ������� ���� ���̺�
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
 
 -- ���� ���������� �߰��ϱ�
4) PK �������� �߰�
ALTER TABLE employee ADD PRIMARY KEY (employeeno);
 
-- �������� ��ȸ(��ҹ��� ����)
SELECT * FROM ALL_CONSTRAINTS
WHERE  TABLE_NAME = 'EMPLOYEE';
 
 OWNER CONSTRAINT_NAME CONSTRAINT_TYPE TABLE_NAME SEARCH_CONDITION         R_OWNER R_CONSTRAINT_NAME DELETE_RULE STATUS  DEFERRABLE     DEFERRED  VALIDATED GENERATED      BAD  RELY LAST_CHANGE           INDEX_OWNER INDEX_NAME  INVALID VIEW_RELATED
 ----- --------------- --------------- ---------- ------------------------ ------- ----------------- ----------- ------- -------------- --------- --------- -------------- ---- ---- --------------------- ----------- ----------- ------- ------------
 AI  SYS_C007201     C               EMPLOYEE   "EMPLOYEENO" IS NOT NULL NULL    NULL              NULL        ENABLED NOT DEFERRABLE IMMEDIATE VALIDATED GENERATED NAME NULL NULL 2018-02-28 12:38:56.0 NULL        NULL        NULL    NULL
 AI  SYS_C007202     C               EMPLOYEE   "NAME" IS NOT NULL       NULL    NULL              NULL        ENABLED NOT DEFERRABLE IMMEDIATE VALIDATED GENERATED NAME NULL NULL 2018-02-28 12:38:56.0 NULL        NULL        NULL    NULL
 AI  SYS_C007203     P               EMPLOYEE   NULL                     NULL    NULL              NULL        ENABLED NOT DEFERRABLE IMMEDIATE VALIDATED GENERATED NAME NULL NULL 2018-02-28 12:39:58.0 NULL        SYS_C007203 NULL    NULL
 
-- ���̺��� PK �������� ����
ALTER TABLE employee DROP PRIMARY KEY;
 
-- �������� ��ȸ(��ҹ��� ����)
SELECT * FROM ALL_CONSTRAINTS
WHERE  TABLE_NAME = 'EMPLOYEE';
 
OWNER                          CONSTRAINT_NAME                C TABLE_NAME                     SEARCH_CONDITION                                                                 R_OWNER                        R_CONSTRAINT_NAME              DELETE_RU STATUS   DEFERRABLE     DEFERRED  VALIDATED     GENERATED      BAD RELY LAST_CHANGE INDEX_OWNER                    INDEX_NAME                     INVALID VIEW_RELATED 
------------------------------ ------------------------------ - ------------------------------ -------------------------------------------------------------------------------- ------------------------------ ------------------------------ --------- -------- -------------- --------- ------------- -------------- --- ---- ----------- ------------------------------ ------------------------------ ------- --------------
AI                           SYS_C007276                    C EMPLOYEE                       "EMPLOYEENO" IS NOT NULL                                                                         ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          18/02/28                                                                                        
AI                           SYS_C007277                    C EMPLOYEE                       "NAME" IS NOT NULL                                                                         ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          18/02/28                                                                                        
 
 
5) PK �������� �߰�(�������Ǹ� ����), ���� ���� �̸��� Ȯ���ϰ� ó���ϱⰡ ����.
ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY (employeeno);
 
-- �������� ��ȸ(��ҹ��� ����)
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'EMPLOYEE';
 
 OWNER CONSTRAINT_NAME CONSTRAINT_TYPE TABLE_NAME SEARCH_CONDITION         R_OWNER R_CONSTRAINT_NAME DELETE_RULE STATUS  DEFERRABLE     DEFERRED  VALIDATED GENERATED      BAD  RELY LAST_CHANGE           INDEX_OWNER INDEX_NAME  INVALID VIEW_RELATED
 ----- --------------- --------------- ---------- ------------------------ ------- ----------------- ----------- ------- -------------- --------- --------- -------------- ---- ---- --------------------- ----------- ----------- ------- ------------
 AI  SYS_C007201     C               EMPLOYEE   "EMPLOYEENO" IS NOT NULL NULL    NULL              NULL        ENABLED NOT DEFERRABLE IMMEDIATE VALIDATED GENERATED NAME NULL NULL 2018-02-28 12:38:56.0 NULL        NULL        NULL    NULL
 AI  SYS_C007202     C               EMPLOYEE   "NAME" IS NOT NULL       NULL    NULL              NULL        ENABLED NOT DEFERRABLE IMMEDIATE VALIDATED GENERATED NAME NULL NULL 2018-02-28 12:38:56.0 NULL        NULL        NULL    NULL
 AI  EMPLOYEE_PK    P               EMPLOYEE   NULL                     NULL    NULL              NULL        ENABLED NOT DEFERRABLE IMMEDIATE VALIDATED USER NAME      NULL NULL 2018-02-28 12:42:22.0 NULL        EMPLOYEE_PK NULL    NULL
 
 
6) FK �������� �߰�
ALTER TABLE sungjuk ADD CONSTRAINT sungjuk_fk FOREIGN KEY(employeeno) 
REFERENCES employee(employeeno);
 
-- �������� ��ȸ(��ҹ��� ����)
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'SUNGJUK';
 
OWNER                          CONSTRAINT_NAME                C TABLE_NAME                     SEARCH_CONDITION                                                                 R_OWNER                        R_CONSTRAINT_NAME              DELETE_RU STATUS   DEFERRABLE     DEFERRED  VALIDATED     GENERATED      BAD RELY LAST_CHANGE INDEX_OWNER                    INDEX_NAME                     INVALID VIEW_RELATED 
------------------------------ ------------------------------ - ------------------------------ -------------------------------------------------------------------------------- ------------------------------ ------------------------------ --------- -------- -------------- --------- ------------- -------------- --- ---- ----------- ------------------------------ ------------------------------ ------- --------------
AI                           SUNGJUK_FK                     R SUNGJUK                         KOR1                           EMPLOYEE_PK                    NO ACTION ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               18/02/28                                                                                        
AI                           SYS_C007278                    C SUNGJUK                        "SUNGJUKNO" IS NOT NULL                                                                         ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          18/02/28                                                                                        
AI                           SYS_C007279                    C SUNGJUK                        "SUBJECT" IS NOT NULL                                                                         ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          18/02/28                                                                                        
AI                           SYS_C007280                    C SUNGJUK                        "EMPLOYEENO" IS NOT NULL                                                                         ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          18/02/28                                                                                        

 
7) �������� ����
ALTER TABLE sungjuk DROP CONSTRAINT sungjuk_fk;
 
-- �������� ��ȸ(��ҹ��� ����)
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'SUNGJUK';
 
OWNER                          CONSTRAINT_NAME                C TABLE_NAME                     SEARCH_CONDITION                                                                 R_OWNER                        R_CONSTRAINT_NAME              DELETE_RU STATUS   DEFERRABLE     DEFERRED  VALIDATED     GENERATED      BAD RELY LAST_CHANGE INDEX_OWNER                    INDEX_NAME                     INVALID VIEW_RELATED 
------------------------------ ------------------------------ - ------------------------------ -------------------------------------------------------------------------------- ------------------------------ ------------------------------ --------- -------- -------------- --------- ------------- -------------- --- ---- ----------- ------------------------------ ------------------------------ ------- --------------
AI                           SYS_C007278                    C SUNGJUK                        "SUNGJUKNO" IS NOT NULL                                                                         ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          18/02/28                                                                                        
AI                           SYS_C007279                    C SUNGJUK                        "SUBJECT" IS NOT NULL                                                                         ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          18/02/28                                                                                        
AI                           SYS_C007280                    C SUNGJUK                        "EMPLOYEENO" IS NOT NULL                                                                         ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          18/02/28                                                                                        
 
 
8) ON DELETE CASCADE �ɼ�
-- parent table
DROP TABLE sungjuk;
DROP TABLE employee;
 
CREATE TABLE employee(
  employeeno NUMBER(7) NOT NULL CONSTRAINT employeeno_pk PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);
 
INSERT INTO employee(employeeno, name)
VALUES((SELECT NVL(MAX(employeeno), 0)+1 as employeeno FROM employee), '�Ʒι�');
 
INSERT INTO employee(employeeno, name)
VALUES((SELECT NVL(MAX(employeeno), 0)+1 as employeeno FROM employee), '�մ���');
 
SELECT employeeno, name FROM employee;
 
 EMPLOYEENO NAME
 ---------- ----
          1 �Ʒι�
          2 �մ���
 
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
 
-- sungjuk ���̺��� FK�� 'employeeno' �÷���.            
SELECT employeeno, sungjukno, subject, score 
FROM sungjuk
ORDER BY employeeno, subject;
 
 EMPLOYEENO SUNGJUKNO SUBJECT SCORE
 ---------- --------- ------- -----
          1         1 JAVA       90
          1         2 JSP        75
          2         3 JAVA       80
          2         4 JSP        65
 
-- �Ϲ������� ���� �� ������ ON DELETE CASCADE �ɼ� ������ ���⼭�� ������.          
DELETE FROM employee WHERE employeeno=2;
 
SELECT employeeno, name FROM employee;
 
EMPLOYEENO NAME                         
---------- ------------------------------
         1 �Ʒι�               
 
-- �θ����̺��� PK �÷��� ���� �����Ǹ� �ڽ����̺��� ���ڵ尡 �ڵ����� ������.         
SELECT employeeno, sungjukno, subject, score 
FROM sungjuk
ORDER BY employeeno, subject;
 
EMPLOYEENO  SUNGJUKNO SUBJECT                             SCORE
---------- ---------- ------------------------------ ----------
         1          1 JAVA                                   90
         1          2 JSP                                    75
 
 
  
9) UNIQUE �������� �߰�
ALTER TABLE employee ADD UNIQUE (name);
 
 SELECT * FROM ALL_CONSTRAINTS
 WHERE TABLE_NAME='EMPLOYEE';
 
-- OWNER                          CONSTRAINT_NAME                C TABLE_NAME                     SEARCH_CONDITION                                                                 R_OWNER                        R_CONSTRAINT_NAME              DELETE_RU STATUS   DEFERRABLE     DEFERRED  VALIDATED     GENERATED      BAD RELY LAST_CHANGE         INDEX_OWNER                    INDEX_NAME                     INVALID VIEW_RELATED  
-------------------------------- ------------------------------ - ------------------------------ -------------------------------------------------------------------------------- ------------------------------ ------------------------------ --------- -------- -------------- --------- ------------- -------------- --- ---- ------------------- ------------------------------ ------------------------------ ------- --------------
--AI6                            SYS_C007584                    C EMPLOYEE                       "EMPLOYEENO" IS NOT NULL                                                                                                                                 ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          2020-05-29 05:02:55                                                                                     
--AI6                            SYS_C007585                    C EMPLOYEE                       "NAME" IS NOT NULL                                                                                                                                       ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          2020-05-29 05:02:55                                                                                     
--AI6                            EMPLOYEENO_PK                  P EMPLOYEE                                                                                                                                                                                ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               2020-05-29 05:02:55                                EMPLOYEENO_PK                                        
--AI6                            SYS_C007592                    U EMPLOYEE                                                                                                                                                                                ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          2020-05-29 05:08:19                                SYS_C007592                                          

-- UNIQUE �������� ����
ALTER TABLE employee DROP CONSTRAINT SYS_C007592;

--Unique �������� �̸� �����ϱ�
ALTER TABLE employee ADD CONSTRAINT employee_unique_unique UNIQUE (name);
 
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME='EMPLOYEE';
 
 
 OWNER                          CONSTRAINT_NAME                C TABLE_NAME                     SEARCH_CONDITION                                                                 R_OWNER                        R_CONSTRAINT_NAME              DELETE_RU STATUS   DEFERRABLE     DEFERRED  VALIDATED     GENERATED      BAD RELY LAST_CHANGE         INDEX_OWNER                    INDEX_NAME                     INVALID VIEW_RELATED  
------------------------------ ------------------------------ - ------------------------------ -------------------------------------------------------------------------------- ------------------------------ ------------------------------ --------- -------- -------------- --------- ------------- -------------- --- ---- ------------------- ------------------------------ ------------------------------ ------- --------------
AI6                            SYS_C007584                    C EMPLOYEE                       "EMPLOYEENO" IS NOT NULL                                                                                                                                 ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          2020-05-29 05:02:55                                                                                     
AI6                            SYS_C007585                    C EMPLOYEE                       "NAME" IS NOT NULL                                                                                                                                       ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          2020-05-29 05:02:55                                                                                     
AI6                            EMPLOYEENO_PK                  P EMPLOYEE                                                                                                                                                                                ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               2020-05-29 05:02:55                                EMPLOYEENO_PK                                        
AI6                            EMPLOYEE_UNIQUE_UNIQUE         U EMPLOYEE                                                                                                                                                                                ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               2020-05-29 05:11:52                                EMPLOYEE_UNIQUE_UNIQUE                               

-- ������ �� ����. �������� ������
DROP TABLE employee;

-- ���߽ÿ��� ���� ����� ���� �ִ�.
-- ���������� ������ ���̺� ����
DROP TABLE employee CASCADE CONSTRAINTS;
