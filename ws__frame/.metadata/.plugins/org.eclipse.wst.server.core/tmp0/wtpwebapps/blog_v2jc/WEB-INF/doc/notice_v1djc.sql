-- ���ϸ�: notice_v1jc.sql
-- ���̺��: ��������(notice)
-- �Ӽ�: ������ȣ, ����, ����, ����� ����, �н�����, �����
DROP TABLE notice;

CREATE TABLE notice (
  noticeno  NUMBER(7)      NOT NULL, -- -9999999 ~ 9999999, �������� ��ȣ
  title        VARCHAR(100)  NOT NULL, -- ����
  content CLOB                 NOT NULL,-- ������ ���� �� �����Ƿ� CLOB
  rname     VARCHAR(20)     NOT NULL, -- ����� ����
  passwd VARCHAR(20)    NOT NULL, -- �н�����
  rdate      DATE               NOT NULL, -- �����
  PRIMARY KEY(noticeno)
);



CREATE SEQUENCE notice_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE  9999999
  CACHE  2
  NOCYCLE;

-- ������ ������ �� �� �ִ�.
-- ���̺� ����� ����ǰ� �ִ�.
SELECT * FROM user_sequences;
SEQUENCE_NAME                   MIN_VALUE  MAX_VALUE INCREMENT_BY C O CACHE_SIZE LAST_NUMBER
------------------------------ ---------- ---------- ------------ - - ---------- -----------
MEMO_SEQ                                1    9999999            1 N N          2           7
NOTICE_SEQ                              1    9999999            1 N N          2           1
SALES_SEQ                               1   99999999            1 N N          2          13

-- ���(INSERT INTO VALUES)
INSERT INTO notice(noticeno, title, content, rname, passwd, rdate )
VALUES (notice_seq.nextval, '4�� open �ȳ�.', '�ڷγ�19 �غ� ġŲ "50%" ����', '�Ʒι�', '1234', sysdate);

INSERT INTO notice(noticeno, title, content, rname, passwd, rdate )
VALUES (notice_seq.nextval, '�濪 �ȳ�.', '�츮 ������ �����մϴ�.', '�մ���', '1234', sysdate);

-- ���(SELECT FROM ORDER BY)
-- �ֽ� ���������� ����
-- ��й�ȣ�� ���� ��ȣȭ ���� ����
SELECT noticeno, title, content, rname, passwd, rdate
FROM notice
ORDER BY noticeno DESC;
NOTICENO TITLE                        CONTENT                                      RNAME                PASSWD               RDATE              
---------- ---------------------------------------------------------------------------------------------------- -----------------------------------------------
         2 �濪 �ȳ�.                       �츮 ������ �����մϴ�.                     �մ���               1234                 2020-03-26 10:20:42
         1 4�� open �ȳ�.                �ڷγ�19 �غ� ġŲ "50%" ����           �Ʒι�               1234                 2020-03-26 10:15:37

-- ��ȸ(SELECT FROM WHERE)
SELECT noticeno, title, content, rname, passwd, rdate
FROM notice
WHERE noticeno=2;
NOTICENO TITLE                        CONTENT                                      RNAME                PASSWD               RDATE              
---------- ---------------------------------------------------------------------------------------------------- -----------------------------------------------
         1 4�� open �ȳ�.                �ڷγ�19 �غ� ġŲ "50%" ����           �Ʒι�               1234                 2020-03-26 10:15:37

-- �н����� �˻�: 1: ��ġ 0: ����ġ
SELECT COUNT(*) AS passwd_cnt
FROM notice
WHERE noticeno = 2 AND passwd='1234';


-- ����(UPDATE SET WHERE)
-- PK�� ���ϵ� ������ ������ ��������� �������� ����
-- ������ �����ͺ��̽�, RDBMS�� ������ �Ϲ������� ���� �Ұ���
UPDATE notice 
SET title='����Ʈ �ݾ� ���� �ȳ�', content='���� �ݾ��� 10% ������ ĳ�ù�', rname='ȫ�浿' 
WHERE noticeno=1;

  NOTICENO TITLE                      CONTENT                                 RNAME                PASSWD               RDATE              
---------- --------------------------------------------------------------------------------------------------------------- -------------------- ----------
         1 ����Ʈ �ݾ� ���� �ȳ�      ���� �ݾ��� 10% ������ ĳ�ù�       ȫ�浿               1234                 2020-03-26 10:15:37

-- ����
DELETE FROM notice WHERE noticeno=1;

-- ��� �������� ��
SELECT COUNT(*) AS cnt 
FROM notice;


       CNT
----------
         1
         
-- ��ȸ��, ���� ��¥ ���� �÷� �߰� ����

-- ���� ���� ����, �ڹٿ� sqldeveloper ����ȭ
COMMIT;







-- ����¡ ���� step1
SELECT noticeno, title, rname, passwd, rdate
FROM notice
ORDER BY noticeno DESC;

-- ����¡ ���� step2
-- rownum ����
 SELECT noticeno, title, rname, passwd, rdate, rownum as r
 FROM(
        SELECT noticeno, title, rname, passwd, rdate
        FROM notice
        ORDER BY noticeno DESC
);


-- ����¡ ���� step3
-- rownum ����
-- contentó�� �ʿ� ���� ������ Į���� �������� �ʴ� ���� ����. �޸� ���� �߻�
SELECT noticeno, title, rname, passwd, rdate, r
FROM(
        SELECT noticeno, title, rname, passwd, rdate, rownum as r
        FROM(
                SELECT noticeno, title, rname, passwd, rdate
                FROM notice
                ORDER BY noticeno DESC
        )
)
WHERE r>=4 AND r<=6;













