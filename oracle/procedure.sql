-- 함수 출력 활성화
-- DBMS_OUTPUT.PUT_LINE 함수를 사용할 수 있다.
SET SERVEROUTPUT ON; 
 
1. 비교문
 
 -- if ~ endif
DECLARE
    v_condition number := 1; -- 변수 선언
BEGIN
    IF v_condition = 1 THEN -- 제어문 
        DBMS_OUTPUT.PUT_LINE('데이터의 값은 1입니다.'); -- Oracle 접속 툴에 출력, 자바에서는 볼 수 없음
    END IF;
END;
/ -- 프로시저의 종료를 표시, 프로시저 end mark
 
-- 데이터의 값은 1입니다.
--PL/SQL 프로시저가 성공적으로 완료되었습니다.
 


DECLARE
    v_condition number :=1;
BEGIN
    IF v_condition > 1 THEN
        DBMS_OUTPUT.PUT_LINE('데이터의 값은 1보다 큽니다.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('데이터의 값은 1보다 작거나 같습니다.');
    END IF;
END;
/
 
 
 -- if ~ elsif ~ endif
DECLARE
    v_condition number :=2;
BEGIN
    IF v_condition > 1 THEN
        DBMS_OUTPUT.PUT_LINE('데이터의 값은 1보다 큽니다.');
    ELSIF v_condition = 1 THEN
        DBMS_OUTPUT.PUT_LINE('데이터의 값은 1입니다.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('데이터의 값은 1보다 작습니다.');
    END IF;
END;
/
 
 
 
2. 반복문
 -- do while의 변형
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
--PL/SQL 프로시저가 성공적으로 완료되었습니다.
 
 -- 위와 결과 같음
BEGIN
    FOR i IN 1..10 LOOP         -- i 변수의 값이 1부터 10까지 1씩 증가 
      DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/
 
 -- 홀수만 출력
BEGIN
    FOR i IN 1..10 LOOP         -- i 변수의 값이 1부터 10까지 1씩 증가 
        IF (MOD(i, 2) = 1) THEN -- 홀수만 출력
            DBMS_OUTPUT.PUT_LINE(i);
        END IF;
    END LOOP;
END;
/
 
 
 -- while 문
DECLARE
    v_cnt number := 0;
    v_str varchar2(10) := null;
BEGIN
    WHILE v_cnt <= 10 LOOP     -- v_cnt 10보다 작거나 같을 동안 실행
        v_cnt := v_cnt+1;
        DBMS_OUTPUT.PUT_LINE(v_cnt);
    END LOOP;
END;
/
 
 