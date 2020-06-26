SELECT * FROM book;

INSERT INTO book(no, name, phone, email, rdate)
VALUES(book_seq.nextval, '�����', '111-1111-1111', 'mail1', sysdate);
-- �����߻�
-- ORA-00001: unique constraint (AI6.SYS_C007873) violated
-- MySQL�� �ٸ��� DataFrame���� no�� ������ �Է��� �� ->  �������� ��ȣ�� �������� ����

COMMIT; -- �̰� �� �ϸ� timeout �߻�

-- Sequence ������� �ʰ� �����ϴ� ���
SELECT MAX(no) as no FROM book;

SELECT NVL(MAX(no), 0) as no FROM book;

SELECT NVL(MAX(no), 0) + 1 as no FROM book;

INSERT INTO book(no, name, phone, email, rdate)
VALUES((SELECT NVL(MAX(no), 0) + 1 as no FROM book), '�����', '111-1111-1111', 'mail1', sysdate);

INSERT INTO book(no, name, phone, email, rdate)
VALUES((SELECT NVL(MAX(no), 0) + 1 as no FROM book), '������', '111-1111-1111', 'mail1', sysdate);