[01] �׽�Ʈ ������ ����

1. ���̺� ����
 
-- PURGE: ���̺� ���� �� �����뿡 �������� �ʰ� ��� ����
-- XE ������ ������ ���� ����(RECYCLE ��� ����X)
DROP TABLE itpay PURGE;
 
CREATE TABLE itpay(
    payno   NUMBER(7)   NOT NULL,  -- 1 ~ 9999999
    part    VARCHAR(20) NOT NULL,  -- �μ���
    sawon   VARCHAR(10) NOT NULL,  -- �����
    age     NUMBER(3)   NOT NULL,  -- ����, 1 ~ 999
    address VARCHAR(50) NOT NULL,  -- �ּ�
    month   CHAR(6)     NOT NULL,  -- �޿���, 200805
    gdate   DATE        NOT NULL,  -- ������
    bonbong NUMBER(8)   DEFAULT 0, -- ����  
    tax     NUMBER(7, 2)   DEFAULT 0, -- ����, ��ü �ڸ�, +-99999.99
    bonus   NUMBER(7)       NULL,  -- ���ʽ�
    family  NUMBER(7)       NULL,  -- ���� ����
    PRIMARY KEY(payno)
);
 
 
2. ���� ������ �߰�
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax, bonus)
VALUES(1, '��������', '���浿', 27, '��⵵ ������',
       '200801', sysdate, 1530000, 12345.67, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax, bonus)
VALUES(2, '��������', '���浿', 30, '��õ�� ��籸',
       '200801', sysdate-5, 1940000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax, bonus)
VALUES(3, '������', '�ٱ浿', 34, '��⵵ ������',
       '200801', sysdate-3, 2890000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax, bonus)
VALUES(4, '������', '��浿', 36, '��⵵ ��õ��',
       '200802', sysdate-1, 4070000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax, bonus)
VALUES(5, 'DB������', '���浿', 38, '��⵵ ��õ��',
       '200802', sysdate-0, 2960000, 0, 0);
 
SELECT * FROM itpay;
 
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax, bonus)
VALUES(6, '��ȹ������', '�ٱ浿', 40, '����� ������',
       '200802', sysdate-0, 3840000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax, bonus)
VALUES(7, '������', '��浿', 42, '��õ�� ��籸',
       '200803', sysdate-0, 4230000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax, bonus)
VALUES(8, 'DB������', '��浿', 42, '��⵵ ��õ��',
       '200803', sysdate-1, 4010000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax, bonus)
VALUES(9, 'DB������', '�̱浿', 42, '����� ������',
       '200803', sysdate-1, 3500000, 0, 0);
 
SELECT * FROM itpay;
 
 
-- null �÷��� �߰�, ���ʽ� Į���� ���� ����
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax)
VALUES(10, '������', '�ű浿', 33, '����� ���Ǳ�',
       '200804', sysdate, 3500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax)
VALUES(11, '������', '�ֱ浿', 31, '����� ���Ǳ�',
       '200804', sysdate, 4500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address,
                  month, gdate, bonbong, tax)
VALUES(12, '������', '���浿', 29, '����� ���Ǳ�',
       '200804', sysdate, 3200000, 0);
 
 
SELECT * FROM itpay;
 
 
2. �÷� �߰�
 
ALTER TABLE itpay
ADD (test VARCHAR2(9));
 
DESCRIBE itpay;
�̸�      ��?       ����           
------- -------- ------------ 
PAYNO   NOT NULL NUMBER(7)    
PART    NOT NULL VARCHAR2(20) 
SAWON   NOT NULL VARCHAR2(10) 
AGE     NOT NULL NUMBER(3)    
ADDRESS NOT NULL VARCHAR2(50) 
MONTH   NOT NULL CHAR(6)      
GDATE   NOT NULL DATE         
BONBONG          NUMBER(8)    
TAX              NUMBER(7,2)  
BONUS            NUMBER(7)    
FAMILY           NUMBER(7)    
TEST             VARCHAR2(9)  

 
3. �÷� �Ӽ� ����
 
ALTER TABLE itpay
MODIFY (test VARCHAR2(30));
 
 
4. �÷��� ����
ALTER TABLE itpay
RENAME COLUMN test to test2;
 
 
5. �÷� ����
ALTER TABLE itpay
DROP COLUMN test2;
 
 
6. ���̺� ����
 
DROP TABLE itpay;
 
-- DROP TABLE itpay PURGE; -- ���̺� ���� ����
 
 
7. ���̺� ����(XE ���� ����)
FLASHBACK TABLE itpay TO BEFORE DROP;
 
SELECT * FROM itpay;
 
 
8. ������ ����
- ������ ���̺� ���� ����, ���� �Ұ���
 
PURGE RECYCLEBIN;



[02] Single-Row Function(������ �Լ�)
     - ���ڵ� ������ �Լ��� ���� �˴ϴ�.
     - �׽�Ʈ ������
     
          PAYNO PART                 SAWON             AGE ADDRESS                                            MONTH  GDATE                  BONBONG        TAX      BONUS     FAMILY
---------- -------------------- ---------- ---------- -------------------------------------------------- ------ ------------------- ---------- ---------- ---------- ----------
         1 ��������             ���浿             27 ��⵵ ������                                      200801 2019-12-27 11:56:58    1530000   12345.67          0           
         2 ��������             ���浿             30 ��õ�� ��籸                                      200801 2019-12-22 11:56:58    1940000          0          0           
         3 ������               �ٱ浿             34 ��⵵ ������                                      200801 2019-12-24 11:56:58    2890000          0          0           
         4 ������               ��浿             36 ��⵵ ��õ��                                      200802 2019-12-26 11:56:58    4070000          0          0           
         5 DB������             ���浿             38 ��⵵ ��õ��                                      200802 2019-12-27 11:56:58    2960000          0          0           

    
1. UPPER, LOWER
 
-- �ҹ��ڷ� ����
SELECT payno, LOWER(part), sawon, age, address,
       month, gdate, bonbong, tax, bonus
FROM itpay
ORDER BY sawon ASC;

     PAYNO LOWER(PART)          SAWON             AGE ADDRESS                                            MONTH  GDATE                  BONBONG        TAX      BONUS
---------- -------------------- ---------- ---------- -------------------------------------------------- ------ ------------------- ---------- ---------- ----------
         1 ��������             ���浿             27 ��⵵ ������                                      200801 2020-05-29 10:12:06    1530000   12345.67          0
         8 db������             ��浿             42 ��⵵ ��õ��                                      200803 2020-05-28 10:12:54    4010000          0          0
         2 ��������             ���浿             30 ��õ�� ��籸                                      200801 2020-05-24 10:12:10    1940000          0          0
         3 ������               �ٱ浿             34 ��⵵ ������                                      200801 2020-05-26 10:12:12    2890000          0          0
...

-- �빮�ڷ� ����
SELECT payno, UPPER(part), sawon, age, address,
       month, gdate, bonbong, tax, bonus
FROM itpay
ORDER BY sawon ASC;
 
 
2. CONCAT(2���� �÷��� ���� ����)
SELECT payno, CONCAT(part, '-' || sawon) as name, age, address,
       month, gdate, bonbong, tax, bonus
FROM itpay
ORDER BY sawon ASC;

     PAYNO NAME                                   AGE ADDRESS                                            MONTH  GDATE                  BONBONG        TAX      BONUS
---------- ------------------------------- ---------- -------------------------------------------------- ------ ------------------- ---------- ---------- ----------
         1 ��������-���浿                         27 ��⵵ ������                                      200801 2020-05-29 10:12:06    1530000   12345.67          0
         8 DB������-��浿                         42 ��⵵ ��õ��                                      200803 2020-05-28 10:12:54    4010000          0          0
         2 ��������-���浿                         30 ��õ�� ��籸                                      200801 2020-05-24 10:12:10    1940000          0          0
...
 
3. SUBSTR, index�� 1���� ����
-- 3��° ���ں��� ���
SELECT payno, SUBSTR(address, 3),
       month, gdate, bonbong, tax, bonus
FROM itpay
ORDER BY sawon ASC;

     PAYNO SUBSTR(ADDRESS,3)                                MONTH  GDATE                  BONBONG        TAX      BONUS
---------- ------------------------------------------------ ------ ------------------- ---------- ---------- ----------
         1 �� ������                                        200801 2020-05-29 10:12:06    1530000   12345.67          0
         8 �� ��õ��                                        200803 2020-05-28 10:12:54    4010000          0          0
         2 �� ��籸                                        200801 2020-05-24 10:12:10    1940000          0          0
...
 
-- 1��° ���ں��� 3���� ���� ���
SELECT payno, SUBSTR(address, 1, 3),
       month, gdate, bonbong, tax, bonus
FROM itpay
ORDER BY sawon ASC;
 
 
-- 2��° ���� 4���� ���� ��� -> (��)�⵵ ��(����)
SELECT payno, SUBSTR(address, 2, 4),
       month, gdate, bonbong, tax, bonus
FROM itpay
ORDER BY sawon ASC;

     PAYNO SUBS MONTH  GDATE                  BONBONG        TAX      BONUS
---------- ---- ------ ------------------- ---------- ---------- ----------
         1 �⵵ �� 200801 2020-05-29 10:12:06    1530000   12345.67          0
         8 �⵵ �� 200803 2020-05-28 10:12:54    4010000          0          0
         2 õ�� �� 200801 2020-05-24 10:12:10    1940000          0          0
 ...    
 
4. LENGTH
 
SELECT payno, address, address,
       month, gdate, bonbong, tax, bonus
FROM itpay
ORDER BY sawon ASC;
 
-- ����� �ѱ� ��� 1�ڷ� ���
SELECT payno, address, LENGTH(address) as len,
       month, gdate, bonbong, tax, bonus
FROM itpay
ORDER BY sawon ASC;

     PAYNO ADDRESS                                                   LEN MONTH  GDATE                  BONBONG        TAX      BONUS
---------- -------------------------------------------------- ---------- ------ ------------------- ---------- ---------- ----------
         1 ��⵵ ������                                               7 200801 2020-05-29 10:12:06    1530000   12345.67          0
         8 ��⵵ ��õ��                                               7 200803 2020-05-28 10:12:54    4010000          0          0
         2 ��õ�� ��籸                                               7 200801 2020-05-24 10:12:10    1940000          0          0
...
 
5. INSTR, index�� 1���� ����, �������� ������ 0
-- Ư�� ������ ��ġ�� ��ȯ
SELECT payno, address, INSTR(address, 'õ') as idx,
       month, gdate, bonbong, tax, bonus
FROM itpay
ORDER BY sawon ASC;

     PAYNO ADDRESS                                                   IDX MONTH  GDATE                  BONBONG        TAX      BONUS
---------- -------------------------------------------------- ---------- ------ ------------------- ---------- ---------- ----------
         1 ��⵵ ������                                               0 200801 2020-05-29 10:12:06    1530000   12345.67          0
         8 ��⵵ ��õ��                                               6 200803 2020-05-28 10:12:54    4010000          0          0
         2 ��õ�� ��籸                                               2 200801 2020-05-24 10:12:10    1940000          0          0
    

 
6. LPAD, RPAD ����
-- �ڸ����� ������, 10�ڸ��� ���߷� �������� 0�� �߰���
SELECT bonbong, LPAD(bonbong, 10, 0)
FROM itpay
ORDER BY sawon ASC;

   BONBONG LPAD(BONBO
---------- ----------
   1530000 0001530000
   4010000 0004010000
   1940000 0001940000
 
SELECT bonbong, RPAD(bonbong, 10, 0)
FROM itpay
ORDER BY sawon ASC;

  BONBONG RPAD(BONBO
---------- ----------
   1530000 1530000000
   4010000 4010000000
 
SELECT bonbong,LPAD(bonbong, 10, '*')
FROM itpay
ORDER BY sawon ASC;

   BONBONG LPAD(BONBO
---------- ----------
   1530000 ***1530000
   4010000 ***4010000
   1940000 ***1940000
 
7. REPLACE
-- REPLACE(�÷���, ������ ���ڿ�, ���� ����� ���ڿ�)
SELECT payno, address, REPLACE(address, '��籸','������') as ADDR,
       month, gdate, bonbong, tax, bonus
FROM itpay
WHERE address LIKE '%��õ%'
ORDER BY sawon ASC;
 
      PAYNO ADDRESS                                            ADDR                                                                                                                                                                                                                                                                                                                                                                                                                                                               MONTH  GDATE                  BONBONG        TAX      BONUS
---------- -------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ------ ------------------- ---------- ---------- ----------
         2 ��õ�� ��籸                                      ��õ�� ������                                                                                                                                                                                                                                                                                                                                                                                                                                                      200801 2020-05-24 10:12:10    1940000          0          0
         7 ��õ�� ��籸                                      ��õ�� ������         
 
8. ROUND
-- SQL ������ ����� ���� �ý��� ���̺�, --   MYSQL�� dual ���� ����
SELECT * FROM dual; -- d��� Į���� x���� �ִ�.

-- �Ҽ� ��° �ڸ����� �ݿø�
SELECT ROUND(55.634, 2), ROUND(55.635, 2)
FROM dual;

ROUND(55.634,2) ROUND(55.635,2)
--------------- ---------------
          55.63           55.64

-- ���� ���� �ݿø�
-- -1: 1�� �ڸ�, -2: 10�� �ڸ����� �ݿø�
-- �ݿø� �ȵ�
SELECT ROUND(23541, -1), ROUND(23541.25, -2)
FROM dual;

ROUND(23541,-1) ROUND(23541.25,-2)
--------------- ------------------
          23540              23500

-- �ݿø���.
SELECT ROUND(23551, -1), ROUND(23551.25, -2)
FROM dual;
 
 ROUND(23551,-1) ROUND(23551.25,-2)
--------------- ------------------
          23550              23600

9. TO_CHAR(): ��¥�� ��� �� ��
-- ���� ��¥ ���
SELECT sysdate FROM dual;

SYSDATE            
-------------------
2020-05-29 10:52:51

-- 2020-05-29�Ͽ� �޿��� �޴� ��� ���
SELECT gdate, SUBSTR(gdate, 1, 10) as rdate
FROM itpay;
GDATE               RDATE     
------------------- ----------
2020-05-29 10:13:18 2020-05-29
 
-- DB���� Ŀ���ϸ� �� �����Ͱ� �ջ�Ǳ� ������, �ڹ� �����ڰ� �ú��ʰ� �ʿ��� �� ����� �� ����.
-- �׷��� �ڹ� ���ø����̼� �ܿ��� �߶� ����� �� �ְ� ���ִ� ���� �߿��ϴ�.
SELECT gdate, TO_CHAR(gdate, 'yyyy-mm-dd') as rdate
FROM itpay;
 
 
-- ���� ����
SELECT gdate, TO_CHAR(gdate, 'yyyy-mm-dd hh:mi:ss') as newgdate
FROM itpay;
 
 
SELECT * FROM itpay;
 
-- ��¥ �˻� �ȵ�
-- gdate�� ����Ͻú��� ����
SELECT payno, part, sawon, age, address,
       month, gdate, bonbong, tax, bonus
FROM itpay
WHERE gdate = '2020-05-29';
 
-- ��¥ �˻� �ȵ�
SELECT payno, part, sawon, age, address,
       month, gdate, bonbong, tax, bonus
FROM itpay
WHERE gdate = '20/05/29';
 
-- TO_CHAR() �Լ��� ���� ���ڿ� ����ȯ
SELECT payno, part, sawon, age, address,
       month, gdate, bonbong, tax, bonus
FROM itpay
WHERE TO_CHAR(gdate, 'yyyy-mm-dd') = '2020-05-29';
 
-- 24�ð� �����̸� hh24�� �������� ��
SELECT payno, part, sawon, age, address,
       month, gdate, bonbong, tax, bonus
FROM itpay
WHERE TO_CHAR(gdate, 'yyyy-mm-dd hh24') = '2020-05-29 10';
--  WHERE TO_CHAR(gdate, 'yyyy-mm-dd hh24') = '2018-02-28 15';
  
10. �� ��¥ ������ �� ���
    - sysdate+1: ���� ��¥�� 1���� ����

SELECT sysdate + 1 FROM dual;

SYSDATE+1          
-------------------
2020-05-30 11:02:01

SELECT sysdate - 1 FROM dual;

SYSDATE-1          
-------------------
2020-05-28 11:02:15

SELECT MONTHS_BETWEEN(sysdate+1, sysdate) 
FROM dual;
MONTHS_BETWEEN(SYSDATE+1,SYSDATE)
---------------------------------
                      .0322580645

SELECT MONTHS_BETWEEN(sysdate+31, sysdate) 
FROM dual;

MONTHS_BETWEEN(SYSDATE+31,SYSDATE)
----------------------------------
                                 1
 
11. �� ���ϱ�
SELECT ADD_MONTHS(sysdate, 1) FROM dual;
 
-- ADD_MONTHS(SYSDATE,
---------------------
--2020-06-29 11:04:02
 
12. ���ƿ��� �������� ��¥ ���
SELECT NEXT_DAY(sysdate, '������') as nextday FROM dual;

NEXTDAY            
-------------------
2020-06-01 11:05:04
 
13. �̹����� �������� ���
SELECT LAST_DAY(sysdate) as lastday FROM dual;

LASTDAY            
-------------------
2020-05-31 11:05:53
 
14. TO_CHAR
SELECT TO_CHAR(sysdate, 'yyyy-mm-dd hh:mi:ss') 
FROM dual;

--TO_CHAR(SYSDATE,'YY
---------------------
--2020-05-29 11:06:28
 
SELECT TO_CHAR(sysdate, 'yyyy-mm-dd hh24:mi:ss') 
FROM dual;
 
-- TO_CHAR(SYSDATE,'YY
---------------------
--2020-05-29 11:06:41
 
-- ������ ���ڿ� 0���� ä��, 9: ����
SELECT TO_CHAR(1500, '0999999') FROM dual;

-- TO_CHAR(
----------
-- 0001500
 
-- ��� ���ĺ��� ���� ũ�� '# ���
SELECT TO_CHAR(150000, '9,999') FROM dual;

TO_CHA
------
######
 
-- õ���� ������ ���
SELECT TO_CHAR(150000, '999,999') FROM dual;
-- ������ �ʿ��� ���, �ڹ� �����ڰ� �޸��� ���� �۾��� �ؾ� ��
 
-- ��ȣ ���
SELECT TO_CHAR(150000, 'S999,999') FROM dual;
 
 TO_CHAR(
--------
+150,000
 
SELECT TO_CHAR(-150000, 'S999,999') FROM dual;
 
 TO_CHAR(
--------
-150,000
 
SELECT TO_CHAR(1500.55, '9,999.99') FROM dual;
 
 TO_CHAR(1
---------
 1,500.55
 
-- �Ҽ��� �ڸ����� ������ �ڵ� �ݿø�
SELECT TO_CHAR(1500.55, '9,999.9') FROM dual;
 
 TO_CHAR(
--------
 1,500.6
 
-- �Ҽ��� �ڸ����� ������ 0���� ä����.
SELECT TO_CHAR(1500.5, '9,999.999') FROM dual;
 
 TO_CHAR(15
----------
 1,500.500
 
15 NVL �Լ�
SELECT payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus, family
FROM itpay;
 
 -- null Į���� ��� ������ �ص� null��, ���� �� �޴� ��� �߻�, ������ �߻������� �ʴ´�.
SELECT payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus+300000, family
FROM itpay;

        10 ������               �ű浿             33 ����� ���Ǳ�                                      200804 2020-05-29 10:13:18    3500000    (null)      0                        
        11 ������               �ֱ浿             31 ����� ���Ǳ�                                      200804 2020-05-29 10:13:18    4500000    (null)      0                        
        12 ������               ���浿             29 ����� ���Ǳ�                                      200804 2020-05-29 10:13:18    3200000    (null)      0                        


-- null�� �ƴϸ� �÷� ���� �״�� ����ϳ� 
-- null�̸� ���� 0���� ����
SELECT payno, part, sawon, age, address,
       month, gdate, bonbong, tax, 
       NVL(bonus, 0) + 500000 as bonus,
       NVL(family, 0) as family
FROM itpay;
 
 
16. TRUNC() �Լ��� �̿��� �Ҽ��� ���� ����
 
-- ������ ���, 0�� �ڸ����� ����
SELECT tax, TRUNC(tax, 0) as tax
FROM itpay;
 
       TAX        TAX
---------- ----------
  12345.67      12345
         0          0
         0          0
 
-- �Ҽ� ù° �ڸ��� ���, �ݿø� �ȵ�
SELECT tax, TRUNC(tax, 1) as tax
FROM itpay;
 
       TAX        TAX
---------- ----------
  12345.67    12345.6
         0          0
         0          0
 
-- 10���ڸ����� ���, 1���ڸ� ���� ����, �ݿø� �ȵ�
SELECT tax, TRUNC(tax, -1) as tax
FROM itpay;
 
        TAX        TAX
---------- ----------
  12345.67      12340
         0          0
         0          0
 
-- �Լ��� ��ø, 12,340
SELECT tax, TO_CHAR(TRUNC(tax, -1), '9,999,999') as tax
FROM itpay;
 
        TAX TAX       
---------- ----------
  12345.67     12,340
         0          0
         0          0
 
17. CASE ��
-- �������� ������ 0.5% ���ʽ�
-- DB������ ������ 0.4% ���ʽ�
-- �������� ������ 0.3% ���ʽ�
-- �� �ۿ��� 10������ ���ʽ�
SELECT payno, part, sawon, age, address, month, gdate, bonbong, tax,
       CASE part WHEN '������'     THEN bonbong*0.5
                      WHEN 'DB������' THEN bonbong*0.4
                      WHEN '��������' THEN bonbong*0.3
       ELSE bonbong*0.1 END bonus
FROM itpay;

--�̷��� ����������, �ڹ� ���߿��� ����ϱ� ���� ����
-- �� ����Ʈ���� ���� �ԷµǾ�� �ϰ�, %�� ���� �ٲ�� ����

 
18. null �÷����� �˻�
-- ������ �غ�
     PAYNO PART                 SAWON             AGE ADDRESS                                            MONTH  GDATE                  BONBONG        TAX      BONUS     FAMILY
---------- -------------------- ---------- ---------- -------------------------------------------------- ------ ------------------- ---------- ---------- ---------- ----------
        10 ������               �ű浿             33 ����� ���Ǳ�                                      200804 2019-12-27 12:55:54    3500000          0                      
        11 ������               �ֱ浿             31 ����� ���Ǳ�                                      200804 2019-12-27 12:55:54    4500000          0                      
        12 ������               ���浿             29 ����� ���Ǳ�                                      200804 2019-12-27 12:55:54    3200000          0                      

SELECT payno, part, sawon, age, address,
       month, gdate, bonbong, tax, bonus,
       family
FROM itpay;
 
-- �μ�Ƽ�긦 ���� ���ϴ� ���� ���, null �� �ȵ� -> IS NULL�� ��
SELECT payno, part, sawon, age, address,
       month, gdate, bonbong, tax, bonus,
       family
FROM itpay
WHERE bonus = null;
 
SELECT payno, part, sawon, age, address,
       month, gdate, bonbong, tax, bonus,
       family
FROM itpay
WHERE bonus is null;
 
-- �μ�Ƽ�긦 ���� ���ϴ� ������ ���� ã���� ������, 0 ���, 
--bonus �÷��� �� �߿� null�� �����Ƿ� null�� ���� �ν� �ȵ� 
SELECT COUNT(bonus) as cnt
FROM itpay
WHERE bonus is null;
 
        CNT
----------
         0
 
-- �μ�Ƽ�긦 ���� ���ϴ� ������ �� 
SELECT COUNT(*) as cnt
FROM itpay
WHERE bonus is null;
 
       CNT
----------
        3
 