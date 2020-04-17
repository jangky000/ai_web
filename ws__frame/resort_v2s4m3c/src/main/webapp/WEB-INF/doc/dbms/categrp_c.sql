/**********************************/
/* Table Name: ī�װ� �׷� */
/**********************************/
CREATE TABLE categrp(
		categrpno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(50)		 NOT NULL,
		seqno                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE categrp is 'ī�װ� �׷�';
COMMENT ON COLUMN categrp.categrpno is 'ī�װ� �׷��ȣ';
COMMENT ON COLUMN categrp.name is '�̸�';
COMMENT ON COLUMN categrp.seqno is '��� ����';
COMMENT ON COLUMN categrp.visible is '��� ���';
COMMENT ON COLUMN categrp.rdate is '�׷� ������';

-- ������ ����
CREATE SEQUENCE categrp_seq
    START WITH 1            -- ���� ��ȣ
    INCREMENT BY 1        -- ���� ����
    MAXVALUE 9999999999    -- �ִ밪�� 9999999999 -- NUMBER(10)�� ���� �Ǿ� �־�� ��
    CACHE 2                     -- 2���� �޸𸮿��� ���, 2�� �� ������Ʈ�� ���� ���� -> �ӵ� ���
    NOCYCLE;                   -- �ٽ� 1���� �����Ǵ� ���� ����
    
-- ������ ����
DROP SEQUENCE categrp_seq;

-- SQL ����� ����

-- INSERT
INSERT INTO categrp( categrpno, name, seqno, visible, rdate )
VALUES(categrp_seq.nextval, '���� ����', 1, 'Y', sysdate);

INSERT INTO categrp( categrpno, name, seqno, visible, rdate )
VALUES(categrp_seq.nextval, '�ؿ� ����', 2, 'Y', sysdate);

INSERT INTO categrp( categrpno, name, seqno, visible, rdate )
VALUES(categrp_seq.nextval, '���� �ڷ�', 3, 'Y', sysdate);


-- LIST
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY categrpno ASC;

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 ���� ����                                                   1 Y 2020-04-17 04:49:18
         2 �ؿ� ����                                                   2 Y 2020-04-17 04:49:18
         3 ���� �ڷ�                                                   3 Y 2020-04-17 04:49:18







