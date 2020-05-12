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
          7 �븮       ���浿            6 ����   ��浿
          8 �븮       ȫ���            6 ����   ��浿
          9 ����       ���ϴ�            7 �븮   ���浿
         10 ���      ��ȿ��            9 ����   ���ϴ�
          
-- ����: FK ���� ���� ���̺� ������ �ϳ��� ������ ���ڵ�(���� ���) �Է���
-- FK ���� ���� �߰�             
ALTER TABLE position ADD CONSTRAINT position_pk PRIMARY KEY (positionno);

ALTER TABLE position ADD CONSTRAINT position_officer_fk 
                                 FOREIGN KEY (officer) REFERENCES position (positionno);