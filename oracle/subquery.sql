[02] SubQuery(���͸�)
 --WHERE�� �ѹ��� �˻� ����� ������ ����
 -- �������� ���ǿ� ���� ���͸��� �ʿ��� ���ڵ��
 -- Subquery�� ����ϸ� ������.
1. WHERE���� ���������� ���
 
-- �������� ��� �޿�
SELECT AVG(bonbong) as bonbong
FROM itpay
WHERE part='������';

BONBONG
----------
3731666.67
 
 
-- �������� ��� �޿����� �޿��� ���� ���� ��� 
SELECT payno, part, sawon, bonbong
FROM itpay
WHERE bonbong >= (
                  SELECT AVG(bonbong)
                  FROM itpay
                  WHERE part='������'
);

     PAYNO PART                 SAWON         BONBONG
     ---------- -------------------- ---------- ----------
         4 ������               ��浿        4070000
         6 ��ȹ������           �ٱ浿        3840000
         7 ������               ��浿        4230000
         8 DB������             ��浿        4010000
        11 ������               �ֱ浿        4500000
        
 
-- �������� ��� �޿����� �޿��� ���� �������� �޿���
-- 20% �߰� ���� 
SELECT part, sawon, age, bonbong,
          bonbong * 0.2 as �߰��ݾ�, bonbong * 1.2 as �����޿�
FROM itpay
WHERE bonbong < (
                  SELECT AVG(bonbong)
                  FROM itpay
                  WHERE part='������'
);
 
PART                 SAWON             AGE    BONBONG   �߰��ݾ�   �����޿�
-------------------- ---------- ---------- ---------- ---------- ----------
��������             ���浿             27    1530000     306000    1836000
��������             ���浿             30    1940000     388000    2328000
������               �ٱ浿             34    2890000     578000    3468000
DB������             ���浿             38    2960000     592000    3552000
DB������             �̱浿             42    3500000     700000    4200000
������               �ű浿             33    3500000     700000    4200000
������               ���浿             29    3200000     640000    3840000
 
 
-- �������� ��� �޿����� �޿��� ���� �������� �޿���
-- 10% �谨 ��� 
SELECT part, sawon, age, bonbong,
          bonbong * 0.1 as �谨�ݾ�, bonbong * 0.9 as �����޿�
FROM itpay
WHERE bonbong >= (
                  SELECT AVG(bonbong)
                  FROM itpay
                  WHERE part='������'
);
 
PART                 SAWON             AGE    BONBONG    �谨�ݾ�    �����޿�
-------------------- ---------- ---------- ---------- ---------- ----------
������               ��浿             36    4070000     407000    3663000
��ȹ������           �ٱ浿             40    3840000     384000    3456000
������               ��浿             42    4230000     423000    3807000
DB������             ��浿             42    4010000     401000    3609000
������               �ֱ浿             31    4500000     450000    4050000
 
 
2. ������ ��ø
 
-- ���浿�� �μ� ���
   SELECT part
   FROM itpay
   WHERE sawon='���浿'

 PART                
--------------------
��������

-- ���浿�� �޿� ���
   SELECT bonbong
   FROM itpay
   WHERE sawon='���浿'
 
    BONBONG
----------
   1530000
 
-- ���浿�� ���� �μ��� ��� �޿� ���
   SELECT TRUNC(AVG(bonbong)) as bonbong
   FROM itpay
   WHERE part = (SELECT part
                 FROM itpay
                 WHERE sawon='���浿');
                 
    BONBONG
    ----------
    1735000
   
 
-- ���浿�� ���� �μ��� �ٹ��ϸ鼭 �� �μ��� 
-- ��ձ޿� ���� �޿��� ���� ���� ���
   SELECT payno, part, sawon, bonbong 
   FROM itpay
   WHERE 
         (
         part = (
                  SELECT part
                  FROM itpay
                  WHERE sawon='���浿'
                  )
         )     
         AND
         (
         bonbong > (
                     SELECT AVG(bonbong)
                     FROM itpay
                     WHERE part = (
                                          SELECT part
                                          FROM itpay
                                          WHERE sawon='���浿'
                                          )
                     )
         )
         
      PAYNO PART                 SAWON   BONBONG
    ---------- -------------------- ---------- ----------
         2 ��������             ���浿        1940000
   
   
3. Subquery + ROWNUM �÷��� �̿��� ���ڵ� ����, select �ÿ� �ڵ����� �Ϸù�ȣ�� �߰���.
 
SELECT payno, part, sawon, month, rownum
FROM itpay;
 
--      PAYNO PART                 SAWON      MONTH      ROWNUM
------------ -------------------- ---------- ------ ----------
--         1 ��������             ���浿     200801          1
--         2 ��������             ���浿     200801          2
--         3 ������               �ٱ浿     200801          3
 
-- rownum�� �����ǰ� ���� ���ĵ����� �����μ��� ��ġ�� ������
SELECT payno, part, sawon, rownum
FROM itpay
ORDER BY sawon;
 
--      PAYNO PART                 SAWON          ROWNUM
------------ -------------------- ---------- ----------
--         1 ��������             ���浿              1
--         8 DB������             ��浿              8
--         2 ��������             ���浿              2
 
-- sawon ������ ���� ������ �����ϰ� rownum�� �߰��մϴ�.
SELECT payno, part, sawon, rownum as r
FROM (
       SELECT payno, part, sawon 
       FROM itpay
       ORDER BY sawon
);

--     PAYNO PART                 SAWON               R
------------ -------------------- ---------- ----------
--         1 ��������             ���浿              1
--         8 DB������             ��浿              2
--         2 ��������             ���浿              3     
     
-- rownum �÷� ���� ���� ���ڵ� ����, ERROR, r �ν� �ȵ�, where ��� �Ұ���
SELECT payno, part, sawon, rownum as r
FROM (
       SELECT payno, part, sawon
       FROM itpay
       ORDER BY sawon
)
WHERE r >= 1 AND r <= 3; 
 
-- ERROR, r �ν� �ȵ�, where ��� �Ұ���
SELECT payno, part, sawon, rownum as r
FROM (
       SELECT payno, part, sawon
       FROM itpay
       ORDER BY sawon
)
WHERE r >= 4 AND r <= 6; 
 
 
-- rownum �÷� ���� ���� ���ڵ� 1~3 ����, ����¡ ���� ����
SELECT payno, part, sawon, r
FROM(
     SELECT payno, part, sawon, rownum as r
     FROM (
            SELECT payno, part, sawon
            FROM itpay
            ORDER BY sawon
    )
)
WHERE r >= 1 AND r <= 3;     

--     PAYNO PART                 SAWON               R
------------ -------------------- ---------- ----------
--         1 ��������             ���浿              1
--         8 DB������             ��浿              2
--         2 ��������             ���浿              3  
          
-- rownum �÷� ���� ���� ���ڵ� 4~6 ����
SELECT payno, part, sawon, r
FROM(
     SELECT payno, part, sawon, rownum as r
     FROM (
            SELECT payno, part, sawon
            FROM itpay
            ORDER BY sawon
    )
)
WHERE r >= 4 AND r <= 6;   
     
     
4. IN�� ���: Subquery�� ����� 2�� �̻��� ��� ���
   - �޿��� 300���� �Ѵ� ����� ���� ���̸� ������
     �ִ� ������ �޿� ������ ����ϼ���.
 
-- �޿��� 300������ �Ѵ� ������ ���̸� ����մϴ�.     
SELECT age 
FROM itpay
WHERE bonbong >= 3000000;

       AGE
----------
        36
        40
        42
        42
        42
        33
        31
        29
 
-- �ߺ��� ���� ����
SELECT DISTINCT age 
FROM itpay
WHERE bonbong >= 3000000;

       AGE
----------
        42
        29
        31
        40
        33
        36
 
-- �μ��� �ߺ��Ǿ� ���
SELECT part
FROM itpay;
 
-- �ߺ��� �μ��� ���� ���
SELECT DISTINCT part
FROM itpay;

PART                
--------------------
��������
������
DB������
��ȹ������
 
SELECT payno, part, sawon, age, bonbong
FROM itpay
WHERE age IN(27, 30);

     PAYNO PART                 SAWON             AGE    BONBONG
---------- -------------------- ---------- ---------- ----------
         1 ��������             ���浿             27    1530000
         2 ��������             ���浿             30    1940000

 
SELECT payno, part, sawon, age, address
FROM itpay
WHERE address IN('��õ�� ��籸', '��⵵ ������');

     PAYNO PART                 SAWON             AGE ADDRESS                                           
---------- -------------------- ---------- ---------- --------------------------------------------------
         1 ��������             ���浿             27 ��⵵ ������                                     
         2 ��������             ���浿             30 ��õ�� ��籸                                     
         3 ������               �ٱ浿             34 ��⵵ ������                                     
         7 ������               ��浿             42 ��õ�� ��籸                                     

 
-- �޿��� 300������ �Ѵ� ������ ���̿� ��ġ�ϴ� ������ ������ ��� ����մϴ�.
SELECT payno, part, sawon, age, bonbong
FROM itpay
WHERE age IN(
                    SELECT DISTINCT age 
                    FROM itpay
                    WHERE bonbong >= 3000000
                   )
ORDER BY age ASC;                   

     PAYNO PART                 SAWON             AGE    BONBONG
---------- -------------------- ---------- ---------- ----------
        12 ������               ���浿             29    3200000
        11 ������               �ֱ浿             31    4500000
        10 ������               �ű浿             33    3500000
         4 ������               ��浿             36     4070000
         6 ��ȹ������           �ٱ浿            40    3840000
         7 ������               ��浿             42     4230000
         9 DB������             �̱浿            42    3500000
         8 DB������             ��浿            42    4010000
         
         
         
         
        