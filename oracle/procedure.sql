-- �Լ� ��� Ȱ��ȭ
-- DBMS_OUTPUT.PUT_LINE �Լ��� ����� �� �ִ�.
SET SERVEROUTPUT ON; 
 
1. �񱳹�
 
 -- if ~ endif
DECLARE
    v_condition number := 1; -- ���� ����
BEGIN
    IF v_condition = 1 THEN -- ��� 
        DBMS_OUTPUT.PUT_LINE('�������� ���� 1�Դϴ�.'); -- Oracle ���� ���� ���, �ڹٿ����� �� �� ����
    END IF;
END;
/ -- ���ν����� ���Ḧ ǥ��, ���ν��� end mark
 
-- �������� ���� 1�Դϴ�.
--PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
 


DECLARE
    v_condition number :=1;
BEGIN
    IF v_condition > 1 THEN
        DBMS_OUTPUT.PUT_LINE('�������� ���� 1���� Ů�ϴ�.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('�������� ���� 1���� �۰ų� �����ϴ�.');
    END IF;
END;
/
 
 
 -- if ~ elsif ~ endif
DECLARE
    v_condition number :=2;
BEGIN
    IF v_condition > 1 THEN
        DBMS_OUTPUT.PUT_LINE('�������� ���� 1���� Ů�ϴ�.');
    ELSIF v_condition = 1 THEN
        DBMS_OUTPUT.PUT_LINE('�������� ���� 1�Դϴ�.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('�������� ���� 1���� �۽��ϴ�.');
    END IF;
END;
/
 
 
 
2. �ݺ���
 -- do while�� ����
DECLARE
    cnt number := 0;
BEGIN
    LOOP
        cnt := cnt + 1;
        DBMS_OUTPUT.PUT_LINE(cnt);
        EXIT WHEN cnt = 10;
    END LOOP;
END;
/
-- 1
--2
--3
--4
--5
--6
--7
--8
--9
--10
--
--
--PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
 
 -- ���� ��� ����
BEGIN
    FOR i IN 1..10 LOOP         -- i ������ ���� 1���� 10���� 1�� ���� 
      DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/
 
 -- Ȧ���� ���
BEGIN
    FOR i IN 1..10 LOOP         -- i ������ ���� 1���� 10���� 1�� ���� 
        IF (MOD(i, 2) = 1) THEN -- Ȧ���� ���
            DBMS_OUTPUT.PUT_LINE(i);
        END IF;
    END LOOP;
END;
/
 
 
 -- while ��
DECLARE
    v_cnt number := 0;
    v_str varchar2(10) := null;
BEGIN
    WHILE v_cnt <= 10 LOOP     -- v_cnt 10���� �۰ų� ���� ���� ����
        v_cnt := v_cnt+1;
        DBMS_OUTPUT.PUT_LINE(v_cnt);
    END LOOP;
END;
/
 
 