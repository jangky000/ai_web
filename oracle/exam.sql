DROP TABLE exam_order;

-- 칼럼 5개 이상, 정수형 칼럼1, 실수형 칼럼1, PK 선언
CREATE TABLE exam_order(
    porderno                        NUMBER(10)     NOT NULL,
    dollar                             NUMBER(4, 2)       NOT NULL ,
    rdate                              DATE		 NOT NULL,
    status                        		 CHAR(1)		 NOT NULL,
    memberno                      NUMBER(10)		 NOT NULL, 
    PRIMARY KEY(porderno)
);

-- 등록
INSERT INTO exam_order(porderno, dollar, rdate, status, memberno)
VALUES( (SELECT NVL(MAX(porderno), 0)+1 FROM exam_order), 99.99, sysdate, 'R', 1);

INSERT INTO exam_order(porderno, dollar, rdate, status, memberno)
VALUES( (SELECT NVL(MAX(porderno), 0)+1 FROM exam_order), 50, sysdate, 'R', 1);

INSERT INTO exam_order(porderno, dollar, rdate, status, memberno)
VALUES( (SELECT NVL(MAX(porderno), 0)+1 FROM exam_order), 3.3, sysdate, 'R', 1);


-- PK 기준 내림차순 정렬
SELECT porderno, dollar, rdate, status, memberno
FROM exam_order
ORDER BY porderno DESC;

-- 1건의 레코드 조회
SELECT porderno, dollar, rdate, status, memberno
FROM exam_order
WHERE porderno=1;

-- 1건의 레코드 수정
UPDATE exam_order 
SET dollar = 60
WHERE porderno=2;

-- 1건의 레코드 삭제
DELETE FROM exam_order 
WHERE porderno=3;

-- 제약조건 무시 부모 테이블 삭제
DROP TABLE exam_order CASCADE CONSTRAINTS;

-- 단일행(single row function) 함수 선언
SELECT TO_CHAR(rdate, 'YYYY.MM.DD') as simple_date
FROM exam_order;

-- Subquery 페이징 구현, 1페이지 SELECT, 1페이지는 3개
SELECT porderno, dollar, rdate, status, memberno, r
FROM(SELECT porderno, dollar, rdate, status, memberno, rownum as r
         FROM (SELECT porderno, dollar, rdate, status, memberno
                   FROM exam_order
                   ORDER BY porderno DESC)
)
WHERE r>=1 AND r <= 3;


-- Transaction 명령어 3개
COMMIT;

SAVEPOINT sv1;

ROLLBACK TO SAVEPOINT sv1;

ROLLBACK;

DROP VIEW view_order;

-- View 1개 이상 구현
CREATE VIEW view_order
AS
SELECT porderno, dollar, rdate, status
FROM exam_order
WHERE dollar >= 50;

SELECT porderno, dollar, rdate, status
FROM view_order;

