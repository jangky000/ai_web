-- ù��° ���ڵ� ��Ͻ� ������ PK ���� FK ������ ����ؾ� ���� ��� ����. 
-- �ι�°���ʹ� FK������ ������ PK�� ����.
           
DROP TABLE position;

-- ��å
CREATE TABLE position(
  positionno NUMBER(5) NOT NULL,
  name       VARCHAR(30) NOT NULL, 
  employee  VARCHAR(30) NOT NULL,
  officer     NUMBER(5) NOT NULL,
  PRIMARY KEY(positionno),
  FOREIGN KEY(officer) REFERENCES position(positionno) -- �ڱ� �ڽ��� PK
);

COMMENT ON TABLE position is '��å';
COMMENT ON COLUMN position.positionno is '��å ��ȣ';
COMMENT ON COLUMN position.name is '��å �̸�';
COMMENT ON COLUMN position.employee is '�����';
COMMENT ON COLUMN position.officer is '��� ��å �����';

-- FK�� ������ PK�� �������ϴ� ���, ù��° ���ڵ常 ���������� ���� ��� ����
-- �ݵ�� PK�� ���� ��ϵǾ� �־�� ��

-- �������� ���� �ʰ� ������ �ѹ��� ����
SELECT MAX(positionno) as positionno FROM position;

POSITIONNO
----------
null

SELECT MAX(positionno) + 1 as positionno FROM position;
-- null + 1 = null
-- null�� ��Ģ ���� �Ŀ��� null
POSITIONNO
----------
null

SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position;
-- null�� Ư�� ��(0)���� �ٲٱ� ���� NVL(col, 0) �Լ��� ���
POSITIONNO
----------
         1

INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '��ǥ�̻�', '�Ʒι�', 1);
            
SELECT positionno,name, employee, officer
FROM position
ORDER BY positionno ASC;
-- ù��° ���ڵ常 �ڱ� �ڽ��� �����ϰ� �� �� ����
 POSITIONNO NAME     EMPLOYEE OFFICER
 ---------------- -------     ------------- ----------
          1        ��ǥ�̻�  �Ʒι�            1
          
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '�̻�', '�Ǿ', 10);
-- ORA-02291: integrity constraint (AI3.SYS_C007082) violated - parent key not found

-- �̻��� ����� ��ǥ�̻�           
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '�̻�', '�մ���', 1);

SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         ��ǥ�̻�  �Ʒι�            1
          2         �̻�        �մ���            1

-- ���� ����� �̻�     
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '��', '���浿', 2);

SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         ��ǥ�̻�  �Ʒι�            1
          2         �̻�        �մ���            1
          3         ��        ���浿            2

-- ������ ����� ��            
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '����', '���浿', 3);
       
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         ��ǥ�̻�  �Ʒι�            1
          2         �̻�        �մ���            1
          3         ��        ���浿            2
          4         ����        ���浿            3

INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '����', '�ٱ浿', 4);

-- ������ ����� ����   
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         ��ǥ�̻�  �Ʒι�            1
          2         �̻�        �մ���            1
          3         ��        ���浿            2
          4         ����        ���浿            3
          5         ����        �ٱ浿            4

-- ������ ����� ����
INSERT INTO position(positionno,
                                 name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '����', '��浿', 5);

INSERT INTO position(positionno,
                                 name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '����2', '�����', 5);
       
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         ��ǥ�̻�  �Ʒι�            1
          2         �̻�        �մ���            1
          3         ��        ���浿            2
          4         ����        ���浿            3
          5         ����        �ٱ浿            4
          6         ����        ��浿            5
          7         ����2      �����             5

-- �븮�� ����� ����
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '�븮', '���浿', 6);
       
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         ��ǥ�̻�  �Ʒι�            1
          2         �̻�        �մ���            1
          3         ��        ���浿            2
          4         ����        ���浿            3
          5         ����        �ٱ浿            4
          6         ����        ��浿            5
          7         ����2      �����             5
          8         �븮        ���浿            6

INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '�븮', 'ȫ���', 6);
       
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         ��ǥ�̻�  �Ʒι�            1
          2         �̻�        �մ���            1
          3         ��        ���浿            2
          4         ����        ���浿            3
          5         ����        �ٱ浿            4
          6         ����        ��浿            5
          7         ����2      �����             5
          8         �븮        ���浿            6
          9         �븮        ȫ���            6
          
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '����', '���ϴ�', 9);
       
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         ��ǥ�̻�  �Ʒι�            1
          2         �̻�        �մ���            1
          3         ��        ���浿            2
          4         ����        ���浿            3
          5         ����        �ٱ浿            4
          6         ����        ��浿            5
          7         ����2      �����             5
          8         �븮        ���浿            6
          9         �븮        ȫ���            6
          10         ����        ���ϴ�            9
          
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '���', '��ȿ��', 10);
       
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         ��ǥ�̻�  �Ʒι�            1
          2         �̻�        �մ���            1
          3         ��        ���浿            2
          4         ����        ���浿            3
          5         ����        �ٱ浿            4
          6         ����        ��浿            5
          7         ����2      �����             5
          8         �븮        ���浿            6
          9         �븮        ȫ���            6
        10         ����        ���ϴ�            9
        11         ���        ��ȿ��            10
          
-- Self join
-- �ڱ� �ڽ��� INNER JOIN
SELECT p.positionno, p.name, p.employee, p.officer,
          c.name, c.employee
FROM position p, position c
WHERE p.officer = c.positionno 
ORDER BY positionno ASC;

 POSITIONNO NAME EMPLOYEE OFFICER NAME EMPLOYEE
 ---------- ---- -------- ------- ---- --------
          1 ��ǥ�̻� �Ʒι�            1 ��ǥ�̻� �Ʒι�
          2 �̻�       �մ���            1 ��ǥ�̻� �Ʒι�
          3 ��       ���浿            2 �̻�   �մ���
          4 ����       ���浿            3 ��   ���浿
          5 ����       �ٱ浿            4 ����   ���浿
          6 ����       ��浿            5 ����   �ٱ浿
          7 ����2     �����            5 ����   �ٱ浿
          8 �븮       ���浿            6 ����   ��浿
          9 �븮       ȫ���            6 ����   ��浿
         10 ����       ���ϴ�           9 �븮   ȫ���
         11 ���      ��ȿ��           10 ����   ���ϴ�
 
 --ANSI
 SELECT p.positionno, p.name, p.employee, p.officer,
          c.name, c.employee
FROM position p
INNER JOIN position c
ON p.officer = c.positionno 
ORDER BY positionno ASC;

-- ���� > ai6 > ���̺� > position > �������� > pk �������Ǹ� Ȯ��
-- �⺻���� ������� �������� ����
ALTER TABLE position DROP CONSTRAINT SYS_C007336;
--���� ���� -
--ORA-02273: this unique/primary key is referenced by some foreign keys
--02273. 00000 -  "this unique/primary key is referenced by some foreign keys"
--*Cause:    Self-evident.
--*Action:   Remove all references to the key before the key is to be dropped.
-- fk ������������ ���� ���� �� ����.
DELETE FROM position;
COMMIT;
-- ���ڵ带 �� �����ص� ���� �� ����. �����ؼ� ����ؾ� �Ѵ�.

-- FK ���� ���� ���� -- ����
ALTER TABLE position DROP CONSTRAINT SYS_C007337;
-- PK ���� ���� ���� -- ����
ALTER TABLE position DROP CONSTRAINT SYS_C007336;

--PK �������� �߰�
-- �������Ǹ�: position_pk, ã�� ���� �̸��� ������ �� �ִ�.
ALTER TABLE position ADD CONSTRAINT position_pk PRIMARY KEY (positionno);

--PK �������� ����
ALTER TABLE position DROP CONSTRAINT position_pk;

-- FK �������� �߰�        
-- ����: FK ���� ���� ���̺� ������ �ϳ��� ������ ���ڵ�(���� ���) �Է���    
-- �������Ǹ�: position_officer_fk: ���̺�_�÷�_fk
ALTER TABLE position ADD CONSTRAINT position_officer_fk 
                                 FOREIGN KEY (officer) REFERENCES position (positionno);

-- ����� �������� Į�� ���� ���
DESC user_constraints;

�̸�                ��?       ����            
----------------- -------- ------------- 
OWNER                      VARCHAR2(120) 
CONSTRAINT_NAME   NOT NULL VARCHAR2(30)  
CONSTRAINT_TYPE            VARCHAR2(1)   
TABLE_NAME        NOT NULL VARCHAR2(30)  
SEARCH_CONDITION           LONG          
R_OWNER                    VARCHAR2(120) 
R_CONSTRAINT_NAME          VARCHAR2(30)  
DELETE_RULE                VARCHAR2(9)   
STATUS                     VARCHAR2(8)   
DEFERRABLE                 VARCHAR2(14)  
DEFERRED                   VARCHAR2(9)   
VALIDATED                  VARCHAR2(13)  
GENERATED                  VARCHAR2(14)  
BAD                        VARCHAR2(3)   
RELY                       VARCHAR2(4)   
LAST_CHANGE                DATE          
INDEX_OWNER                VARCHAR2(30)  
INDEX_NAME                 VARCHAR2(30)  
INVALID                    VARCHAR2(7)   
VIEW_RELATED               VARCHAR2(14)  

-- ai6 ������� ��� �������� ���
SELECT * FROM user_constraints; 

-- POSITION ���̺� �ش��ϴ� ��������
-- ���̺�� �ݵ�� �빮�ڷ�
SELECT constraint_name, constraint_type, search_condition 
FROM user_constraints 
WHERE table_name = 'POSITION'; 

CONSTRAINT_NAME                C SEARCH_CONDITION                                                                
------------------------------ - --------------------------------------------------------------------------------
SYS_C007332                    C "POSITIONNO" IS NOT NULL                                                        
SYS_C007333                    C "NAME" IS NOT NULL                                                              
SYS_C007334                    C "EMPLOYEE" IS NOT NULL                                                          
SYS_C007335                    C "OFFICER" IS NOT NULL                                                           
POSITION_PK                    P    
