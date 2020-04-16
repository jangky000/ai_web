CREATE TABLE sales(
    salesno  NUMBER(8)    NOT NULL, -- �Ǹ� ��ȣ
    product VARCHAR(50) NOT NULL, -- ��ǰ��
    price     NUMBER(8)    NOT NULL, -- ����
    cnt       NUMBER(5)     NOT NULL, -- ����
    dc        NUMBER(5,2)  NOT NULL, -- ������
    rdate     DATE              NOT NULL, -- �Ǹų�¥
    PRIMARY KEY(salesno)
);

DROP TABLE sales;

-- ������ ����
CREATE SEQUENCE sales_seq
    START WITH 1            -- ���� ��ȣ
    INCREMENT BY 1        -- ���� ����
    MAXVALUE 99999999    -- �ִ밪�� 9999999 -- NUMBER(8)�� ���� �Ǿ� �־�� ��
    CACHE 2                     -- 2���� �޸𸮿��� ���, 2�� �� ������Ʈ�� ���� ���� -> �ӵ� ���
    NOCYCLE;                   -- �ٽ� 1���� �����Ǵ� ���� ����
    

-- ������ ����
DROP SEQUENCE sales_seq;

-- INSERT
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '�ڹٱ���', 20000, 100, 0.1, SYSDATE);

INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '��������', 20000, 100, 0.05, SYSDATE);

-- �Ҽ����� ������ �ڸ��� 5�ڸ����� ����
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '�ؿܿ���', 20000, 100, 1000.01, SYSDATE);
���� ���� -
ORA-01438: value larger than specified precision allowed for this column

-- �Ҽ��� 2�ڸ������� �Է��� �� ������ ���� ���� �Է��� �ȴ�. -> �Ҽ��� 3��° �ڸ��� �ڵ� �ݿø�
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '�ؿܿ���', 20000, 100, 10.001, SYSDATE);
SELECT salesno, product, price, cnt, dc, rdate FROM sales ORDER BY salesno ASC;
   SALESNO PRODUCT                                                 PRICE        CNT         DC RDATE              
---------- -------------------------------------------------- ---------- ---------- ---------- -------------------
            ...
         2 ��������                                                20000        100     0.05 2020-03-25 10:23:26
         3 �ؿܿ���                                                20000        100         10 2020-03-25 10:37:50

-- �Ҽ� �ڸ����� ���߾� �ڵ� �ݿø�
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '����ŷ', 10000, 100, 10.005, SYSDATE);
SELECT salesno, product, price, cnt, dc, rdate FROM sales ORDER BY salesno ASC;
   SALESNO PRODUCT                                                 PRICE        CNT         DC RDATE              
---------- -------------------------------------------------- ---------- ---------- ---------- -------------------
            ...
         3 �ؿܿ���                                                20000        100         10 2020-03-25 11:00:24
         4 ����ŷ                                                  10000        100      10.01 2020-03-25 11:00:34

-- �ִ밪 �Է�
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '��ȭ�� ����', 9000, 100, 999.99, SYSDATE);
SELECT salesno, product, price, cnt, dc, rdate FROM sales ORDER BY salesno ASC;
   SALESNO PRODUCT                                                 PRICE        CNT         DC RDATE              
---------- -------------------------------------------------- ---------- ---------- ---------- -------------------
            ...
         4 ����ŷ                                                  10000        100      10.01 2020-03-25 11:00:34
         5 ��ȭ�� ����                                              9000        100     999.99 2020-03-25 11:00:45

-- �ּҰ� �Է�, -�� �ڸ����� ���Ե��� �ʴ´�(�翬�� �̾߱�)
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '��ȭ�� ����', 9000, 100, -999.99, SYSDATE);
SELECT salesno, product, price, cnt, dc, rdate FROM sales ORDER BY salesno ASC;
   SALESNO PRODUCT                                                 PRICE        CNT         DC RDATE              
---------- -------------------------------------------------- ---------- ---------- ---------- -------------------
            ...
         5 ��ȭ�� ����                                              9000        100     999.99 2020-03-25 11:00:45
         6 ��ȭ�� ����                                              9000        100    -999.99 2020-03-25 11:00:57
         
DELETE FROM sales WHERE salesno >= 1 AND salesno <= 5;
SELECT salesno, product, price, cnt, dc, rdate FROM sales ORDER BY salesno ASC;

UPDATE sales SET product='���ؾ� ����', price=15000, cnt = 3, dc = 5.5 WHERE salesno = 6;
SELECT salesno, product, price, cnt, dc, rdate FROM sales ORDER BY salesno ASC;
   SALESNO PRODUCT                                                 PRICE        CNT         DC RDATE              
---------- -------------------------------------------------- ---------- ---------- ---------- -------------------
         6 ���ؾ� ����                                             15000          3        5.5 2020-03-25 11:00:57


-- �÷����� COUNT(SALESNO)�̸� �����ڰ� ����ϱ� �����ϴ� �׷��� ������ �ٿ��ش�
SELECT COUNT(salesno) AS order_cnt
FROM sales;
 ORDER_CNT
----------
         1
         
SELECT sysdate FROM dual;
SYSDATE            
-------------------
2020-03-25 11:02:33

-- �ֹ��� ��¥�� ���( TO_CHAR( ) )
SELECT salesno, product, TO_CHAR(rdate, 'YYYY-MM-DD') AS rdate
FROM sales
ORDER BY salesno;
   SALESNO PRODUCT                                            RDATE     
---------- -------------------------------------------------- ----------
         6 ���ؾ� ����                                        2020-03-25

-- ��:��:�ʱ��� ���
SELECT salesno, product, TO_CHAR(rdate, 'YYYY-MM-DD HH:MI:SS') AS rdate
FROM sales
ORDER BY salesno;

-- 24�ð���
SELECT salesno, product, TO_CHAR(rdate, 'YYYY-MM-DD HH24:MI:SS') AS rdate
FROM sales
ORDER BY salesno;

--Ư�� ��¥�� �����ؾ��ϴ� ���, ���ڿ��� �Է�
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '���ؾ� ����', 12000, 100, 10.0, '2020-4-5');
SELECT salesno, product, price, cnt, dc, rdate FROM sales ORDER BY salesno ASC;
   SALESNO PRODUCT                                                 PRICE        CNT         DC RDATE              
---------- -------------------------------------------------- ---------- ---------- ---------- -------------------
         6 ���ؾ� ����                                             15000          3        5.5 2020-03-25 11:00:57
         7 ���ؾ� ����                                             12000        100         10 2020-04-05 12:00:00
         
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '���ؾ� ����', 12000, 100, 10.0, '2020-04-05 13:13:05');
���� ���� - ���� �߻��ÿ��� �������� �����Ѵ�..
ORA-01849: hour must be between 1 and 12

INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '���ؾ� ����', 12000, 100, 10.0, '2020-04-05 11:13:05');
SELECT salesno, product, price, cnt, dc, rdate FROM sales ORDER BY salesno ASC;
   SALESNO PRODUCT                                                 PRICE        CNT         DC RDATE              
---------- -------------------------------------------------- ---------- ---------- ---------- -------------------
         6 ���ؾ� ����                                             15000          3        5.5 2020-03-25 11:00:57
         7 ���ؾ� ����                                             12000        100         10 2020-04-05 12:00:00
        10 ���ؾ� ����                                             12000        100         10 2020-04-05 11:13:05

--24�ð��� ���( TO_DATE( ) )
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '�ٴ� ����', 12000, 100, 10.0, 
                TO_DATE('2020-10-01 15:13:05', 'YYYY-MM-DD HH24:MI:SS') );
SELECT salesno, product, price, cnt, dc, TO_CHAR(rdate, 'YYYY-MM-DD HH24:MI:SS') AS rdate FROM sales ORDER BY salesno ASC;

-- ���� ���� ���
SELECT salesno, product, price, cnt, dc, TO_CHAR(rdate, 'YYYY-MM-DD HH24:MI:SS AM') AS rdate FROM sales ORDER BY salesno ASC;
   SALESNO PRODUCT                                                 PRICE        CNT         DC RDATE                     
---------- -------------------------------------------------- ---------- ---------- ---------- --------------------------
         6 ���ؾ� ����                                             15000          3        5.5 2020-03-25 11:00:57 ����  
         7 ���ؾ� ����                                             12000        100         10 2020-04-05 00:00:00 ����  
        10 ���ؾ� ����                                             12000        100         10 2020-04-05 11:13:05 ����  
        11 �ٴ� ����                                               12000        100         10 2020-10-01 15:13:05 ����  
 