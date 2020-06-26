SELECT * FROM book;

INSERT INTO book(no, name, phone, email, rdate)
VALUES(book_seq.nextval, '김수현', '111-1111-1111', 'mail1', sysdate);
-- 에러발생
-- ORA-00001: unique constraint (AI6.SYS_C007873) violated
-- MySQL과 다르게 DataFrame에서 no를 지정해 입력한 후 ->  시퀀스의 번호가 증가되지 않음

COMMIT; -- 이거 안 하면 timeout 발생

-- Sequence 사용하지 않고 생성하는 기법
SELECT MAX(no) as no FROM book;

SELECT NVL(MAX(no), 0) as no FROM book;

SELECT NVL(MAX(no), 0) + 1 as no FROM book;

INSERT INTO book(no, name, phone, email, rdate)
VALUES((SELECT NVL(MAX(no), 0) + 1 as no FROM book), '김수현', '111-1111-1111', 'mail1', sysdate);

INSERT INTO book(no, name, phone, email, rdate)
VALUES((SELECT NVL(MAX(no), 0) + 1 as no FROM book), '서예지', '111-1111-1111', 'mail1', sysdate);