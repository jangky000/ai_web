[02] Sequecne
- ���ڵ�� �����ϰ� ���еǾ�������� ������ ���� �ʿ�������
  �����͸� ���а����� ����ϴ� ��찡 �ְ� Sequence�� �Ϸù�ȣó��
  ����Ŭ���� �����Ǵ� ���� ����ϴ� ��쵵 ����.
 
  START WITH 1: �Ϸù�ȣ 1���� ����
  INCREMENT BY 1: �Ϸù�ȣ�� 1 �� ����
  CACHE 2: �������� ���̺� ���������� ���� Update�� �߻�������
           �̰��� ���̱����� �޸𸮿��� �Ϸù�ȣ�� ������Ű��
           CACHE ����� �̿��� ���� ������ ������ �� ����, 
           �޸𸮿��� �Ϸù�ȣ ����, ó�� �ӵ� ���,
           �⺻���� 20��, INSERT�� ���� �߻��ϸ� �⺻���� ��� ����

- MySQL�� 'auto_increment'�� �����մϴ�.
  memono INT NOT NULL AUTO_INCREMENT PRIMARY KEY
 
�� /ai3/oracle/sequence.sql
-------------------------------------------------------------------------------------
 
DROP TABLE emp;
 
CREATE TABLE emp(
    num           number(7)   not null,
    name          varchar(10) not null,
    salary        number(7)   not null,
    department_id number(4)   not null
);
 
CREATE SEQUENCE emp_seq
    INCREMENT BY 1          -- ���� ��
    START WITH   1           -- 1���� ����
    MAXVALUE     9999999  -- �ִ밪
    CACHE 20            -- 20������ �ý��� ���̺� ����
    NOCYCLE;            -- �ִ� 99999�������� �ٽ� ��ȯ���� ���� 
    
    
    
DROP SEQUENCE emp_seq;
 
 
INSERT INTO emp(num,name, salary,department_id)
VALUES(emp_seq.NextVal,'aaa', 1000000, 20);
INSERT INTO emp(num,name, salary,department_id)
VALUES(emp_seq.NextVal,'bbb', 1100000, 20);
INSERT INTO emp(num,name, salary,department_id)
VALUES(emp_seq.NextVal,'ccc', 1200000, 20);
 
SELECT * FROM emp;
 
 
COMMIT;
 
 
-- ������ Sequence ��� ���
SELECT *
FROM user_sequences;
 
-- ���� sequence���� �� �� ������ ��������� ���� �����˴ϴ�.
SELECT emp_seq.nextval as seq FROM dual;
--        SEQ
------------
--         5
 
-- ���� sequence�� ���ϴ�. �ݺ��ؼ� �����ص� ���� �������� ����
SELECT emp_seq.currval FROM dual;
--    CURRVAL
------------
--         5
 
 
-------------------------------------------------------------------------------------
 
 