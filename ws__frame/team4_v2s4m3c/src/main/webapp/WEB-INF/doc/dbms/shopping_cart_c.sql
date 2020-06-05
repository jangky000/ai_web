-- ��ǰ ���̺�
/**********************************/
/* Table Name: ��ǰ */
/**********************************/
DROP TABLE item CASCADE CONSTRAINTS;
CREATE TABLE item(
		itemno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE item is '��ǰ';
COMMENT ON COLUMN item.itemno is '��ǰno';

DROP SEQUENCE item_seq;
CREATE SEQUENCE item_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

INSERT INTO item(itemno) VALUES (item_seq.nextval);
INSERT INTO item(itemno) VALUES (item_seq.nextval);
INSERT INTO item(itemno) VALUES (item_seq.nextval);

SELECT * FROM item;

/**********************************/
/* Table Name: ȸ�� */
/**********************************/
DROP TABLE mem CASCADE CONSTRAINTS;
CREATE TABLE mem(
		memno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE mem is 'ȸ��';
COMMENT ON COLUMN mem.memno is 'ȸ��no';


DROP SEQUENCE mem_seq;
CREATE SEQUENCE mem_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

INSERT INTO mem(memno) VALUES (mem_seq.nextval);
INSERT INTO mem(memno) VALUES (mem_seq.nextval);
INSERT INTO mem(memno) VALUES (mem_seq.nextval);

SELECT * FROM mem;

-- ����īƮ ���̺�
/**********************************/
/* Table Name: ��ٱ��� */
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

COMMENT ON TABLE shopping_cart is '��ٱ���';
COMMENT ON COLUMN shopping_cart.shopping_cartno is '��ٱ���no';
COMMENT ON COLUMN shopping_cart.memno is 'ȸ����ȣ';
COMMENT ON COLUMN shopping_cart.itemno is '��ǰno';
COMMENT ON COLUMN shopping_cart.quantity is '����';

DROP SEQUENCE shopping_cart_seq;
CREATE SEQUENCE shopping_cart_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

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
