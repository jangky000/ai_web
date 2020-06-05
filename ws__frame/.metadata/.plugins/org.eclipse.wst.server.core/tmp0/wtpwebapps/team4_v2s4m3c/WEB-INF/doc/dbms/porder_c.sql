DROP TABLE porder CASCADE CONSTRAINTS;
DROP TABLE mem CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: ȸ�� */
/**********************************/
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

/**********************************/
/* Table Name: �ֹ� */
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

COMMENT ON TABLE porder is '�ֹ�';
COMMENT ON COLUMN porder.porderno is '�ֹ�no';
COMMENT ON COLUMN porder.memno is 'ȸ��no';
COMMENT ON COLUMN porder.rdate is '�ֹ���¥';
COMMENT ON COLUMN porder.item_price_sum is '�ǸŰ��Ѿ�';
COMMENT ON COLUMN porder.item_discount_sum is '�����Ѿ�';
COMMENT ON COLUMN porder.coupon_discount_sum is '��������';
COMMENT ON COLUMN porder.delivery_fee is '��ۺ�';
COMMENT ON COLUMN porder.payment_price is '���������ݾ�';
COMMENT ON COLUMN porder.porder_status is '���� ����';
COMMENT ON COLUMN porder.porder_address is '�����';

DROP SEQUENCE porder_seq;
CREATE SEQUENCE porder_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- CREATE
-- R: ready
-- C: complete
INSERT INTO porder(porderno, memno, rdate, item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee, payment_price, porder_status, porder_address)
VALUES(porder_seq.nextval, 1, sysdate, 10000, 1000, 1000, 2500, 5500, 'R', '����Ư���� ������');
INSERT INTO porder(porderno, memno, rdate, item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee, payment_price, porder_status, porder_address)
VALUES(porder_seq.nextval, 2, sysdate, 20000, 1000, 1000, 2500, 15500, 'R', '����Ư���� ���ı�');
INSERT INTO porder(porderno, memno, rdate, item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee, payment_price, porder_status, porder_address)
VALUES(porder_seq.nextval, 3, sysdate, 30000, 1000, 1000, 2500, 25500, 'R', '��⵵ ������');

COMMIT;

-- LIST
-- ������
SELECT porderno, memno, rdate, item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee, payment_price, porder_status, porder_address
FROM porder
ORDER BY porderno DESC;

-- �����
SELECT porderno, memno, rdate, item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee, payment_price, porder_status, porder_address
FROM porder
WHERE memno=1
ORDER BY porderno DESC;

-- READ
-- ������
SELECT porderno, memno, rdate, item_price_sum, item_discount_sum, coupon_discount_sum, delivery_fee, payment_price, porder_status, porder_address
FROM porder
WHERE porderno = 1 AND memno=1;

-- �����
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
SET porder_address='��⵵ ������'
WHERE porderno = 1;


-- Delete
DELETE FROM porder
WHERE porderno=3;

-- ������ Ȯ��
SELECT *
FROM user_sequences;

