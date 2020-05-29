SET SERVEROUTPUT ON; 
 
1. sungjuk ���̺��� ������ ����� ����ϸ鼭 ���ڵ带 1000�� �߰��ϴ�
      ���ν����� �ۼ��ϼ���.
 
DROP TABLE sungjuk PURGE;
 
CREATE TABLE sungjuk(
    no number(5) not null,
    kuk number(3) not null,
    eng number(3) not null,
    tot number(3) not null,
    avg number(5,2) not null
);
 
CREATE OR REPLACE PROCEDURE sungjuk_ins1000
IS
    v_i   number(5) DEFAULT 0;
    v_no  sungjuk.no%TYPE;  -- sungjuk���̺��� no�÷��� Ÿ���� ������ ���, ���ν������� ����ϴ� ���� ��������
    v_kuk sungjuk.kuk%TYPE; 
    v_eng sungjuk.eng%TYPE;
    v_tot number(3); 
    v_avg number(5,2); -- -999.99 ~ +999.99
BEGIN
    FOR v_i IN 1..1000 LOOP
        v_no  := v_i;  -- v_i������ ���� v_no�� �Ҵ��մϴ�.
        v_kuk := 100;
        v_eng := 93;
        v_tot := v_kuk + v_eng;
        v_avg := v_tot / 2.0;
        INSERT INTO sungjuk(no, kuk, eng, tot, avg)
        VALUES(v_no, v_kuk, v_eng, v_tot, v_avg);
    END LOOP;
 
    COMMIT WORK;  -- transaction commit
END sungjuk_ins1000;
/
--Procedure SUNGJUK_INS1000��(��) �����ϵǾ����ϴ�.
  
2. ���ν��� ����
-- 1000���� insert
begin
  sungjuk_ins1000;
end;
/
 
SELECT count(*) FROM sungjuk;
--   COUNT(*)
------------
--      1000
 
SELECT * FROM sungjuk WHERE no <= 10;

 
-- exec ������� ���ν��� ����, SQLExplorer�� �ȵ�
-- SQL developer������ ���� �ȴ�
exec sungjuk_ins1000; 
  
SELECT count(*) FROM sungjuk;
--   COUNT(*)
------------
--      2000
  
     
[02] IN �Ű�����
   - ���ν����� �Ķ���͸� ���� �� �� �ֽ��ϴ�.
 
 
1. INSERT�� ����
 
DROP TABLE emp PURGE;
 
CREATE TABLE emp(
   empno    number(5)   not null,
   ename    varchar(20) null,
   job      varchar(10) null,
   mgr      number(5)   null,
   hiredate date        null,
   sal      number(10)  null,
   comm     number(3,2) null,
   deptno    number(5)  null,
   CONSTRAINT emp_empno_pk PRIMARY KEY(empno)  --�ߺ��� ���� �ü� ����, �ݵ�� ���� �Է�
);
    
DROP SEQUENCE emp_seq;
 
CREATE SEQUENCE emp_seq
start with 1    -- �Ϸ� ��ȣ ���� ��
increment by 1  -- ���� ��
cache 2;   
   
   
INSERT INTO emp(empno, ename, deptno) VALUES(emp_seq.NextVal, 'ȫ�浿', 10);
INSERT INTO emp(empno, ename, deptno) VALUES(emp_seq.NextVal, '���浿', 20);
INSERT INTO emp(empno, ename, deptno) VALUES(emp_seq.NextVal, '���浿', 30);
INSERT INTO emp(empno, ename, deptno) VALUES(emp_seq.NextVal, 'ȫ���', 40);
 
COMMIT;
 
SELECT * FROM emp;
     EMPNO ENAME                JOB               MGR HIREDATE        SAL       COMM     DEPTNO
---------- -------------------- ---------- ---------- -------- ---------- ---------- ----------
        1 ȫ�浿                                                                            10
        2 ���浿                                                                            20
        3 ���浿                                                                            30
        4 ȫ���                                                                            40

-- is ���� ������ ����� -> �Ķ����
-- is �Ʒ����� ��������
CREATE OR REPLACE PROCEDURE ins_emp(
    i_emp_name IN emp.ename%TYPE, -- ���ν��� ȣ��� �̿��� ���μ�(�Ķ����)
    i_emp_job  IN emp.job%TYPE,   -- ���̺��.�÷���%TYPE
    i_emp_mgr  IN emp.mgr%TYPE,
    i_emp_sal  IN emp.sal%TYPE
)
IS
    v_emp_comm emp.comm%TYPE; --���ν������� ����ϴ� ��������
BEGIN
    IF i_emp_job ='SALESMAN' THEN -- ������ �����̸�
        v_emp_comm :=0.03;   -- 3 % ���� ����
    ELSE
        v_emp_comm :=0.01;   -- 1 % ���� ����
    END IF;
 
    INSERT INTO emp(empno, ename, job, mgr, hiredate, sal, comm)
    VALUES(emp_seq.NextVal, i_emp_name, i_emp_job, i_emp_mgr, sysdate, i_emp_sal, v_emp_comm);
 
    COMMIT WORK;
END ins_emp;
/
 
begin
  ins_emp('���浿', 'SALESMAN',1,1500000);
  ins_emp('���浿', 'developer',1,2000000);
end;
/
 
-- ��ҹ��� �����մϴ�. SQL Explorer�� �ȵ�
exec ins_emp('�ٱ浿', 'salesman',1,1800000);
 
 
SELECT * FROM emp;
     EMPNO ENAME                JOB               MGR HIREDATE        SAL       COMM     DEPTNO
---------- -------------------- ---------- ---------- -------- ---------- ---------- ----------
         1 ȫ�浿                                                                            10
         2 ���浿                                                                            20
         3 ���浿                                                                            30
         4 ȫ���                                                                            40
         5 ���浿               SALESMAN            1 18/12/13    1500000        .03           
         6 ���浿               developer           1 18/12/13    2000000        .01           
         7 �ٱ浿               salesman            1 18/12/13    1800000        .01           
         
 
2. stu ���̺��� ����, ����� ���ϰ� INSERT ������ �����ϴ� 
   ���ν����� �ۼ��ϼ���.
 
 ������ �˰����� ���ν����� ���� �ʴ� ���� ����
�� ������ �� ���, ���������� ���ν��� ���� ����.
���ν����� �ַ� ����Ŭ������ ����Ѵ�.

 
CREATE TABLE stu(
    stuno   NUMBER(5)    NOT NULL,
    name VARCHAR2(10) NOT NULL,
    kuk  NUMBER(3)    NOT NULL,
    eng  NUMBER(3)    NOT NULL,
    tot  NUMBER(3)    NOT NULL,
    avg  NUMBER(5,2)  NOT NULL,
    CONSTRAINT stu_no_pk PRIMARY KEY(stuno)  --�ߺ��� ���� �ü� ����, �ݵ�� ���� �Է�
);
 
 
CREATE SEQUENCE stu_seq
START WITH 1    -- �Ϸ� ��ȣ ���� ��
INCREMENT BY 1  -- ���� ��
CACHE 2;   
 
CREATE OR REPLACE PROCEDURE stu_ins(
    i_name     IN stu.name%TYPE, -- ���μ�, �Ķ����
    i_kuk      IN stu.kuk%TYPE,  
    i_eng      IN stu.eng%TYPE
)
IS
    v_tot stu.tot%TYPE; --���ν������� ����ϴ� ���� ��������
    v_avg stu.avg%TYPE;
BEGIN
    v_tot := i_kuk + i_eng; -- ���� ���
    v_avg := v_tot/2.0;     -- ��� ��� 
 
    INSERT INTO stu(stuno, name, kuk, eng, tot, avg)
    VALUES(stu_seq.NextVal, i_name, i_kuk, i_eng, v_tot, v_avg);
    
    COMMIT WORK;  
END stu_ins;
/
 
begin
  stu_ins('���浿', 100, 93);
  stu_ins('���浿', 90, 85);
  stu_ins('�ٱ浿', 100, 90);
end;
/
 
SELECT * FROM stu;

-- NVL, MAX �Լ��� ���, subquery ��� 
CREATE OR REPLACE PROCEDURE stu_ins2(
    i_name     IN stu.name%TYPE, -- ���μ�
    i_kuk      IN stu.kuk%TYPE,  
    i_eng      IN stu.eng%TYPE
)
IS
    v_tot stu.tot%TYPE; --���ν������� ����ϴ� ���� ��������
    v_avg stu.avg%TYPE;
BEGIN
    v_tot := i_kuk + i_eng; -- ���� ���
    v_avg := v_tot/2.0;     -- ��� ��� 
 
    INSERT INTO stu(stuno, name, kuk, eng, tot, avg)
    VALUES((SELECT NVL(MAX(stuno), 0) + 1 FROM stu),
     i_name, i_kuk, i_eng, v_tot, v_avg);
    
    COMMIT WORK;  
END stu_ins2;
/
  
begin
  stu_ins2('���浿', 100, 93);
  stu_ins2('���浿', 90, 85);
  stu_ins2('�ٱ浿', 100, 90);
end;
/
 
SELECT * FROM stu;
  
   
    
[03] OUT �Ű�����
   - ���ν����κ��� ���� ������ �� �ֽ��ϴ�.
 -- SELECT ����� ������ �� ���
 -- ���� ������ ����
 
 
1. �÷����� ����ϴ� ���ν���
 
CREATE OR REPLACE PROCEDURE query_emp (
    i_emp_no    IN  emp.empno%TYPE, -- IN �� �Է�
    o_emp_name  OUT emp.ename%TYPE, -- OUT �� ���
    o_emp_sal   OUT emp.sal%TYPE,   -- OUT �� ���
    o_emp_comm  OUT emp.comm%TYPE   -- OUT �� ���
)
IS
BEGIN
    SELECT ename, sal, comm
    INTO o_emp_name, o_emp_sal, o_emp_comm -- output �Ű����� ��� ��
    FROM emp
    WHERE empno = i_emp_no;  -- IN �Ű� ������ ���� ��
END query_emp;
/
 
SELECT empno, ename, sal, comm FROM emp;
 
     EMPNO ENAME                       SAL       COMM
---------- -------------------- ---------- ----------
        1 ȫ�浿                                    
        2 ���浿                                    
        3 ���浿                                    
        4 ȫ���                                    
        5 ���浿                  1500000        .03
        6 ���浿                  2000000        .01
        7 �ٱ浿                  1800000        .01  
 
-- emp ���̺��� �����ϴ� empno�� ����� ��.
DECLARE
    emp_name varchar2(20) := null;
    emp_sal number := 0;
    emp_comm number := 0;
BEGIN
   query_emp(5, emp_name, emp_sal, emp_comm);
   DBMS_OUTPUT.PUT_LINE(emp_name);
   DBMS_OUTPUT.PUT_LINE(emp_sal);
   DBMS_OUTPUT.PUT_LINE(emp_comm);
END;
/
 
 
2. IN/OUT �Ű�����

CREATE OR REPLACE PROCEDURE add_one(
    io_phone_no       IN OUT VARCHAR2
)
IS
BEGIN
    io_phone_no := SUBSTR(io_phone_no, 1, 3) || '-' || SUBSTR(io_phone_no, 4, length(io_phone_no));
END add_one;
/
 
DECLARE
    phone_num VARCHAR2(15) := '12312341234';
BEGIN
   add_one(phone_num);
   DBMS_OUTPUT.PUT_LINE(phone_num);
END;
/
 
  
   
[04] ���� ���� ������ �����ϴ� ���ν���
 
1. �α��� ������ �����ϴ� ���ν���(�α� ���)

DROP TABLE log2 PURGE;
 
CREATE TABLE log2(
    num       NUMBER(5) NOT NULL,  -- �Ϸù�ȣ
    userid    VARCHAR2(20),        -- oracle user ID
    log_date  DATE,                -- ���� ������
    query     VARCHAR2(1000),      -- ���� ���� ����   
    CONSTRAINT log2_num_pk PRIMARY KEY(num)  --�ߺ��� ���� �ü� ����, �ݵ�� ���� �Է�
);
 
-- user: ����Ŭ ���� ������ ������ ����. 
CREATE SEQUENCE log2_seq
start with 1    -- �Ϸ� ��ȣ ���� ��
increment by 1  -- ���� ��
cache 2;  
 
CREATE OR REPLACE PROCEDURE log_execution2(
    i_query  IN log2.query%TYPE -- ������ ���� �޽��ϴ�.
)
IS
BEGIN
    INSERT INTO log2(num, userid, log_date, query)
    VALUES(log2_seq.NextVal, user, sysdate, i_query);
 
    COMMIT;
END log_execution2;
/
 
 
SELECT user, sysdate FROM dual;
 
 
begin
  log_execution2('DELETE FROM sungjuk WHERE stuno=1');
end;
/
 
 
SELECT userid, TO_CHAR(log_date, 'YYYYMMDD HH:MI:SS'), query FROM log2;
 
 
-- ���ν��� ����
DROP PROCEDURE log_execution2;
     