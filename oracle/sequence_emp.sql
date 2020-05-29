[02] Sequecne
- 레코드는 고유하게 구분되어야함으로 고유한 값이 필요함으로
  데이터를 구분값으로 사용하는 경우가 있고 Sequence즉 일련번호처럼
  오라클에서 생성되는 값을 사용하는 경우도 있음.
 
  START WITH 1: 일련번호 1부터 시작
  INCREMENT BY 1: 일련번호를 1 씩 증가
  CACHE 2: 시퀀스를 테이블에 저장함으로 자주 Update가 발생함으로
           이것을 줄이기위해 메모리에서 일련번호를 증가시키며
           CACHE 명령을 이용해 증가 단위를 정의할 수 있음, 
           메모리에서 일련번호 증가, 처리 속도 향상,
           기본값은 20임, INSERT가 많이 발생하면 기본값을 길게 해줌

- MySQL은 'auto_increment'를 지정합니다.
  memono INT NOT NULL AUTO_INCREMENT PRIMARY KEY
 
▷ /ai3/oracle/sequence.sql
-------------------------------------------------------------------------------------
 
DROP TABLE emp;
 
CREATE TABLE emp(
    num           number(7)   not null,
    name          varchar(10) not null,
    salary        number(7)   not null,
    department_id number(4)   not null
);
 
CREATE SEQUENCE emp_seq
    INCREMENT BY 1          -- 증가 값
    START WITH   1           -- 1부터 시작
    MAXVALUE     9999999  -- 최대값
    CACHE 20            -- 20단위로 시스템 테이블에 저장
    NOCYCLE;            -- 최대 99999까지가서 다시 순환하지 말것 
    
    
    
DROP SEQUENCE emp_seq;
 
 
INSERT INTO emp(num,name, salary,department_id)
VALUES(emp_seq.NextVal,'aaa', 1000000, 20);
INSERT INTO emp(num,name, salary,department_id)
VALUES(emp_seq.NextVal,'bbb', 1100000, 20);
INSERT INTO emp(num,name, salary,department_id)
VALUES(emp_seq.NextVal,'ccc', 1200000, 20);
 
SELECT * FROM emp;
 
 
COMMIT;
 
 
-- 생성된 Sequence 모두 출력
SELECT *
FROM user_sequences;
 
-- 다음 sequence값을 볼 수 있으나 계속적으로 값이 증가됩니다.
SELECT emp_seq.nextval as seq FROM dual;
--        SEQ
------------
--         5
 
-- 현재 sequence를 봅니다. 반복해서 실행해도 값이 증가되지 않음
SELECT emp_seq.currval FROM dual;
--    CURRVAL
------------
--         5
 
 
-------------------------------------------------------------------------------------
 
 