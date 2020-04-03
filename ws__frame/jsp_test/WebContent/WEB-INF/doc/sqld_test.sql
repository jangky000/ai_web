DROP TABLE sqld_test;

CREATE TABLE sqld_test(
sqldid NUMBER(10) NOT NULL,
col1 NUMBER(10) CHECK (col1 < 5),
col2 NUMBER(10),
PRIMARY KEY(sqldid)
);

-- 제약조건 변경
ALTER TABLE sqld_test 
ADD CONSTRAINT col1_check CHECK(col1 < 5);

-- 제약 조건 위배로 오류 발생
INSERT INTO sqld_test(sqldid, col1)
VALUES (1, 5);

-- NULL이지만 제약 조건 무시하고 그냥 삽입됨
INSERT INTO sqld_test(sqldid, col1)
VALUES (1, NULL);

SELECT * FROM sqld_test;