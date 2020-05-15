DROP TABLE porder CASCADE CONSTRAINTS;
/**********************************/
/* Table Name: 주문 */
/**********************************/
CREATE TABLE porder(
		porderno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		VARCHAR2(10)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		total_price                   		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		status                        		CHAR(1)		 NOT NULL,
		productno                     		NUMBER(10)		 NULL 
);

COMMENT ON TABLE porder is '주문';
COMMENT ON COLUMN porder.porderno is '주문no';
COMMENT ON COLUMN porder.memberno is '회원번호';
COMMENT ON COLUMN porder.rdate is '주문날짜';
COMMENT ON COLUMN porder.total_price is '주문총액';
COMMENT ON COLUMN porder.status is '주문상태';
COMMENT ON COLUMN porder.productno is '상품 등록 번호';

DROP SEQUENCE porder_seq;
CREATE SEQUENCE porder_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- CREATE
-- R: ready
-- C: complete
INSERT INTO porder(porderno, memberno, rdate, total_price, status, productno)
VALUES(porder_seq.nextval, 1, sysdate, 1000, 'R', 1);

-- LIST
SELECT porderno, memberno, rdate, total_price, status, productno
FROM porder;

--READ
SELECT porderno, memberno, rdate, total_price, status, productno
FROM porder
WHERE porderno = 1;

-- Update
UPDATE porder
SET memberno=1, total_price=1000, status='C', productno=1
WHERE porderno = 1;

-- Delete
DELETE FROM porder
WHERE porderno=1;

