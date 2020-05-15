DROP TABLE porder CASCADE CONSTRAINTS;
/**********************************/
/* Table Name: �ֹ� */
/**********************************/
CREATE TABLE porder(
		porderno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		VARCHAR2(10)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		total_price                   		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		status                        		CHAR(1)		 NOT NULL,
		productno                     		NUMBER(10)		 NULL 
);

COMMENT ON TABLE porder is '�ֹ�';
COMMENT ON COLUMN porder.porderno is '�ֹ�no';
COMMENT ON COLUMN porder.memberno is 'ȸ����ȣ';
COMMENT ON COLUMN porder.rdate is '�ֹ���¥';
COMMENT ON COLUMN porder.total_price is '�ֹ��Ѿ�';
COMMENT ON COLUMN porder.status is '�ֹ�����';
COMMENT ON COLUMN porder.productno is '��ǰ ��� ��ȣ';

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

