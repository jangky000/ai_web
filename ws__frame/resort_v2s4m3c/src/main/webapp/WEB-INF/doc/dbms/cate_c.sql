1) ���̺� ����: �ڽ� -> �θ�
�� DROP TABLE categrp; : ORA-02449: unique/primary keys in table referenced by foreign keys
�� �ڽ� ���̺� ����: DROP TABLE cate;
�� �θ� ���̺� ����: DROP TABLE categrp;
  
2) ���̺� ����: �θ� -> �ڽ�
�� FK cate ������ ���� �߻�: ORA-00942: table or view does not exist
�� �θ� ���̺� ���� ����: categrp
�� �ڽ� ���̺� ����: cate

/**********************************/
/* Table Name: ī�װ� */
/**********************************/
DROP TABLE contents;
DROP TABLE cate;
CREATE TABLE cate(
		cateno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		categrpno                     		NUMBER(10)		 NOT NULL,
		name                          		VARCHAR2(100)		 NOT NULL,
		seqno                         		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                           		DATE		 NOT NULL,
		cnt                           	    	NUMBER(10)		 DEFAULT 0		 NOT NULL,
  FOREIGN KEY (categrpno) REFERENCES categrp (categrpno)
);

COMMENT ON TABLE cate is 'ī�װ�';
COMMENT ON COLUMN cate.cateno is 'ī�װ� ��ȣ';
COMMENT ON COLUMN cate.categrpno is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN cate.name is 'ī�װ� �̸�';
COMMENT ON COLUMN cate.seqno is '��� ����';
COMMENT ON COLUMN cate.visible is '��� ���';
COMMENT ON COLUMN cate.rdate is '�����';
COMMENT ON COLUMN cate.cnt is '��ϵ� �� ��';

DROP SEQUENCE cate_seq;
CREATE SEQUENCE cate_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

3) ���
-- ERROR�� �߻��ϴ� ���
INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1000, 'SF', 1 , 'Y', sysdate, 0);

-- �������� ���
INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, 'SF', 1 , 'Y', sysdate, 0);

-- ORA-02291: integrity constraint (AI6.SYS_C007209) violated - parent key not found

SELECT * FROM categrp;
-- �θ� ���̺� ���ڵ尡 ��� ����� ���е�.

INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '��ȭ', 1, 'Y', sysdate);
 
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '����', 2, 'Y', sysdate);
 
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, 'ķ��', 3, 'Y', sysdate);

commit;

SELECT * FROM categrp;
 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 ��ȭ                                                        1 Y 2020-04-27 12:03:22
         2 ����                                                        2 Y 2020-04-27 12:03:22
         3 ķ��                                                        3 Y 2020-04-27 12:03:22

4) �������� ���
INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, 'SF', 1 , 'Y', sysdate, 0);

INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, '���', 1 , 'Y', sysdate, 0);

INSERT INTO cate(cateno, categrpno, name, seqno, visible, rdate, cnt)
VALUES(cate_seq.nextval, 1, '������', 1 , 'Y', sysdate, 0);

COMMIT;

5) ���
SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
ORDER BY cateno ASC;

    CATENO  CATEGRPNO NAME              SEQNO V RDATE                      CNT
---------- ---------- ------------------------- ---------- - ------------------- ----------
         1          1              SF                    1 Y 2020-04-27 12:16:37          0
         2          1              ���              1 Y 2020-04-27 12:16:37          0
         3          1              ������              1 Y 2020-04-27 12:16:37          0
         
SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
ORDER BY seqno ASC;


6) ����
DELETE FROM cate
WHERE cateno = 7;
commit;

SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
ORDER BY cateno ASC;

7) categrpno FK ���� �̿��� ����
DELETE FROM cate
WHERE categrpno = 1;

8) ��ȸ
SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
WHERE cateno=1;

9) ����
UPDATE cate
SET categrpno=1, name='�Ĵ�', seqno = 10, visible='N', cnt=0
WHERE cateno = 5;

commit;

10) ��� ���� ����, 10 �� 1
UPDATE cate
SET seqno = seqno - 1
WHERE cateno=1;
 
11) ��¼��� ����, 1 �� 10
UPDATE cate
SET seqno = seqno + 1
WHERE cateno=1;

commit;

12) ��� ����� ����
UPDATE cate
SET visible='Y'
WHERE cateno=1;

UPDATE cate
SET visible='N'
WHERE cateno=1;

commit;



