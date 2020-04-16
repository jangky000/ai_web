-- ������ ����
CREATE SEQUENCE memo_seq
    START WITH 1            -- ���� ��ȣ
    INCREMENT BY 1        -- ���� ����
    MAXVALUE 9999999    -- �ִ밪�� 9999999 -- NUMBER(7)�� ���� �Ǿ� �־�� ��
    CACHE 2                     -- 2���� �޸𸮿��� ���, 2�� �� ������Ʈ�� ���� ���� -> �ӵ� ���
    NOCYCLE;                   -- �ٽ� 1���� �����Ǵ� ���� ����
    

-- ������ ����
DROP SEQUENCE memo_seq;

-- sequence ���
-- dual: sql ������ �����ϱ� ���� �ý��� ���̺�
-- ����Ŭ�� from�� �� �־�� ��, mysql�� from�� ���� ��쵵 ����?
SELECT memo_seq.nextval FROM dual;

-- ������� ������ �� Ȯ��
SELECT memo_seq.currval FROM dual;


DROP TABLE memo;
-- ���̺����� sequence ���
CREATE TABLE memo(
    memono NUMBER(7) NOT NULL,
    title VARCHAR(100) NOT NULL,
    PRIMARY KEY(memono)
);

INSERT INTO memo(memono, title)
VALUES(memo_seq.nextval, '�������� ����');

INSERT INTO memo(memono, title)
VALUES(memo_seq.nextval, '�������� �׽�Ʈ');

INSERT INTO memo(memono, title)
VALUES(memo_seq.nextval, '�������� ����');

SELECT memono, title FROM memo ORDER BY memono ASC;
    MEMONO TITLE                                                                                               
---------- ----------------------------------------------------------------------------------------------------
         2 �������� ����                                                                                       
         3 �������� �׽�Ʈ                                                                                     
         4 �������� ����  

-- �������� ��ϵ� ���ڵ��� ����
DELETE FROM memo WHERE memono = 4;

-- �ѹ� ������ ��ȣ�� �ٽ� �������� ����
INSERT INTO memo(memono, title)
VALUES(memo_seq.nextval, '�������� ����');

SELECT memono, title FROM memo ORDER BY memono ASC;
    MEMONO TITLE                                                                                               
---------- ----------------------------------------------------------------------------------------------------
         2 �������� ����                                                                                       
         3 �������� �׽�Ʈ                                                                                     
         4 �������� ����   