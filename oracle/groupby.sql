1. AVG(), MAX(), MIN(), SUM()
SELECT * FROM itpay;
 
SELECT AVG(bonbong) as ���, MAX(bonbong) as �ִ밪
          , MIN(bonbong) as �ּҰ�, SUM(bonbong) as �հ�
FROM itpay;
 
         ���        �ִ밪        �ּҰ�         �հ�
---------- ---------- ---------- ----------
   3347500    4500000    1530000   40170000
 
-- �׷�ȭ �Լ��� �Ϲ� �÷��� ���� ����� �� �����ϴ�.
-- � ����� ���� ��հ� �հ����� ������ ��ȣ��!!!
SELECT sawon, AVG(bonbong), SUM(bonbong)
FROM itpay;
-- ���: n�� ��� / ���, ��: 1�� ���
 
2. ��¥ �󿡼��� MAX(), MIN()
 
SELECT MAX(gdate), MIN(gdate) FROM itpay;
 MAX(GDATE)          MIN(GDATE)         
------------------- -------------------
2020-05-29 10:13:18 2020-05-24 10:12:10
 
 -- ���� ��
SELECT MAX(sawon), MIN(sawon) FROM itpay;
 MAX(SAWON) MIN(SAWON)
---------- ----------
�ֱ浿     ���浿    
 
3. COUNT(), NULL �÷��� ī��Ʈ�� ������ ���� �ʽ��ϴ�.

SELECT COUNT(payno) FROM itpay;

 COUNT(PAYNO)
------------
          12
 
SELECT COUNT(bonus) FROM itpay;
 
 COUNT(BONUS)
------------
           9
 
SELECT COUNT(*) FROM itpay;
   COUNT(*)
----------
        12
 
-- NVL �Լ��� �̿��Ͽ� NULL �÷��� ī��Ʈ �մϴ�.
-- null ���� 0���� �����մϴ�.
SELECT COUNT(NVL(bonus, 0)) as bonus FROM itpay;
       BONUS
----------
        12
 
 SELECT * FROM itpay;
 
 -- 3�� ���� bonus 20���� ����
 -- SET�� ��ȣ ���� �ȵȴ�.
UPDATE  itpay SET bonus=200000 WHERE payno=3;
 -- 4�� ���� bonus 30���� ����
UPDATE  itpay SET bonus=300000 WHERE payno=4;
 -- 5�� ���� bonus 40���� ����
UPDATE  itpay SET bonus=400000 WHERE payno=5;

 -- 0 ���� null ������ ����
UPDATE itpay SET bonus = NULL WHERE bonus=0;
SELECT bonus FROM itpay;

SELECT MAX(bonus) FROM itpay; -- null�� �־ �ִ밪 ������
-- MAX(BONUS)
------------
--    400000
SELECT MIN(bonus) FROM itpay; -- null�� �־ �ּҰ� ������
--MIN(BONUS)
------------
--    200000

-- ��� ������ ���ʽ��� 100000���� �λ�, null Į���� �λ� �ȵ�
UPDATE itpay SET bonus= bonus + 100000;

-- ��� ������ ���ʽ��� 100000���� �λ�, null Į���� �λ�
SELECT NVL(bonus, 0) + 100000 FROM itpay;

-- ���ʽ��� ���� ���� ������ 100000�� ����
SELECT NVL(bonus, 0) + 100000 FROM itpay WHERE bonus IS NULL;


SELECT MAX(NVL(bonus, 0)) FROM itpay;
--MAX(NVL(BONUS,0))
-------------------
--           400000

SELECT MIN(NVL(bonus, 0)) FROM itpay; -- null�� 0���� �ٲٴ� ��Ȳ�̶� 0�� ��µ�
--MIN(NVL(BONUS,0))
-------------------
--                0

-- ��� �������� ���ʽ� ��ձݾ���?
SELECT AVG(bonus) FROM itpay; -- null ���� ���ܵǾ� ��հ��� ������ �߻� 
--AVG(BONUS)
------------
--    400000

-- �Լ����� Į�������� ���� ���� �������� ����
SELECT AVG(NVL(bonus, 0)) as pay_avg FROM itpay;
--AVG(NVL(BONUS,0))
-------------------
--           100000



4. GROUP BY
-- �μ��� ��� �޿��� ����ϼ���.
-- ����μ��� ��� �޿����� ������ �����ν� ��ġ�� ����.
SELECT AVG(bonbong) as bonbong
FROM itpay
GROUP BY part;   

   BONBONG
----------
   1735000
3731666.67
   3490000
   3840000
 
 
-- GROUP BY���� ��õ� �÷��� SELECT���� ����� �� �ֽ��ϴ�.
-- 100�� ������ ���
SELECT part, ROUND(AVG(bonbong), -2) as bonbong
FROM itpay
GROUP BY part;   

--PART                    BONBONG
---------------------- ----------
--��������                1735000
--������                  3731700
--DB������                3490000
--��ȹ������              3840000
 
SELECT * FROM itpay;
 
-- �μ���, ������ ��� �޿��� ����ϼ���, ������ �ȵ� ������ �����.
-- �׷��� �׷�, ���� �׷�
SELECT part, address, TRUNC(AVG(bonbong), -1) as pay
FROM itpay
GROUP BY part, address;   
 
 
-- �μ���, ������ ��� �޿��� ���Ͽ� �μ���, ��������
-- �������� ����ϼ���.
SELECT part, address, TRUNC(AVG(bonbong), -1) as bonbong
FROM itpay
GROUP BY part, address
ORDER BY part, address; 

PART                 ADDRESS                                               BONBONG
-------------------- -------------------------------------------------- ----------
DB������             ��⵵ ��õ��                                         3485000
DB������             ����� ������                                         3500000
������               ��⵵ ��õ��                                         4070000
������               ��⵵ ������                                         2890000
������               ����� ���Ǳ�                                         3733330
������               ��õ�� ��籸                                         4230000
��ȹ������           ����� ������                                         3840000
��������             ��⵵ ������                                         1530000
��������             ��õ�� ��籸                                         1940000
 
-- ������ �μ����� �޿��� ���������ǵ��� ���.
SELECT part, address, TRUNC(AVG(bonbong), -1) as bonbong
FROM itpay
GROUP BY part, address
ORDER BY part ASC, bonbong DESC; 

PART                 ADDRESS                                               BONBONG
-------------------- -------------------------------------------------- ----------
DB������             ����� ������                                         3500000
DB������             ��⵵ ��õ��                                         3485000
������               ��õ�� ��籸                                         4230000
������               ��⵵ ��õ��                                         4070000
������               ����� ���Ǳ�                                         3733330
������               ��⵵ ������                                         2890000
��ȹ������           ����� ������                                         3840000
��������             ��õ�� ��籸                                         1940000
��������             ��⵵ ������                                         1530000

 
 
6. GROUP BY���� ������ �̿��ϱ����� HAVING���� �̿�
 
-- �μ��� ��� �޿��� 300������ �Ѵ� �μ��� ���, 1�� �ڸ� �ݿø�
-- �׷��Լ� ���ǿ� WHERE ���� ����� �� �����ϴ�.
SELECT part, TRUNC(AVG(bonbong), -2) as bonbong
FROM itpay
GROUP BY part
HAVING AVG(bonbong) >= 3000000
ORDER BY part; 

PART                    BONBONG
-------------------- ----------
DB������                3490000
������                  3731600
��ȹ������              3840000
 
-- ERROR, HAVING ���� �׷�ȭ�Լ� �̻�� 
SELECT part, TRUNC(AVG(bonbong), -2) as avg_bonbong
FROM itpay
GROUP BY part
HAVING avg_bonbong >= 3000000
ORDER BY part; 

-- ERROR: SQL ����: ORA-00979: not a GROUP BY expression
-- �׷�ȭ �Լ� �̻�� + group by���� ������� �ʴ� Į�� ���-> ���� 
SELECT part, TRUNC(AVG(bonbong), -2) as avg_bonbong
FROM itpay
GROUP BY part
HAVING address LIKE '����%'
ORDER BY part; 
 
-- �׷�ȭ �Լ� �̻�� �� -> �׷�by�� �����ϴ� Į���� ����ؾ� ��
SELECT part, TRUNC(AVG(bonbong), -2) as avg_bonbong
FROM itpay
GROUP BY part
HAVING part = '������'
ORDER BY part; 

PART                 AVG_BONBONG
-------------------- -----------
������                   3731600 

-- ���� ����
-- WHERE ���� ���, ������ ����, 300������ �Ѵ� �μ��� �޿� ����
SELECT part, TRUNC(AVG(bonbong), -2) as bonbong
FROM itpay
WHERE part NOT LIKE '%������%'
GROUP BY part
HAVING AVG(bonbong) >= 3000000
ORDER BY part; 

PART                    BONBONG
-------------------- ----------
DB������                3490000
��ȹ������              3840000

7. �Լ��� ��ø
-- �μ��߿� ��� �޿��� ���� ���� �μ��� �ݾ��� õ�����̻� ����ϼ���. 
SELECT TRUNC(MAX(AVG(bonbong)), -3) as bonbong
FROM itpay
GROUP BY part;

   BONBONG
   ----------
   3840000

-- ERROR: group by���� ����� Į���� ����ϸ� �Ǿ���ϴµ�.. 
-- MAX()�� �׷�ȭ �Լ�
-- part�� ���� ���̰�, MAX() ��� ���� 1���� ���� ���̱� ������
-- MAX�� ���ϰ����� ó���Ǿ� �׷�ȭ �� �� ����
-- ���� �μ� �߿� ��� �޿��� ���� ���� �μ��� �ݾװ� �μ����� ����� �� ����.
-- -> �׷��� ���� ������ ����Ѵ�.
SELECT part, TRUNC(MAX(AVG(bonbong)), -3) as bonbong
FROM itpay
GROUP BY part;