--JOIN
--1) �θ� ���̺� ���� �� SELECT ���
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY categrpno ASC;

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 ��ȭ                                                        1 Y 2020-05-12 04:02:33
         2 ����                                                        2 Y 2020-05-12 04:02:33
         3 ķ��                                                        3 Y 2020-05-12 04:02:33

--2) �ڽ� ���̺� ���� �� SELECT ���
SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
ORDER BY cateno ASC;

    CATENO  CATEGRPNO NAME              SEQNO V RDATE                      CNT
---------- ---------- ------------------------- ---------- - ------------------- ----------
         1          1              SF                    1 Y 2020-04-27 12:16:37          0
         2          1              ���              1 Y 2020-04-27 12:16:37          0
         3          1              ������              1 Y 2020-04-27 12:16:37          0


-- 3) CROSS JOIN: 
-- �����μ� ��ġ�� ����
-- �θ����̺� ���ڵ� 3 * �ڽ����̺� ���ڵ� 3
SELECT categrp.categrpno, categrp.name, categrp.seqno,
            cate.cateno, cate.name, cate.seqno
FROM categrp, cate
ORDER BY categrp.categrpno, cate.cateno ASC;

-- ���̺� ����
SELECT r.categrpno, r.name, r.seqno,
            c.cateno, c.name, c.seqno
FROM categrp r, cate c
ORDER BY r.categrpno, c.cateno ASC;


-- Į�� ����
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r, cate c
ORDER BY r.categrpno, c.cateno ASC;

-- 4) Equal JOIN(INNER JOIN)
--- PK, FK �÷��� ���� ���ڵ� join
--- WHERE c.categrpno = t.categrpno: 2���� ���̺��� categrpno �÷��� ��ġ�ϴ�
--  ���ڵ常�� �о� �޸𸮻󿡼� �ϳ��� ���ڵ�� �����Ͽ� �޸� ���̺���
--  �����մϴ�. (DBMS�� ���� �޸� ���)
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r, cate c
WHERE r.categrpno = c.categrpno
ORDER BY r.categrpno, c.cateno ASC;

R_CATEGRPNO R_NAME                                                R_SEQNO   C_CATENO C_NAME                                                                                                  C_SEQNO
----------- -------------------------------------------------- ---------- ---------- ---------------------------------------------------------------------------------------------------- ----------
          1 ��ȭ                                                        1          1 SF                                                                                                            1
          1 ��ȭ                                                        1          2 ���                                                                                                        1
          1 ��ȭ                                                        1          3 ������                                                                                                        1

-- INNER JOIN + WHERE�� ���� �߰�(AND)
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r, cate c
WHERE r.categrpno = c.categrpno AND c.name = 'SF'
ORDER BY r.categrpno, c.cateno ASC;

-- ANSI:
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r 
INNER JOIN cate c 
ON r.categrpno = c.categrpno
ORDER BY r.categrpno, c.cateno ASC;

R_CATEGRPNO R_NAME                                                R_SEQNO   C_CATENO C_NAME                                                                                                  C_SEQNO
----------- -------------------------------------------------- ---------- ---------- ---------------------------------------------------------------------------------------------------- ----------
          1 ��ȭ                                                        1          1 SF                                                                                                            1
          1 ��ȭ                                                        1          2 ���                                                                                                        1
          1 ��ȭ                                                        1          3 ������                                                                                                        1

--ANSI + WHERE ��� ����
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r 
INNER JOIN cate c 
ON r.categrpno = c.categrpno
WHERE c.name = 'SF'
ORDER BY r.categrpno, c.cateno ASC;

R_CATEGRPNO R_NAME                                                R_SEQNO   C_CATENO C_NAME                                                                                                  C_SEQNO
----------- -------------------------------------------------- ---------- ---------- ---------------------------------------------------------------------------------------------------- ----------
          1 ��ȭ                                                        1          1 SF                                                                                                            1

-- 5) LEFT Outer join
--- �θ� ���̺��� PK�� �ڽ� ���̺��� ������ �ʴ� PK�� ��½� ���
--- �ڽ� ���̺� ���⿡ ������ '+'�� �����ϴ� ���ڵ尡 ������ NULL ������ ���
--- ��ġ���� �ʾƵ� PK �θ�(����) ���̺� ���ڵ� ��� ��µ�.
-- �ڽ� �ʿ� (+)�� ����
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r, cate c
WHERE r.categrpno = c.categrpno(+)
ORDER BY r.categrpno, c.cateno ASC;

R_CATEGRPNO R_NAME                                                R_SEQNO   C_CATENO C_NAME                                                                                                  C_SEQNO
----------- -------------------------------------------------- ---------- ---------- ---------------------------------------------------------------------------------------------------- ----------
          1 ��ȭ                                                        1          1 SF                                                                                                            1
          1 ��ȭ                                                        1          2 ���                                                                                                        1
          1 ��ȭ                                                        1          3 ������                                                                                                        1
          2 ����                                                        2                                                                                                                           
          3 ķ��                                                        3                                                                                                                           

-- ANSI
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r 
LEFT OUTER JOIN cate c
ON r.categrpno = c.categrpno
ORDER BY r.categrpno, c.cateno ASC;

R_CATEGRPNO R_NAME                                                R_SEQNO   C_CATENO C_NAME                                                                                                  C_SEQNO
----------- -------------------------------------------------- ---------- ---------- ---------------------------------------------------------------------------------------------------- ----------
          1 ��ȭ                                                        1          1 SF                                                                                                            1
          1 ��ȭ                                                        1          2 ���                                                                                                        1
          1 ��ȭ                                                        1          3 ������                                                                                                        1
          2 ����                                                        2                                                                                                                           
          3 ķ��                                                        3                                                                                                                           

-- 6) RIGHT Outer join
--- ������ �ڽ� ���̺� ���� ���ڵ� ��� ���
--- �Ϲ������� INNER join�� ������ ���
--- �θ� ���̺��� PK�� FK�� ������� ���� �ڽ� ���̺� ���ڵ� ���
--- INSERT�ÿ� PK, FK ���������� �ɸ���� FK�� �ݵ�� ���� �־�������� �����μ��� ��ġ�� ������.
--- ���������� ��������� ���� �߰��� �ڽ� ���ڵ��� �߰�(���� ���� ����)
-- �̰� ����ؾ� �ϴ� ��Ȳ�� �߻��ϸ� ���踦 �߸����� ���ɼ��� ũ��
-- ���������� ������ �ʰ� ������Ʈ�� �����Ѵ� -> �������� ����
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r, cate c
WHERE r.categrpno(+) = c.categrpno
ORDER BY r.categrpno, c.cateno ASC;

R_CATEGRPNO R_NAME                                                R_SEQNO   C_CATENO C_NAME                                                                                                  C_SEQNO
----------- -------------------------------------------------- ---------- ---------- ---------------------------------------------------------------------------------------------------- ----------
          1 ��ȭ                                                        1          1 SF                                                                                                            1
          1 ��ȭ                                                        1          2 ���                                                                                                        1
          1 ��ȭ                                                        1          3 ������                                                                                                        1

-- ANSI
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r 
RIGHT OUTER JOIN cate c
ON r.categrpno = c.categrpno
ORDER BY r.categrpno, c.cateno ASC;

R_CATEGRPNO R_NAME                                                R_SEQNO   C_CATENO C_NAME                                                                                                  C_SEQNO
----------- -------------------------------------------------- ---------- ---------- ---------------------------------------------------------------------------------------------------- ----------
          1 ��ȭ                                                        1          1 SF                                                                                                            1
          1 ��ȭ                                                        1          2 ���                                                                                                        1
          1 ��ȭ                                                        1          3 ������                                                                                                        1

-- 7) FULL OUTER JOIN 
--- left outer join, right outer join�� ����
--- �Ϲ������� left outer join�� ����� ����
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r 
FULL OUTER JOIN cate c
ON r.categrpno = c.categrpno
ORDER BY r.categrpno, c.cateno ASC;

R_CATEGRPNO R_NAME                                                R_SEQNO   C_CATENO C_NAME                                                                                                  C_SEQNO
----------- -------------------------------------------------- ---------- ---------- ---------------------------------------------------------------------------------------------------- ----------
          1 ��ȭ                                                        1          1 SF                                                                                                            1
          1 ��ȭ                                                        1          2 ���                                                                                                        1
          1 ��ȭ                                                        1          3 ������                                                                                                        1
          2 ����                                                        2                                                                                                                           
          3 ķ��                                                        3                                                                                                                           






















--INNER JOIN�� EXISTS �� 1:N ���迡�� ���� 1���� ����� �� EXISTS�� ������ �� ����
SELECT DISTINCT S.categrpno, S.name, S.seqno, S.visible, S.rdate
FROM categrp S INNER JOIN cate P ON P.categrpno = S.categrpno;

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 ��ȭ                                                        1 Y 2020-05-12 04:02:33

SELECT *
FROM categrp S
WHERE EXISTS (SELECT 'x' FROM cate P WHERE P.categrpno = S.categrpno);

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 ��ȭ                                                        1 Y 2020-05-12 04:02:33





















