--2) ���̺� ����: �ڽ� -> �θ�
--�� �θ� ���̺� ���� �� ���� �߻�: DROP TABLE categrp; : ORA-02449: unique/primary keys in table referenced by foreign keys
--�� �ڽ� ���̺� ����: DROP TABLE cate;
--�� �θ� ���̺� ����: DROP TABLE categrp;
-- 
-- 
--3) ���̺� ����: �θ� -> �ڽ�
--�� FK cate �ڽ� ���̺� ���� �� ���� �߻�: ORA-00942: table or view does not exist
--�� �θ� ���̺� ���� ����: categrp
--�� �ڽ� ���̺� ����: cate

/**********************************/
/* Table Name: ī�װ� �׷� */
/**********************************/
--DROP TABLE categrp;
--CREATE TABLE categrp(
--		categrpno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
--		name                          		VARCHAR2(50)		 NOT NULL,
--		seqno                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
--		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
--		rdate                         		DATE		 NOT NULL
--);
--
--COMMENT ON TABLE categrp is 'ī�װ� �׷�';
--COMMENT ON COLUMN categrp.categrpno is 'ī�װ� �׷��ȣ';
--COMMENT ON COLUMN categrp.name is '�̸�';
--COMMENT ON COLUMN categrp.seqno is '��� ����';
--COMMENT ON COLUMN categrp.visible is '��� ���';
--COMMENT ON COLUMN categrp.rdate is '�׷� ������';


/**********************************/
/* Table Name: ī�װ� */
/**********************************/
DROP TABLE cate;
CREATE TABLE cate(
		cateno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		categrpno                     		NUMBER(10)		 NOT NULL,
		name                          		VARCHAR2(100)		 NOT NULL,
		seqno                         		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		cnt                           		NUMBER(10)		 DEFAULT 0		 NOT NULL,
  FOREIGN KEY (categrpno) REFERENCES categrp (categrpno)
);

COMMENT ON TABLE cate is 'ī�װ�';
COMMENT ON COLUMN cate.cateno is 'ī�װ� ��ȣ';
COMMENT ON COLUMN cate.categrpno is 'ī�װ� �׷��ȣ';
COMMENT ON COLUMN cate.name is 'ī�װ� �̸�';
COMMENT ON COLUMN cate.seqno is '��� ����';
COMMENT ON COLUMN cate.visible is '��� ���';
COMMENT ON COLUMN cate.rdate is '�����';
COMMENT ON COLUMN cate.cnt is '��ϵ� �ۼ�';

-- ������ ����
DROP SEQUENCE cate_seq;
-- ������ ����
CREATE SEQUENCE cate_seq
    START WITH 1            -- ���� ��ȣ
    INCREMENT BY 1        -- ���� ����
    MAXVALUE 9999999999    -- �ִ밪�� 9999999999 -- NUMBER(10)�� ���� �Ǿ� �־�� ��
    CACHE 2                     -- 2���� �޸𸮿��� ���, 2�� �� ������Ʈ�� ���� ���� -> �ӵ� ���
    NOCYCLE;                   -- �ٽ� 1���� �����Ǵ� ���� ����

-- 3) ERROR �߻��ϴ� ���
INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, 'SF', 1 , 'Y', sysdate, 0);

SELECT * FROM categrp;
-- �ܷ�Ű�� �������� �ʴ� ���
-- ORA-02291: integrity constraint (AI6.SYS_C007187) violated - parent key not found

-- �θ����̺� ���ڵ尡 ��� ����� ����

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

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 ��ȭ                                                        1 Y 2020-04-27 12:01:49
         2 ����                                                        2 Y 2020-04-27 12:01:49
         3 ķ��                                                        3 Y 2020-04-27 12:01:49
         
-- 4) ���� ���
INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, 'SF', 1 , 'Y', sysdate, 0);

INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, '���', 1 , 'Y', sysdate, 0);

INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, '������', 1 , 'Y', sysdate, 0);

-- 5) ���
SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
ORDER BY seqno;
    CATENO  CATEGRPNO NAME    SEQNO  V  RDATE      CNT
---------- ---------- ------------------- ---------- - ------------------- ----------
         1          1              SF             1       Y 2020-04-27 12:17:04          0
         2          1              ���       1       Y 2020-04-27 12:17:04          0
         3          1              ������        1      Y 2020-04-27 12:17:04          0


-- 6) �ڽ� ���ڵ� ����
DELETE FROM cate
WHERE cateno = 1;
    CATENO  CATEGRPNO NAME    SEQNO  V  RDATE      CNT
---------- ---------- ------------------- ---------- - ------------------- ----------
         2          1              ���       1       Y 2020-04-27 12:17:04          0
         3          1              ������        1      Y 2020-04-27 12:17:04          0


--DELETE
DELETE FROM categrp
WHERE categrpno=1;
-- ORA-02292: integrity constraint (AI6.SYS_C007208) violated - child record found
-- �ڽ� ���ڵ� �߿� grpno=1�� ����ϴ� ���ڵ尡 ������ �θ� ���ڵ� ���� �Ұ�

-- 7) categrpno FK ���� �̿��� ����
DELETE FROM cate
WHERE categrpno=1;

-- cate ���̺� ���ڵ尡 ���� ��� ���� ����
DELETE FROM categrp
WHERE categrpno=1;

SELECT * FROM categrp;
 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         2 ����                                                        2 Y 2020-04-27 12:01:49
         3 ķ��                                                        3 Y 2020-04-27 12:01:49

COMMIT;

-- 8) ��ȸ, ������
SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
WHERE cateno=1;

-- 9) ����
UPDATE cate
SET categrpno=1, name='�Ĵ�', seqno = 10, visible='N', cnt=0
WHERE cateno = 5;

commit;













