DROP TABLE porder;
--DROP TABLE product;
DROP TABLE member;

DROP TABLE porder CASCADE CONSTRAINTS;
--DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;

--/**********************************/
--/* Table Name: ��ǰ */
--/**********************************/
--CREATE TABLE product(
--		productno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
--);
--
--COMMENT ON TABLE product is '��ǰ';
--COMMENT ON COLUMN product.productno is '��ǰno';


-- DROP SEQUENCE product_seq;
--CREATE SEQUENCE product_seq
--  START WITH 1              -- ���� ��ȣ
--  INCREMENT BY 1          -- ������
--  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
--  CACHE 2                       -- 2���� �޸𸮿����� ���
--  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
--
--INSERT INTO product(productno) VALUES (product_seq.nextval);
--INSERT INTO product(productno) VALUES (product_seq.nextval);
--INSERT INTO product(productno) VALUES (product_seq.nextval);

/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE member(
		memberno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE member is 'ȸ��';
COMMENT ON COLUMN member.memberno is 'ȸ��no';


DROP SEQUENCE member_seq;
CREATE SEQUENCE member_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

INSERT INTO member(memberno) VALUES (member_seq.nextval);
INSERT INTO member(memberno) VALUES (member_seq.nextval);
INSERT INTO member(memberno) VALUES (member_seq.nextval);

/**********************************/
/* Table Name: �ֹ� */
/**********************************/
CREATE TABLE porder(
		porderno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		rdate                         		DATE		 NOT NULL,
		total_price                   		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		status                        		CHAR(1)		 NOT NULL,
        memberno                      		NUMBER(10)		 NOT NULL,
        FOREIGN KEY (memberno) REFERENCES member(memberno)
);

COMMENT ON TABLE porder is '�ֹ�';
COMMENT ON COLUMN porder.porderno is '�ֹ�no';
COMMENT ON COLUMN porder.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN porder.rdate is '�ֹ���¥';
COMMENT ON COLUMN porder.total_price is '�ֹ��Ѿ�';
COMMENT ON COLUMN porder.status is '�ֹ�����';

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
INSERT INTO porder(porderno, memberno, rdate, total_price, status)
VALUES(porder_seq.nextval, 1, sysdate, 1000, 'R');

-- LIST
SELECT porderno, memberno, rdate, total_price, status
FROM porder;

--READ
SELECT porderno, memberno, rdate, total_price, status
FROM porder
WHERE porderno = 1;

-- Update
UPDATE porder
SET memberno=1, total_price=1000, status='C'
WHERE porderno = 1;

-- Delete
DELETE FROM porder
WHERE porderno=1;

-- ������ Ȯ��
SELECT *
FROM user_sequences;