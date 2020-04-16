DROP TABLE PG;
 
CREATE TABLE PG(
  num NUMBER(5) NOT NULL,
  title  VARCHAR(20) NOT NULL,
  PRIMARY KEY(num)
);

-- ���� ����: SQL ���ο� SQL ���, ()�� �����ؾ���, ���������� ���� ����.
-- (SELECT NVL(MAX(num), 0) +1 as num FROM pg)
-- MAX(): �ִ밪�� �������� �Լ�, ���ڵ尡 ������ null�� ����
-- NVL(MAX(num), 0): MAX �Լ��� null�̸� 0���� ��ü
-- SELECT MAX(num) as num FROM pg -- null ���
-- SELECT MAX(num)+1 as num FROM pg -- null + 1 = null ���
SELECT NVL(MAX(num), 0) +1 as num FROM pg -- 0 + 1 = 1 ���
--  ���ڵ尡 ���� ���� ��, ������ ��ſ� ��� ����


INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '01��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '02��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '03��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '04��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '05��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '06��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '07��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '08��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '09��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '10��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '11��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '12��');
 
SELECT num, title FROM pg;
 
 NUM TITLE
 --- -----
   1 01��
   2 02��
   3 03��
   4 04��
   5 05��
   6 06��
   7 07��
   8 08��
   9 09��
  10 10��
  11 11��
  12 12��
 
-- �б⺰�� �����Ͽ� ���ڵ带 �����ϴ� ���(����¡)
SELECT num, title FROM pg;
 
-- rownum: oralce system���� select�ÿ� �ڵ����� �ٿ��ִ� �Ϸù�ȣ
SELECT num, title, rownum FROM pg;
 
 NUM TITLE ROWNUM
 --- ----- ------
   1 01��        1
   2 02��        2
   3 03��        3
   4 04��        4
   5 05��        5
   6 06��        6
   7 07��        7
   8 08��        8
   9 09��        9
  10 10��       10
  11 11��       11
  12 12��       12
 
-- 2,3�� ����
DELETE FROM pg WHERE num=2 or num=3;
 
SELECT num, title, rownum FROM pg;
 
 NUM TITLE ROWNUM
 --- ----- ------
   1 01��        1
   4 04��        2
   5 05��        3
   6 06��        4
   7 07��        5
   8 08��        6
   9 09��        7
  10 10��        8
  11 11��        9
  12 12��       10
 
 
-- ����¡�ô� ������ �������� �����Ǵ� rownum ���� ����մϴ�.
-- rownum����: rownum�� ����(ORDER BY ~)���� ���� ����������
   ������ �� �� rownum �÷��� ����մϴ�.
 
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '����');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '����');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '�ܿ�');
 
-- Paging Step 1
-- SELECT �� ROWNUM ���� �� ORDER BY ~
SELECT num, title, rownum 
FROM pg
ORDER BY title ASC;
 
 NUM TITLE ROWNUM
 --- ----- ------
   1 01��        1
   4 04��        4
   5 05��        5
   6 06��        6
   7 07��        7
   8 08��        8
   9 09��        9
  10 10��       10
  11 11��       11
  12 12��       12
  15 ����         2
  16 �ܿ�         3
  13 ��         13
  14 ����        14
  
  
-- Paging Step 2, subquery, ���� View�� ���
SELECT num, title, rownum
FROM (
           SELECT num, title 
           FROM pg
           ORDER BY title ASC
);
 
  NUM TITLE ROWNUM
 --- ----- ------
   1 01��        1
   4 04��        2
   5 05��        3
   6 06��        4
   7 07��        5
   8 08��        6
   9 09��        7
  10 10��        8
  11 11��        9
  12 12��       10
  13 ��          11
  14 ����        12
  15 ����        13
  16 �ܿ�        14

-- �������� �ʴ� �÷��� ���� ERROR
SELECT num, title, rownum
FROM (
           SELECT num 
           FROM pg
           ORDER BY num ASC
);  
-- ORA-00904: "TITLE": invalid identifier
  
-- 2,3 ���� �߰��ϼ���.
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '02��');
INSERT INTO pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '03��');
 
SELECT num, title
FROM pg;

 NUM TITLE
 --- -----
   1 01��
  15 ����
  16 �ܿ�
   4 04��
   5 05��
   6 06��
   7 07��
   8 08��
   9 09��
  10 10��
  11 11��
  12 12��
  13 ��
  14 ����
  17 02��
  18 03��
  

-- ��� �ٽ� ���, �� rownum�� �����ǰ� ���� ����� �۵���
-- SELECT �� ROWNUM ���� �� ORDER BY ~
SELECT num, title, rownum
FROM pg
ORDER BY title ASC;
  
 NUM TITLE ROWNUM
 --- ----- ------
   1 01��        1
  17 02��       15
  18 03��       16
   4 04��        4
   5 05��        5
   6 06��        6
   7 07��        7
   8 08��        8
   9 09��        9
  10 10��       10
  11 11��       11
  12 12��       12
  15 ����         2
  16 �ܿ�         3
  13 ��          13
  14 ����        14
  
-- Subquery���� ������ rownum�� ���
SELECT num, title, rownum
FROM (
           SELECT num, title
           FROM pg
           ORDER BY title ASC
);
 
 NUM TITLE ROWNUM
 --- ----- ------
   1 01��        1
  17 02��        2
  18 03��        3
   4 04��        4
   5 05��        5
   6 06��        6
   7 07��        7
   8 08��        8
   9 09��        9
  10 10��       10
  11 11��       11
  12 12��       12
  15 ����        13
  16 �ܿ�        14
  13 ��          15
  14 ����        16
 
-- 2������ ���ڵ� ���ҽ� ������ �߻� 
-- �ϳ��� �������� ���ڵ� 3���� ���� 
SELECT num, title, rownum
FROM (
           SELECT num, title
           FROM pg
           ORDER BY title ASC
)
WHERE rownum>=1 AND rownum <=3;
 
 NUM TITLE ROWNUM
 --- ----- ------
   1 01��        1
  17 02��        2
  18 03��        3
 
-- 2 ������ ��½� ���� �߻� 
-- ??
SELECT num, title, rownum
FROM (
           SELECT num, title
           FROM pg
           ORDER BY title ASC
)
WHERE rownum>=4 AND rownum <=6;
 
 NUM TITLE ROWNUM
 --- ----- ------
 
-- Paging Step 3, subquery
-- 1 �б�
SELECT num, title, r
FROM(
         SELECT num, title, rownum as r
         FROM (
                   SELECT num, title 
                   FROM pg
                   ORDER BY title ASC
         )  
)
WHERE r>=1 AND r <=3;
 
 NUM TITLE R
 --- ----- -
   1 01��   1
  17 02��   2
  18 03��   3
   
-- 2 �б�
SELECT num, title, r
FROM(
         SELECT num, title, rownum as r
         FROM (
                   SELECT num, title 
                   FROM pg
                   ORDER BY title ASC
         )  
)
WHERE r>=4 AND r <=6;
   
 NUM TITLE R
 --- ----- -
   4 04��   4
   5 05��   5
   6 06��   6