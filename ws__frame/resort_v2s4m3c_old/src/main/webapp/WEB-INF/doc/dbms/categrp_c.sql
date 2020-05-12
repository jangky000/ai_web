/**********************************/
/* Table Name: ī�װ� �׷� */
/**********************************/
DROP TABLE cate;
DROP TABLE categrp;
CREATE TABLE categrp(
		categrpno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(50)		 NOT NULL,
		seqno                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE categrp is 'ī�װ� �׷�';
COMMENT ON COLUMN categrp.categrpno is 'ī�װ� �׷��ȣ';
COMMENT ON COLUMN categrp.name is '�̸�';
COMMENT ON COLUMN categrp.seqno is '��� ����';
COMMENT ON COLUMN categrp.visible is '��� ���';
COMMENT ON COLUMN categrp.rdate is '�׷� ������';


-- ������ ����
DROP SEQUENCE categrp_seq;

-- ������ ����
CREATE SEQUENCE categrp_seq
    START WITH 1            -- ���� ��ȣ
    INCREMENT BY 1        -- ���� ����
    MAXVALUE 9999999999    -- �ִ밪�� 9999999999 -- NUMBER(10)�� ���� �Ǿ� �־�� ��
    CACHE 2                     -- 2���� �޸𸮿��� ���, 2�� �� ������Ʈ�� ���� ���� -> �ӵ� ���
    NOCYCLE;                   -- �ٽ� 1���� �����Ǵ� ���� ����
    

INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '��ȭ', 1, 'Y', sysdate);
 
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '����', 2, 'Y', sysdate);
 
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, 'ķ��', 3, 'Y', sysdate);

COMMIT;

SELECT * FROM categrp;

-- ���� �ʱ�ȭ �ڵ�















-- SQL ����� ����

-- INSERT
INSERT INTO categrp( categrpno, name, seqno, visible, rdate )
VALUES(categrp_seq.nextval, '���� ����', 1, 'Y', sysdate);

INSERT INTO categrp( categrpno, name, seqno, visible, rdate )
VALUES(categrp_seq.nextval, '�ؿ� ����', 2, 'Y', sysdate);

INSERT INTO categrp( categrpno, name, seqno, visible, rdate )
VALUES(categrp_seq.nextval, '���� �ڷ�', 3, 'Y', sysdate);


-- LIST
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY categrpno ASC;

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 ���� ����                                                   1 Y 2020-04-17 04:49:18
         2 �ؿ� ����                                                   2 Y 2020-04-17 04:49:18
         3 ���� �ڷ�                                                   3 Y 2020-04-17 04:49:18

-- READ
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
WHERE categrpno=1;


--UPDATE
--1�� ���ڵ� �̸� ��ȭ�� ����
UPDATE categrp 
SET name='��ȭ' 
WHERE categrpno=1;

--1�� ���ڵ� seqno ����
UPDATE categrp 
SET seqno=10 
WHERE categrpno=1;

--1�� ���ڵ� visible ����
UPDATE categrp 
SET visible='N' 
WHERE categrpno=1;

-- ��ü ����
UPDATE categrp
SET name='�Ĵ�', seqno = 10, visible='Y'
WHERE categrpno = 5;


--DELETE
DELETE FROM categrp
WHERE categrpno=1;

-- ���ڵ� ����
SELECT COUNT(*) as cnt
FROM categrp;


--INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
--VALUES((SELECT NVL(MAX(categrpno), 0)+1 as categrpno FROM categrp),
--  '��ȭ', 1, 'Y', sysdate);
-- 
--INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
--VALUES((SELECT NVL(MAX(categrpno), 0)+1 as categrpno FROM categrp),
--  '����', 2, 'Y', sysdate);
-- 
--INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
--VALUES((SELECT NVL(MAX(categrpno), 0)+1 as categrpno FROM categrp),
--  'ķ��', 3, 'Y', sysdate);


INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '��ȭ', 1, 'Y', sysdate);
 
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '����', 2, 'Y', sysdate);
 
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, 'ķ��', 3, 'Y', sysdate);

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 ��ȭ                                                        1 Y 2020-04-22 10:10:38
         2 ����                                                        2 Y 2020-04-22 10:10:38
         3 ķ��                                                        3 Y 2020-04-22 10:10:38

-- ��� ���������� ��ü ���
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY seqno ASC;
 
-- ��� ���� ����, 10 �� 1
UPDATE categrp
SET seqno = seqno - 1
WHERE categrpno=1;
 
-- ��¼��� ����, 1 �� 10
UPDATE categrp
SET seqno = seqno + 1
WHERE categrpno=1;



commit;


-- ��� ���
UPDATE categrp
SET visible='Y'
WHERE categrpno=1;

UPDATE categrp
SET visible='N'
WHERE categrpno=1;

commit;



















