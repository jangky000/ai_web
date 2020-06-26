DROP TABLE coupon CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 이벤트쿠폰 */
/**********************************/
CREATE TABLE coupon(
		couponno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cpimg                         		VARCHAR2(100)		 NULL ,
		cpname                        		VARCHAR2(200)		 NOT NULL,
		cpdiscount                    		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		cpstock                       		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		cpcate                        		VARCHAR2(100)		 NULL 
);

COMMENT ON TABLE coupon is '이벤트쿠폰';
COMMENT ON COLUMN coupon.couponno is '쿠폰no';
COMMENT ON COLUMN coupon.cpimg is '쿠폰이미지';
COMMENT ON COLUMN coupon.cpname is '쿠폰이름';
COMMENT ON COLUMN coupon.cpdiscount is '쿠폰할인금액';
COMMENT ON COLUMN coupon.cpstock is '쿠폰재고';
COMMENT ON COLUMN coupon.cpcate is '사용가능카테고리';

DROP SEQUENCE coupon_seq;
CREATE SEQUENCE coupon_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- couponno, cpimg, cpname, cpdiscount, cpstock, cpcate

-- CREATE
INSERT INTO coupon(couponno, cpimg, cpname, cpdiscount, cpstock, cpcate)
VALUES(coupon_seq.nextval, './sample.png', '1000원 할인 쿠폰', 1000, 100, '1|2|3|4|5');

INSERT INTO coupon(couponno, cpimg, cpname, cpdiscount, cpstock, cpcate)
VALUES(coupon_seq.nextval, './sample.png', '2000원 할인 쿠폰', 2000, 100, '1|2|3|4|5');

INSERT INTO coupon(couponno, cpimg, cpname, cpdiscount, cpstock, cpcate)
VALUES(coupon_seq.nextval, './sample.png', '배송료 할인 쿠폰', 2500, 100, '1|2|3|4|5');

COMMIT;

-- LIST
SELECT couponno, cpimg, cpname, cpdiscount, cpstock, cpcate
FROM coupon
ORDER BY couponno DESC;

-- READ
SELECT couponno, cpimg, cpname, cpdiscount, cpstock, cpcate
FROM coupon
WHERE couponno = 1;

-- UPDATE
-- 수량 감소
UPDATE coupon 
SET cpstock=cpstock-1
WHERE couponno = 1;

-- 이미지 변경
UPDATE coupon 
SET cpimg='./sample2.png'
WHERE couponno = 1;

-- 쿠폰 이름, 할인 금액, 재고, 사용가능 카테고리 변경
UPDATE coupon 
SET cpname='10000원 할인 쿠폰', cpdiscount=10000, cpstock=100, cpcate='1|2|3|4|5'
WHERE couponno = 1;

-- DELETE
DELETE FROM coupon
WHERE couponno = 1;

ROLLBACK;