-- 첫번째 레코드 등록시 생성될 PK 값을 FK 값으로 사용해야 최초 등록 가능. 
-- 두번째부터는 FK값으로 생성될 PK를 지정.
           
DROP TABLE position;

-- 직책
CREATE TABLE position(
  positionno NUMBER(5) NOT NULL,
  name       VARCHAR(30) NOT NULL, 
  employee  VARCHAR(30) NOT NULL,
  officer     NUMBER(5) NOT NULL,
  PRIMARY KEY(positionno),
  FOREIGN KEY(officer) REFERENCES position(positionno) -- 자기 자신의 PK
);

COMMENT ON TABLE position is '직책';
COMMENT ON COLUMN position.positionno is '직책 번호';
COMMENT ON COLUMN position.name is '직책 이름';
COMMENT ON COLUMN position.employee is '사원명';
COMMENT ON COLUMN position.officer is '상급 직책 사원명';

-- FK가 생성될 PK를 값으로하는 경우, 첫번째 레코드만 예외적으로 최초 등록 가능
-- 반드시 PK가 먼저 등록되어 있어야 함

-- 시퀀스를 쓰지 않고 시퀀스 넘버를 제작
SELECT MAX(positionno) as positionno FROM position;

POSITIONNO
----------
null

SELECT MAX(positionno) + 1 as positionno FROM position;
-- null + 1 = null
-- null은 사칙 연산 후에도 null
POSITIONNO
----------
null

SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position;
-- null을 특정 값(0)으로 바꾸기 위해 NVL(col, 0) 함수를 사용
POSITIONNO
----------
         1

INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '대표이사', '아로미', 1);
            
SELECT positionno,name, employee, officer
FROM position
ORDER BY positionno ASC;
-- 첫번째 레코드만 자기 자신을 참조하게 할 수 있음
 POSITIONNO NAME     EMPLOYEE OFFICER
 ---------------- -------     ------------- ----------
          1        대표이사  아로미            1
          
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '이사', '피어스', 10);
-- ORA-02291: integrity constraint (AI3.SYS_C007082) violated - parent key not found

-- 이사의 상관은 대표이사           
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '이사', '왕눈이', 1);

SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         대표이사  아로미            1
          2         이사        왕눈이            1

-- 상무의 상관은 이사     
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '상무', '가길동', 2);

SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         대표이사  아로미            1
          2         이사        왕눈이            1
          3         상무        가길동            2

-- 부장의 상관은 상무            
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '부장', '나길동', 3);
       
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         대표이사  아로미            1
          2         이사        왕눈이            1
          3         상무        가길동            2
          4         부장        나길동            3

INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '차장', '다길동', 4);

-- 차장의 상관은 부장   
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         대표이사  아로미            1
          2         이사        왕눈이            1
          3         상무        가길동            2
          4         부장        나길동            3
          5         차장        다길동            4

-- 과장의 상관은 차장
INSERT INTO position(positionno,
                                 name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '과장', '라길동', 5);

INSERT INTO position(positionno,
                                 name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '과장2', '휴잭맨', 5);
       
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         대표이사  아로미            1
          2         이사        왕눈이            1
          3         상무        가길동            2
          4         부장        나길동            3
          5         차장        다길동            4
          6         과장        라길동            5
          7         과장2      휴잭맨             5

-- 대리의 상관은 과장
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '대리', '마길동', 6);
       
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         대표이사  아로미            1
          2         이사        왕눈이            1
          3         상무        가길동            2
          4         부장        나길동            3
          5         차장        다길동            4
          6         과장        라길동            5
          7         과장2      휴잭맨             5
          8         대리        마길동            6

INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '대리', '홍길순', 6);
       
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         대표이사  아로미            1
          2         이사        왕눈이            1
          3         상무        가길동            2
          4         부장        나길동            3
          5         차장        다길동            4
          6         과장        라길동            5
          7         과장2      휴잭맨             5
          8         대리        마길동            6
          9         대리        홍길순            6
          
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '주임', '강하늘', 9);
       
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         대표이사  아로미            1
          2         이사        왕눈이            1
          3         상무        가길동            2
          4         부장        나길동            3
          5         차장        다길동            4
          6         과장        라길동            5
          7         과장2      휴잭맨             5
          8         대리        마길동            6
          9         대리        홍길순            6
          10         주임        강하늘            9
          
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '사원', '공효진', 10);
       
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         대표이사  아로미            1
          2         이사        왕눈이            1
          3         상무        가길동            2
          4         부장        나길동            3
          5         차장        다길동            4
          6         과장        라길동            5
          7         과장2      휴잭맨             5
          8         대리        마길동            6
          9         대리        홍길순            6
        10         주임        강하늘            9
        11         사원        공효진            10
          
-- Self join
SELECT p.positionno, p.name, p.employee, p.officer,
          c.name, c.employee
FROM position p, position c
WHERE p.officer = c.positionno 
ORDER BY positionno ASC;

 POSITIONNO NAME EMPLOYEE OFFICER NAME EMPLOYEE
 ---------- ---- -------- ------- ---- --------
          1 대표이사 아로미            1 대표이사 아로미
          2 이사       왕눈이            1 대표이사 아로미
          3 상무       가길동            2 이사   왕눈이
          4 부장       나길동            3 상무   가길동
          5 차장       다길동            4 부장   나길동
          6 과장       라길동            5 차장   다길동
          7 대리       마길동            6 과장   라길동
          8 대리       홍길순            6 과장   라길동
          9 주임       강하늘            7 대리   마길동
         10 사원      공효진            9 주임   강하늘
          
-- 참고: FK 선언 없이 테이블 생성후 하나의 마스터 레코드(최초 등록) 입력후
-- FK 제약 조건 추가             
ALTER TABLE position ADD CONSTRAINT position_pk PRIMARY KEY (positionno);

ALTER TABLE position ADD CONSTRAINT position_officer_fk 
                                 FOREIGN KEY (officer) REFERENCES position (positionno);