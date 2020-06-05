DROP TABLE exam_order;

-- Į�� 5�� �̻�, ������ Į��1, �Ǽ��� Į��1, PK ����
CREATE TABLE exam_order(
    porderno                        NUMBER(10)     NOT NULL,
    dollar                             NUMBER(4, 2)       NOT NULL ,
    rdate                              DATE		 NOT NULL,
    status                        		 CHAR(1)		 NOT NULL,
    memberno                      NUMBER(10)		 NOT NULL, 
    PRIMARY KEY(porderno)
);

-- ���
INSERT INTO exam_order(porderno, dollar, rdate, status, memberno)
VALUES( (SELECT NVL(MAX(porderno), 0)+1 FROM exam_order), 99.99, sysdate, 'R', 1);

INSERT INTO exam_order(porderno, dollar, rdate, status, memberno)
VALUES( (SELECT NVL(MAX(porderno), 0)+1 FROM exam_order), 50, sysdate, 'R', 1);

INSERT INTO exam_order(porderno, dollar, rdate, status, memberno)
VALUES( (SELECT NVL(MAX(porderno), 0)+1 FROM exam_order), 3.3, sysdate, 'R', 1);


-- PK ���� �������� ����
SELECT porderno, dollar, rdate, status, memberno
FROM exam_order
ORDER BY porderno DESC;

-- 1���� ���ڵ� ��ȸ
SELECT porderno, dollar, rdate, status, memberno
FROM exam_order
WHERE porderno=1;

-- 1���� ���ڵ� ����
UPDATE exam_order 
SET dollar = 60
WHERE porderno=2;

-- 1���� ���ڵ� ����
DELETE FROM exam_order 
WHERE porderno=3;

-- �������� ���� �θ� ���̺� ����
DROP TABLE exam_order CASCADE CONSTRAINTS;

-- ������(single row function) �Լ� ����
SELECT TO_CHAR(rdate, 'YYYY.MM.DD') as simple_date
FROM exam_order;

-- Subquery ����¡ ����, 1������ SELECT, 1�������� 3��
SELECT porderno, dollar, rdate, status, memberno, r
FROM(SELECT porderno, dollar, rdate, status, memberno, rownum as r
         FROM (SELECT porderno, dollar, rdate, status, memberno
                   FROM exam_order
                   ORDER BY porderno DESC)
)
WHERE r>=1 AND r <= 3;


-- Transaction ��ɾ� 3��
COMMIT;

SAVEPOINT sv1;

ROLLBACK TO SAVEPOINT sv1;

ROLLBACK;

DROP VIEW view_order;

-- View 1�� �̻� ����
CREATE VIEW view_order
AS
SELECT porderno, dollar, rdate, status
FROM exam_order
WHERE dollar >= 50;

SELECT porderno, dollar, rdate, status
FROM view_order;

