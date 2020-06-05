DROP TABLE porder CASCADE CONSTRAINTS;
DROP TABLE mem CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE mem(
		memno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE mem is '회원';
COMMENT ON COLUMN mem.memno is '회원no';


DROP SEQUENCE mem_seq;
CREATE SEQUENCE mem_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

INSERT INTO mem(memno) VALUES (mem_seq.nextval);
INSERT INTO mem(memno) VALUES (mem_seq.nextval);
INSERT INTO mem(memno) VALUES (mem_seq.nextval);

SELECT * FROM mem;

/**********************************/
/* Table Name: 주문 */
/**********************************/
CREATE TABLE porder(
		porderno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memno                         		NUMBER(10)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		item_price_sum                		NUMBER(10)		 NOT NULL,
		item_discount_sum             		NUMBER(10)		 NOT NULL,
		coupon_discount_sum           		NUMBER(10)		 NOT NULL,
		delivery_fee                  		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		payment_price                 		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		porder_status                 		CHAR(1)		 NOT NULL,
		porder_address                		VARCHAR2(1000)		 NOT NULL,
        FOREIGN KEY (memno) REFERENCES mem(memno)
);

COMMENT ON TABLE porder is '주문';
COMMENT ON COLUMN porder.porderno is '주문no';
COMMENT ON COLUMN porder.memno is '회원no';
COMMENT ON COLUMN porder.rdate is '주문날짜';
COMMENT ON COLUMN porder.item_price_sum is '판매가총액';
COMMENT ON COLUMN porder.item_discount_sum is '할인총액';
COMMENT ON COLUMN porder.coupon_discount_sum is '쿠폰할인';
COMMENT ON COLUMN porder.delivery_fee is '배송비';
COMMENT ON COLUMN porder.payment_price is '최종결제금액';
COMMENT ON COLUMN porder.porder_status is '승인 상태';
COMMENT ON COLUMN porder.porder_address is '배송지';

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
INSERT INTO porder(porderno, memno, rdate, item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee, payment_price, porder_status, porder_address)
VALUES(porder_seq.nextval, 1, sysdate, 10000, 1000, 1000, 2500, 5500, 'R', '서울특별시 강남구');
INSERT INTO porder(porderno, memno, rdate, item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee, payment_price, porder_status, porder_address)
VALUES(porder_seq.nextval, 2, sysdate, 20000, 1000, 1000, 2500, 15500, 'R', '서울특별시 송파구');
INSERT INTO porder(porderno, memno, rdate, item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee, payment_price, porder_status, porder_address)
VALUES(porder_seq.nextval, 3, sysdate, 30000, 1000, 1000, 2500, 25500, 'R', '경기도 성남시');

COMMIT;

-- LIST
-- 관리자
SELECT porderno, memno, rdate, item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee, payment_price, porder_status, porder_address
FROM porder
ORDER BY porderno DESC;

-- 사용자
SELECT porderno, memno, rdate, item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee, payment_price, porder_status, porder_address
FROM porder
WHERE memno=1
ORDER BY porderno DESC;

-- READ
-- 관리자
SELECT porderno, memno, rdate, item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee, payment_price, porder_status, porder_address
FROM porder
WHERE porderno = 1 AND memno=1;

-- 사용자
SELECT porderno, memno, rdate, item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee, payment_price, porder_status, porder_address
FROM porder
WHERE porderno = 1 AND memno=1;

-- Update 
-- refund
UPDATE porder
SET item_price_sum=10000, item_discount_sum=1000, coupon_discount_sum=1000, delivery_fee=2500, payment_price=5500
WHERE porderno = 1;

-- status
UPDATE porder
SET porder_status='C'
WHERE porderno = 1;

-- address
UPDATE porder
SET porder_address='경기도 수원시'
WHERE porderno = 1;


-- Delete
DELETE FROM porder
WHERE porderno=3;

-- 시퀀스 확인
SELECT *
FROM user_sequences;

