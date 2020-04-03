-- ���ϸ�: notice_v1jc.sql
-- ���̺��: ��������(notice)
-- �Ӽ�: ������ȣ, ����, ����, ����� ����, �н�����, �����
DROP TABLE mail_app;

CREATE TABLE mail_app (
  mailno    NUMBER(7)      NOT NULL, -- -9999999 ~ 9999999, �������� ��ȣ
  title         VARCHAR(100)  NOT NULL, -- ����
  content   CLOB                 NOT NULL,-- ������ ���� �� �����Ƿ� CLOB
  mail_from     VARCHAR(100)     NOT NULL, -- ������ ��� ip
  mail_to       VARCHAR(100) NOT NULL, -- �޴� ��� ip
  rdate      DATE               NOT NULL, -- �����
  url1        VARCHAR(1000), -- ÷�� ��ũ
  url2        VARCHAR(1000), -- ÷�� ��ũ
  youtube        VARCHAR(1000), -- ÷�� ��ũ
  cnt         NUMBER(7) DEFAULT 0, -- ��ȸ��
  PRIMARY KEY(mailno)
);

-- url1�� �Է� ���� ���̸� ����
ALTER TABLE mail_app 
MODIFY(url1 VARCHAR(1000));

DROP SEQUENCE mail_seq;

CREATE SEQUENCE mail_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE  9999999
  CACHE  2
  NOCYCLE;

-- ������ ������ �� �� �ִ�.
-- ���̺� ����� ����ǰ� �ִ�.
SELECT * FROM user_sequences;


-- ���(INSERT INTO VALUES)
--INSERT INTO mail_app(mailno, title, content, mail_from, mail_to, rdate )
--VALUES (mail_seq.nextval, '���Ͽ� �������ּż� �����մϴ�', '���Ͽ� �������ּż� �����մϴ�. ���� �̿� ��Ź�帳�ϴ�.', '172.16.12.4', '172.16.12.4', sysdate);
--
--INSERT INTO mail_app(mailno, title, content, mail_from, mail_to, rdate )
--VALUES (mail_seq.nextval, '����', '����� �����ǿ� ���� ����/������ �Է����ּ���', '172.16.12.4', '172.16.12.4', sysdate);

-- FOR LOOP ����
SET serveroutput ON;
BEGIN
	FOR i in 1..100 LOOP
            INSERT INTO mail_app(mailno, title, content, mail_from, mail_to, rdate ) VALUES (mail_seq.nextval, '���Ͽ� �������ּż� �����մϴ�', '���Ͽ� �������ּż� �����մϴ�. ���� �̿� ��Ź�帳�ϴ�.', '172.16.12.4', '172.16.12.'||i, sysdate);
			INSERT INTO mail_app(mailno, title, content, mail_from, mail_to, rdate ) VALUES (mail_seq.nextval, '����', '����� �����Ǹ� �����Ͽ� ������ ����������', '172.16.12.4', '172.16.12.'||i, sysdate);
	END LOOP;
END;

SELECT mailno, title, content, mail_from, mail_to, rdate, url1, url2, youtube, cnt
FROM mail_app
WHERE mail_from = '172.16.12.4' -- ""�� ���ڿ��� �ν����� ���� �̱������̼� ����ؾ� ��
ORDER BY mailno DESC;



-- ��ȸ(SELECT FROM WHERE)
SELECT mailno, title, content, mail_from, mail_to, rdate, url1
FROM mail_app
WHERE mailno=2;


-- ����(UPDATE SET WHERE)
-- PK�� ���ϵ� ������ ������ ��������� �������� ����
-- ������ �����ͺ��̽�, RDBMS�� ������ �Ϲ������� ���� �Ұ���
UPDATE mail_app 
SET title='���Ͽ� �������ּż� �����մϴ�', content='���Ͽ� �������ּż� �����մϴ�'
WHERE mailno=1;


-- ����
DELETE FROM mail_app WHERE mailno=1;

-- ��� �������� ��
SELECT COUNT(*) AS cnt FROM mail_app;
  
-- ��ȸ��, ���� ��¥ ���� �÷� �߰� ����

-- ���� ���� ����, �ڹٿ� sqldeveloper ����ȭ
COMMIT;

SELECT mailno, title, content, mail_from, mail_to, rdate, url1, url2, youtube
FROM mail_app
ORDER BY mailno DESC;

--SET serveroutput ON;
--BEGIN
--	FOR i in 1..100 LOOP
--	  	if mod(i, 2) = 1 then 
--            INSERT INTO mail_app(mailno, title, content, mail_from, mail_to, rdate ) VALUES (100+i, '���Ͽ� �������ּż� �����մϴ�', '���Ͽ� �������ּż� �����մϴ�. ���� �̿� ��Ź�帳�ϴ�.', '172.16.12.4', '172.16.12.'||i, sysdate);
--		else
--			INSERT INTO mail_app(mailno, title, content, mail_from, mail_to, rdate ) VALUES (100+i, '����', '����� �����ǿ� ���� ����/������ �Է����ּ���', '172.16.12.4', '172.16.12.'||i, sysdate);
--		end if;
--	END LOOP;
--END;

     
UPDATE mail_app SET cnt=2 WHERE mailno=8;

SELECT mailno, title, content, mail_from, mail_to, rdate, url1, url2, youtube, cnt
FROM mail_app
WHERE mail_from = '172.16.12.4' -- ""�� ���ڿ��� �ν����� ���� �̱������̼� ����ؾ� ��
ORDER BY mailno DESC;