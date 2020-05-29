1. �⺻���� View�� ����
 
1) ���̺� ����
DROP TABLE test PURGE;
 
CREATE TABLE test(
    testno NUMBER(5)   NOT NULL, -- �Ϸù�ȣ
    name   VARCHAR(30) NOT NULL, -- ����
    mat    NUMBER(3)   NOT NULL, -- ����
    eng    NUMBER(3)   NOT NULL, -- ����
    tot    NUMBER(3)       NULL, -- ����
    avg    NUMBER(4, 1)    NULL, -- ���
    PRIMARY KEY (testno) 
);
 
DELETE FROM test;
 
 
 
2) ���� ������ �߰�
 
INSERT INTO test(testno, name, mat, eng)
VALUES((SELECT NVL(MAX(testno), 0)+1 as cnt FROM test),    
    '�Ǿ �귯����', 80, 100
);
 
INSERT INTO test(testno, name, mat, eng)
VALUES((SELECT NVL(MAX(testno), 0)+1 as cnt FROM test),    
    '�޸���Ʈ��', 80, 100
);
 
INSERT INTO test(testno, name, mat, eng)
VALUES((SELECT NVL(MAX(testno), 0)+1 as cnt FROM test),    
    '����������', 85, 80
);
 
INSERT INTO test(testno, name, mat, eng)
VALUES((SELECT NVL(MAX(testno), 0)+1 as cnt FROM test),    
    '�ݸ��۽�', 65, 60
);
 
INSERT INTO test(testno, name, mat, eng)
VALUES((SELECT NVL(MAX(testno), 0)+1 as cnt FROM test),    
    '���ڶ� ��ī������', 75, 70
);
 
 SELECT * FROM test;
 
     TESTNO NAME                                  MAT        ENG        TOT        AVG
---------- ------------------------------ ---------- ---------- ---------- ----------
         1 �Ǿ �귯����                        80        100        
         2 �޸���Ʈ��                             80        100        
         3 ����������                             85         80        
         4 �ݸ��۽�                               65         60        
         5 ���ڶ� ��ī������                      75         70       
 
 -- ������Ʈ���� Į���� ����Ͽ� �ٷ� ���� + ������ �� �ִ�.
UPDATE test SET tot = mat+eng;
UPDATE test SET avg = tot/2;
 
SELECT * FROM test;
 
     TESTNO NAME                                  MAT        ENG        TOT        AVG
---------- ------------------------------ ---------- ---------- ---------- ----------
         1 �Ǿ �귯����                        80        100        180         90
         2 �޸���Ʈ��                             80        100        180         90
         3 ����������                             85         80        165       82.5
         4 �ݸ��۽�                               65         60        125       62.5
         5 ���ڶ� ��ī������                      75         70        145       72.5
 
3) VIEW�� ����
-- ����� ���
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
 
-- View ���, ��� 90�� �̻��� ��� ���
SELECT testno, name, mat, eng, tot, avg FROM vtest_90;
--    TESTNO NAME                                  MAT        ENG        TOT        AVG
------------ ------------------------------ ---------- ---------- ---------- ----------
--         1 �Ǿ �귯����                        80        100        180         90
--         2 �޸���Ʈ��                             80        100        180         90 

-- SELECT READ������ ���� ���� ����
-- �ڹ� �����ڰ� �����ϱ⿡ ���� ��������.

2. �Ϻ� �÷��� View�� ������� ����
 
DROP VIEW vtest_80;
 
CREATE VIEW vtest_80
AS 
SELECT testno, name, tot, avg
FROM test
WHERE avg >= 80;
 
-- View�� ������� �÷���(mat, eng�� ����) ��µ�.
SELECT * FROM vtest_80; 
SELECT testno, name, tot, avg FROM vtest_80; 
--     TESTNO NAME                                  TOT        AVG
------------ ------------------------------ ---------- ----------
--         1 �Ǿ �귯����                       180         90
--         2 �޸���Ʈ��                            180         90
--         3 ����������                            165       82.5
 
 
-- ERROR, View�� ���� �÷�(mat, eng) ���� ����.
SELECT testno, name, mat, eng, tot, avg FROM vtest_80; 
 
 -- ���� ����, ���� create or replace
3. ()���� �÷��� �����Ǵ� View�� �÷��� �����Դϴ�.
- ���� �÷����� ���߾���.
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
--         1 �Ǿ �귯����                       180         90
--         2 �޸���Ʈ��                            180         90
--         3 ����������                            165       82.5
--         5 ���ڶ� ��ī������                     145       72.5
 
-- �Լ��� �̿��� �ٷ� �� ����
4. �Լ��� �̿��� View�� ����
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
   - WHERE���� ����� �÷��� ���� ���� �� �� �����ϴ�.
 
1) �ǽ��� ���̺�
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
 
2) WITH CHECK OPTION ������� ���� ���
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
 
-- vemp20�� 20�� �μ��� �۾� ������� �ϳ�
-- WHERE���� ��Ÿ�� �μ��� 30������ ���������� ���� ������
-- �߻��մϴ�.
-- View�� �̿��� UPDATE�� ������ �ƴմϴ�.
UPDATE vemp20 SET department_id=30;
 
-- �μ��� ��� 30������ ����Ǿ� ����� �����ϴ�.
SELECT * FROM vemp20;
-- ���õ� �� ����
 
SELECT * FROM employee;
AME           SALARY DEPARTMENT_ID
---------- ---------- -------------
aaa           1000000            30
bbb           1100000            30
ccc           1200000            30
ddd           1300000            30
eee           1400000            40
 
-- INSERT, DELETE, UPDATE ���� ���
ROLLBACK;
 
SELECT * FROM employee;
NAME           SALARY DEPARTMENT_ID
---------- ---------- -------------
aaa           1000000            20
bbb           1100000            20
ccc           1200000            20
ddd           1300000            30
eee           1400000            40
 
 
 
3) WITH CHECK OPTION�� ����� ���
-- WHERE ���� �� ���� �� �ٲٰ� ��
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
 
-- UPDATE�� �����Ǿ� ������ �ȵ˴ϴ�. UPDATE�� �����ϰ��� �� ����
-- ������ ���̺��� ������� �մϴ�.
-- SQL ����: ORA-01402: view WITH CHECK OPTION where-clause violation
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
�ѹ� �Ϸ�.
NAME           SALARY DEPARTMENT_ID
---------- ---------- -------------
aaa           1000000            20
bbb           1100000            20
ccc           1200000            20
ddd           1300000            30
eee           1400000            40
 
  
6. WITH READ ONLY �ɼ�
  - View���� UPDATE, INSERT, DELETE ����� ������ŵ�ϴ�.
 
CREATE VIEW test_read(num, name, total)
AS 
SELECT testno, name, tot
FROM test
WHERE tot >= 60
WITH READ ONLY;
 
 
SELECT * FROM test_read;
 
 -- ����, ���� �Ұ�
INSERT INTO test_read(num,
    name, total)
VALUES((SELECT NVL(MAX(testno), 0)+1 as cnt FROM test),    
    '�ٸ� ���ͽ�', 150
);
 
-- SQL ����: ORA-42399: cannot perform a DML operation on a read-only view
-- 42399.0000 - "cannot perform a DML operation on a read-only view"
UPDATE test_read SET total = 200;
 
 
�� VIEW�� INSERT, UPDATE, DELETE���� ����� �������� �ʽ��ϴ�.
 
 
7. FROM ���� ��ϵ� Subquery�� INLINE VIEW��� �ؼ�
   SQL ���ο� ���Ե� �ӽ� VIEW��� �θ��ϴ�.
   - Top-n Analysis���� ���� ���( == ����¡)
   
 
1) ���ڵ� ����
 
SELECT testno, name, mat, eng, tot, avg
FROM test
ORDER BY testno DESC;
 
2) rownum ����
SELECT testno, name, mat, eng, tot, avg, rownum r
FROM(
    SELECT testno, name, mat, eng, tot, avg -- Inline View
    FROM test
    ORDER BY testno DESC
);
   
3) record ����
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
 
 
4) �˻�
SELECT testno, name, mat, eng, tot, avg, r
FROM(
    SELECT testno, name, mat, eng, tot, avg, rownum as r
    FROM(
        SELECT testno, name, mat, eng, tot, avg -- Inline View
        FROM test
        WHERE name LIKE '%�޸�%'
        ORDER BY testno DESC
    )
)
WHERE r > =1 AND r <= 3;
 
5) Subquery�� View ����
 
CREATE OR REPLACE VIEW v_test_list
AS
SELECT testno, name, mat, eng, tot, avg -- Inline View
FROM test
ORDER BY testno DESC;
 
6) Subquery�� View�� ���
 -- �並 ���������� ���� �˻��̳� ����¡�� ����������
 -- 3�� ������ 2�� ������ �پ�� �� �ִ� -> �׷��� �ڵ带 ���⿡ ��������.
 -- ����¡�� �Ҷ� 3�� �����̱� ������, �並 ����ϴ� ���� ����. 
 
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
 
-- �˻�
SELECT testno, name, mat, eng, tot, avg, r
FROM (
    SELECT testno, name, mat, eng, tot, avg, rownum r
    FROM v_test_list
    WHERE name LIKE '%�޸�%'
)
WHERE r > = 1 AND r <= 3;
 
 
 