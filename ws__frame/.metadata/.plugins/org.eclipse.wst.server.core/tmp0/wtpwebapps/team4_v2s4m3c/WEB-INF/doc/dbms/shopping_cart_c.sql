-- 상품 테이블
/**********************************/
/* Table Name: 상품 */
/**********************************/
DROP TABLE item CASCADE CONSTRAINTS;
CREATE TABLE item(
		itemno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE item is '상품';
COMMENT ON COLUMN item.itemno is '상품no';

DROP SEQUENCE item_seq;
CREATE SEQUENCE item_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

INSERT INTO item(itemno) VALUES (item_seq.nextval);
INSERT INTO item(itemno) VALUES (item_seq.nextval);
INSERT INTO item(itemno) VALUES (item_seq.nextval);

SELECT * FROM item;

/**********************************/
/* Table Name: 회원 */
/**********************************/
DROP TABLE mem CASCADE CONSTRAINTS;
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

-- 쇼핑카트 테이블
/**********************************/
/* Table Name: 장바구니 */
/**********************************/
--Shopping_cartno, productno, memberno, quantity, 
DROP TABLE shopping_cart CASCADE CONSTRAINTS;
CREATE TABLE shopping_cart(
        shopping_cartno             NUMBER(10)          NOT NULL      PRIMARY KEY,
		memno                         NUMBER(10)		NOT NULL,
		itemno                     	    NUMBER(10)		    NOT NULL,
		quantity                         NUMBER(10)		    DEFAULT 1   	 NOT NULL,
        FOREIGN KEY (memno) REFERENCES mem(memno),
        FOREIGN KEY (itemno) REFERENCES item(itemno)
);

COMMENT ON TABLE shopping_cart is '장바구니';
COMMENT ON COLUMN shopping_cart.shopping_cartno is '장바구니no';
COMMENT ON COLUMN shopping_cart.memno is '회원번호';
COMMENT ON COLUMN shopping_cart.itemno is '상품no';
COMMENT ON COLUMN shopping_cart.quantity is '수량';

DROP SEQUENCE shopping_cart_seq;
CREATE SEQUENCE shopping_cart_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- CREATE
INSERT INTO shopping_cart(shopping_cartno, memno, itemno, quantity)
VALUES(shopping_cart_seq.nextval, 1, 1, 1);
INSERT INTO shopping_cart(shopping_cartno, memno, itemno, quantity)
VALUES(shopping_cart_seq.nextval, 1, 2, 2);
INSERT INTO shopping_cart(shopping_cartno, memno, itemno, quantity)
VALUES(shopping_cart_seq.nextval, 1, 3, 3);

-- LIST
SELECT shopping_cartno, memno, itemno, quantity
FROM shopping_cart
ORDER BY shopping_cartno DESC;

-- READ
SELECT shopping_cartno, memno, itemno, quantity
FROM shopping_cart
WHERE shopping_cartno=1;

-- UPDATE
-- quantity_up
UPDATE shopping_cart
SET quantity=quantity + 1
WHERE shopping_cartno = 1;

-- quantity_down
UPDATE shopping_cart
SET quantity=quantity - 1
WHERE shopping_cartno = 1;

-- DELETE
DELETE FROM shopping_cart
WHERE shopping_cartno=3;

COMMIT;
