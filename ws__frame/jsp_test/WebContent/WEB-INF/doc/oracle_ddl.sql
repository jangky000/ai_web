--1. ���̺� ����
-- ������ ��忡���� PURGE ���� ����� �� ����. �ڵ� PURGE
DROP TABLE itpay;
 
CREATE TABLE itpay(
    payno    NUMBER(7)   NOT NULL,   -- -9999999 ~ 9999999, 1���� ���
    part       VARCHAR(20) NOT NULL,  -- �μ���
    sawon    VARCHAR(20) NOT NULL,  -- �����
    age       NUMBER(3)   NOT NULL,   -- ����, 1 ~ 999
    address  VARCHAR(100) NULL,       -- �ּ�
    month    CHAR(6)     NOT NULL,    -- �޿���, 201905
    gdate     DATE        NOT NULL,     -- ������
    PRIMARY KEY(payno)
);
 
 
-- 2. ���� ������ �߰�
-- sysdate�� ������ �����ϴ�
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate)
VALUES(1, '������', '���浿', 27, '������', '201901', sysdate);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate)
VALUES(2, '������', '���浿', 30, '��õ��', '201901', sysdate-5);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate)
VALUES(3, '��ü������', '�ٱ浿', 34, '������', '201901', sysdate-3);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate)
VALUES(4, '��ü������', '��浿', 36, '��õ��', '201902', sysdate-1);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate)
VALUES(5, 'DB������', '���浿', 38, '��õ��', '201902', sysdate-0);
 
SELECT * FROM itpay;
-- PAYNO PART  SAWON AGE ADDRESS MONTH  GDATE
-- ----- ----- ----- --- ------- ------ ---------------------
--     1 ������   ���浿    27 ������     201901 2019-09-20 13:11:44.0
--     2 ������   ���浿    30 ��õ��     201901 2019-09-15 13:11:45.0
--     3 ��ü������ �ٱ浿    34 ������     201901 2019-09-17 13:11:46.0
--     4 ��ü������ ��浿    36 ��õ��     201902 2019-09-19 13:11:47.0
--     5 DB������ ���浿    38 ��õ��     201902 2019-09-20 13:11:47.0

 
-- null ��� �÷� ����, address �÷� ����
INSERT INTO itpay(payno, part, sawon, age, month, gdate)
VALUES(6, '������', '�ű浿', 33, '201904', sysdate+1);
 
SELECT * FROM itpay;
 
-- PAYNO PART  SAWON AGE ADDRESS MONTH  GDATE
-- ----- ----- ----- --- ------- ------ ---------------------
--     1 ������   ���浿    27 ������     201901 2019-09-20 13:11:44.0
--     2 ������   ���浿    30 ��õ��     201901 2019-09-15 13:11:45.0
--     3 ��ü������ �ٱ浿    34 ������     201901 2019-09-17 13:11:46.0
--     4 ��ü������ ��浿    36 ��õ��     201902 2019-09-19 13:11:47.0
--     5 DB������ ���浿    38 ��õ��     201902 2019-09-20 13:11:47.0
--     6 ������   �ű浿    33 NULL    201904 2019-09-20 13:12:39.0

 
-- varchar(20) ������ �� �ִ� ������ ����?
-- sawon   VARCHAR(10) NOT NULL,  -- �����
INSERT INTO itpay(payno, part, sawon, age, month, gdate)
VALUES(7, '������', '1234567890', 33, '200804', sysdate);
 
INSERT INTO itpay(payno, part, sawon, age, month, gdate)
VALUES(8, '������', 'ABCDEFGHIJ', 29, '200804', sysdate);
 
INSERT INTO itpay(payno, part, sawon, age, month, gdate)
VALUES(9, '������', 'ABCDEFGHIJ123', 29, '200804', sysdate);
 
INSERT INTO itpay(payno, part, sawon, age, month, gdate)
VALUES(10, '������', '�����ٶ󸶹ٻ�', 29, '200804', sysdate);
--���� ���� -
--ORA-12899: value too large for column "AI6"."ITPAY"."SAWON" (actual: 21, maximum: 20)


--2. �÷� �߰�
ALTER TABLE itpay
ADD(test VARCHAR(9));

--���̺� �� ���� ���
DESC itpay;

--3. �÷� �Ӽ� ����
ALTER TABLE itpay
MODIFY (test varchar(30));

DESC itpay;

--4. �÷��� ����
ALTER TABLE itpay
RENAME COLUMN test to test2;

DESC itpay;

--5. �÷� ����
ALTER TABLE itpay
DROP COLUMN test2;

DESC itpay;

--6. ���̺� ����
DROP TABLE itpay;

