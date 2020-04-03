DROP TABLE sqld_test;

CREATE TABLE sqld_test(
sqldid NUMBER(10) NOT NULL,
col1 NUMBER(10) CHECK (col1 < 5),
col2 NUMBER(10),
PRIMARY KEY(sqldid)
);

-- �������� ����
ALTER TABLE sqld_test 
ADD CONSTRAINT col1_check CHECK(col1 < 5);

-- ���� ���� ����� ���� �߻�
INSERT INTO sqld_test(sqldid, col1)
VALUES (1, 5);

-- NULL������ ���� ���� �����ϰ� �׳� ���Ե�
INSERT INTO sqld_test(sqldid, col1)
VALUES (1, NULL);

SELECT * FROM sqld_test;