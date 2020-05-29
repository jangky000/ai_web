--1. �ߺ� ���̺� ����

DROP TABLE pay PURGE;
 
CREATE TABLE pay(
    name varchar(10) NOT NULL,
    pay  number(7)   NOT NULL,
    tax  number(6)   DEFAULT 0
);
 
 -- ���̺� ����� ������
SELECT * FROM tab;
 
 
--2. COMMIT(INSERT, UPDATE, DELETE ����)
 
INSERT INTO pay(name,pay,tax) VALUES('�մ���', 2000000, 100000);
 
-- ���� DBMS�� ���� -- ��ũ �� ����
COMMIT;
 
SELECT * FROM pay;
 
 
--3. ROLLBACK
 
DELETE FROM pay WHERE name='�մ���';
 
SELECT * FROM pay;
 
-- ������ ���ڵ尡 ���� �˴ϴ�., ROLLBACK
ROLLBACK WORK;   -- == ���� ROLLBACK; �̶�� ����. 
 
SELECT * FROM pay;
 
 
 
--4. �����ܰ��� ����
 
DELETE FROM pay WHERE name='�մ���';
 
SELECT * FROM pay;
 -- ���ڵ� ����
 
-- �Ʒι� �߰�
INSERT INTO pay(name,pay,tax) VALUES('�Ʒι�', 2200000, 120000);
 
SELECT * FROM pay;
 
 
-- �Ʒι��� �޿��� 10% �λ��մϴ�.
UPDATE pay SET pay=pay * 1.1 WHERE name='�Ʒι�';
 
SELECT * FROM pay;
 
 
-- �Ʒι��� ������ 11% �λ��մϴ�.
UPDATE pay SET tax=tax * 0.11 WHERE name='�Ʒι�';
 
SELECT * FROM pay;
 
 
-- ���� ���·� ���ư��ϴ�.
-- delete 1 + insert 1 + update 2 -> �� ���
ROLLBACK WORK;
 
SELECT * FROM pay;
 
 
--5. SAVEPOINT
   - Ư�� �������� ROLLBACK�� �� �ִ� ����� �����մϴ�.
 
-- ���� ������ ����
SAVEPOINT first;
 
INSERT INTO pay(name,pay,tax) VALUES('�Ʒι�', 3000000, 300000);
 
SELECT * FROM pay;
-- NAME              PAY        TAX
------------ ---------- ----------
--�մ���        2000000     100000
--�Ʒι�        3000000     300000
 
UPDATE pay SET pay=3500000, tax=350000;
 
SELECT * FROM pay;
-- NAME              PAY        TAX
------------ ---------- ----------
--�մ���        3500000     350000
--�Ʒι�        3500000     350000
 
SAVEPOINT second;
 
 
INSERT INTO pay(name,pay,tax) VALUES('����', 4000000, 400000);
 
SELECT * FROM pay;
--  NAME              PAY        TAX
------------ ---------- ----------
--�մ���        3500000     350000
--�Ʒι�        3500000     350000
--����          4000000     400000
 
-- SAVEPOINT second �������� �����մϴ�. --> ������ �����ϱ� ��
ROLLBACK TO SAVEPOINT second;

 
SELECT * FROM pay;
-- NAME              PAY        TAX
------------ ---------- ----------
--�մ���        3500000     350000
--�Ʒι�        3500000     350000
 
ROLLBACK TO SAVEPOINT first; -- �մ��̸� �������� ���� ���ư�
 
SELECT * FROM pay;
-- NAME              PAY        TAX
------------ ---------- ----------
--�մ���        2000000     100000
 
6. READ Consistency(�б� �ϰ���)
   - ������ commit �Ǵ� ����� �ٸ���
   - iSQL+ �� �귯������ ������ COMMIT �˴ϴ�.
   - SQL+�� â�� ������ ROLLBACK �˴ϴ�.
   - SQL+�� exit����� ������ COMMIT�˴ϴ�.
     ���� �α׾ƿ��ÿ��� �ݵ�� ��������� ROLLBACK, COMMIT��� 
     ����� ���� �մϴ�.
 
   USER 1 --- �ӽ� ���� ---+   +--- COMMIT  ----- Data Area
                                  +--+ 
   USER 1 --- �ӽ� ���� ---+   +--- ROLLBACK
   
   
 -- run sql cmd line���� ���ÿ� db�� ����
 
--1)  �غ�: sql developer ���� ����
DELETE FROM pay;
INSERT INTO pay(name,pay,tax) VALUES('�մ���', 2000000, 100000);
COMMIT;
 
 SELECT * FROM pay;
 
--2) SQL command Line
CONNECT ai6/1234 -- ai6 ����

SELECT * FROM pay;
-- NAME              PAY        TAX
------------ ---------- ----------
--�մ���        2000000     100000
 
INSERT INTO pay(name, pay, tax) VALUES('�Ʒι�', 1700000, 50000);
 
SELECT * FROM pay;
-- NAME                        PAY        TAX
---------------------- ---------- ----------
--�մ���                  2000000     100000
--�Ʒι�                  1700000      50000
 
3) SQL developer���� : ai6, ����� ������ �Ʒι̸� ���� �� �����ϴ�.
SELECT * FROM pay;
-- NAME              PAY        TAX
------------ ---------- ----------
--�մ���        2000000     100000
 
 -- -> ����� �ٸ���, commit ���� �ʾұ� ������, ���� �ٸ� �޸𸮸� ����ϰ� �ִ�.
 
--4) SQL command Line ai6
--COMMIT;
 
--5)SQL developer: ai6, COMMIT�� �Ǿ������� ����� �����͸� ���� �� �ֽ��ϴ�.
SELECT * FROM pay;
-- NAME              PAY        TAX
------------ ---------- ----------
--�մ���        2000000     100000
--�Ʒι�        1700000      50000
  
-------------------------------------------------------------------------------------
 
 