--1. 견본 테이블 생성

DROP TABLE pay PURGE;
 
CREATE TABLE pay(
    name varchar(10) NOT NULL,
    pay  number(7)   NOT NULL,
    tax  number(6)   DEFAULT 0
);
 
 -- 테이블 목록을 보여줌
SELECT * FROM tab;
 
 
--2. COMMIT(INSERT, UPDATE, DELETE 적용)
 
INSERT INTO pay(name,pay,tax) VALUES('왕눈이', 2000000, 100000);
 
-- 실제 DBMS에 적용 -- 디스크 상에 저장
COMMIT;
 
SELECT * FROM pay;
 
 
--3. ROLLBACK
 
DELETE FROM pay WHERE name='왕눈이';
 
SELECT * FROM pay;
 
-- 삭제된 레코드가 복구 됩니다., ROLLBACK
ROLLBACK WORK;   -- == 보통 ROLLBACK; 이라고 쓴다. 
 
SELECT * FROM pay;
 
 
 
--4. 여러단계의 복구
 
DELETE FROM pay WHERE name='왕눈이';
 
SELECT * FROM pay;
 -- 레코드 없음
 
-- 아로미 추가
INSERT INTO pay(name,pay,tax) VALUES('아로미', 2200000, 120000);
 
SELECT * FROM pay;
 
 
-- 아로미의 급여를 10% 인상합니다.
UPDATE pay SET pay=pay * 1.1 WHERE name='아로미';
 
SELECT * FROM pay;
 
 
-- 아로미의 세금을 11% 인상합니다.
UPDATE pay SET tax=tax * 0.11 WHERE name='아로미';
 
SELECT * FROM pay;
 
 
-- 최초 상태로 돌아갑니다.
-- delete 1 + insert 1 + update 2 -> 다 취소
ROLLBACK WORK;
 
SELECT * FROM pay;
 
 
--5. SAVEPOINT
   - 특정 지점으로 ROLLBACK할 수 있는 기능을 제공합니다.
 
-- 원본 데이터 상태
SAVEPOINT first;
 
INSERT INTO pay(name,pay,tax) VALUES('아로미', 3000000, 300000);
 
SELECT * FROM pay;
-- NAME              PAY        TAX
------------ ---------- ----------
--왕눈이        2000000     100000
--아로미        3000000     300000
 
UPDATE pay SET pay=3500000, tax=350000;
 
SELECT * FROM pay;
-- NAME              PAY        TAX
------------ ---------- ----------
--왕눈이        3500000     350000
--아로미        3500000     350000
 
SAVEPOINT second;
 
 
INSERT INTO pay(name,pay,tax) VALUES('투투', 4000000, 400000);
 
SELECT * FROM pay;
--  NAME              PAY        TAX
------------ ---------- ----------
--왕눈이        3500000     350000
--아로미        3500000     350000
--투투          4000000     400000
 
-- SAVEPOINT second 지역으로 복구합니다. --> 투투를 삽입하기 전
ROLLBACK TO SAVEPOINT second;

 
SELECT * FROM pay;
-- NAME              PAY        TAX
------------ ---------- ----------
--왕눈이        3500000     350000
--아로미        3500000     350000
 
ROLLBACK TO SAVEPOINT first; -- 왕눈이만 삽입했을 때로 돌아감
 
SELECT * FROM pay;
-- NAME              PAY        TAX
------------ ---------- ----------
--왕눈이        2000000     100000
 
6. READ Consistency(읽기 일관성)
   - 툴마다 commit 되는 방식이 다르다
   - iSQL+ 는 브러우저를 닫으면 COMMIT 됩니다.
   - SQL+는 창을 닫으면 ROLLBACK 됩니다.
   - SQL+는 exit명령을 내리면 COMMIT됩니다.
     따라서 로그아웃시에는 반드시 명시적으로 ROLLBACK, COMMIT명령 
     사용을 권장 합니다.
 
   USER 1 --- 임시 영역 ---+   +--- COMMIT  ----- Data Area
                                  +--+ 
   USER 1 --- 임시 영역 ---+   +--- ROLLBACK
   
   
 -- run sql cmd line에서 동시에 db에 접근
 
--1)  준비: sql developer 에서 실행
DELETE FROM pay;
INSERT INTO pay(name,pay,tax) VALUES('왕눈이', 2000000, 100000);
COMMIT;
 
 SELECT * FROM pay;
 
--2) SQL command Line
CONNECT ai6/1234 -- ai6 접속

SELECT * FROM pay;
-- NAME              PAY        TAX
------------ ---------- ----------
--왕눈이        2000000     100000
 
INSERT INTO pay(name, pay, tax) VALUES('아로미', 1700000, 50000);
 
SELECT * FROM pay;
-- NAME                        PAY        TAX
---------------------- ---------- ----------
--왕눈이                  2000000     100000
--아로미                  1700000      50000
 
3) SQL developer에서 : ai6, 변경된 데이터 아로미를 읽을 수 없습니다.
SELECT * FROM pay;
-- NAME              PAY        TAX
------------ ---------- ----------
--왕눈이        2000000     100000
 
 -- -> 결과가 다르다, commit 하지 않았기 때문에, 각자 다른 메모리를 사용하고 있다.
 
--4) SQL command Line ai6
--COMMIT;
 
--5)SQL developer: ai6, COMMIT이 되었음으로 변경된 데이터를 읽을 수 있습니다.
SELECT * FROM pay;
-- NAME              PAY        TAX
------------ ---------- ----------
--왕눈이        2000000     100000
--아로미        1700000      50000
  
-------------------------------------------------------------------------------------
 
 