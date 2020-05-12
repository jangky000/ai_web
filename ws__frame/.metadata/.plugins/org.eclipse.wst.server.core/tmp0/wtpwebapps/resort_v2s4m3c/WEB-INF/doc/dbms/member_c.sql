/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE member(
		memberno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE member is 'ȸ��';
COMMENT ON COLUMN member.memberno is 'ȸ�� ��ȣ';

DROP SEQUENCE member_seq;
CREATE SEQUENCE member_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
INSERT INTO member(memberno)
VALUES(member_seq.nextval);

SELECT * FROM member;
  MEMBERNO
----------
         1
         
COMMIT;

         






