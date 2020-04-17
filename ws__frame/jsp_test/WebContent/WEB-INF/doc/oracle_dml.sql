CREATE TABLE sales(
    salesno  NUMBER(8)    NOT NULL, -- 판매 번호
    product VARCHAR(50) NOT NULL, -- 상품명
    price     NUMBER(8)    NOT NULL, -- 가격
    cnt       NUMBER(5)     NOT NULL, -- 수량
    dc        NUMBER(5,2)  NOT NULL, -- 할인율
    rdate     DATE              NOT NULL, -- 판매날짜
    PRIMARY KEY(salesno)
);

DROP TABLE sales;

-- 시퀀스 생성
CREATE SEQUENCE sales_seq
    START WITH 1            -- 시작 번호
    INCREMENT BY 1        -- 증가 단위
    MAXVALUE 99999999    -- 최대값ㅣ 9999999 -- NUMBER(8)이 선언 되어 있어야 함
    CACHE 2                     -- 2번은 메모리에서 계산, 2번 간 업데이트를 하지 않음 -> 속도 향상
    NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
    

-- 시퀀스 삭제
DROP SEQUENCE sales_seq;

-- INSERT
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '자바교재', 20000, 100, 0.1, SYSDATE);

INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '국내여행', 20000, 100, 0.05, SYSDATE);

-- 소수점을 포함한 자릿수 5자리까지 가능
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '해외여행', 20000, 100, 1000.01, SYSDATE);
오류 보고 -
ORA-01438: value larger than specified precision allowed for this column

-- 소수점 2자리까지만 입력할 수 있지만 오류 없이 입력이 된다. -> 소수점 3번째 자리가 자동 반올림
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '해외여행', 20000, 100, 10.001, SYSDATE);
SELECT salesno, product, price, cnt, dc, rdate FROM sales ORDER BY salesno ASC;
   SALESNO PRODUCT                                                 PRICE        CNT         DC RDATE              
---------- -------------------------------------------------- ---------- ---------- ---------- -------------------
            ...
         2 국내여행                                                20000        100     0.05 2020-03-25 10:23:26
         3 해외여행                                                20000        100         10 2020-03-25 10:37:50

-- 소수 자릿수에 맞추어 자동 반올림
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '하이킹', 10000, 100, 10.005, SYSDATE);
SELECT salesno, product, price, cnt, dc, rdate FROM sales ORDER BY salesno ASC;
   SALESNO PRODUCT                                                 PRICE        CNT         DC RDATE              
---------- -------------------------------------------------- ---------- ---------- ---------- -------------------
            ...
         3 해외여행                                                20000        100         10 2020-03-25 11:00:24
         4 하이킹                                                  10000        100      10.01 2020-03-25 11:00:34

-- 최대값 입력
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '강화도 여행', 9000, 100, 999.99, SYSDATE);
SELECT salesno, product, price, cnt, dc, rdate FROM sales ORDER BY salesno ASC;
   SALESNO PRODUCT                                                 PRICE        CNT         DC RDATE              
---------- -------------------------------------------------- ---------- ---------- ---------- -------------------
            ...
         4 하이킹                                                  10000        100      10.01 2020-03-25 11:00:34
         5 강화도 여행                                              9000        100     999.99 2020-03-25 11:00:45

-- 최소값 입력, -는 자릿수에 포함되지 않는다(당연한 이야기)
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '강화도 여행', 9000, 100, -999.99, SYSDATE);
SELECT salesno, product, price, cnt, dc, rdate FROM sales ORDER BY salesno ASC;
   SALESNO PRODUCT                                                 PRICE        CNT         DC RDATE              
---------- -------------------------------------------------- ---------- ---------- ---------- -------------------
            ...
         5 강화도 여행                                              9000        100     999.99 2020-03-25 11:00:45
         6 강화도 여행                                              9000        100    -999.99 2020-03-25 11:00:57
         
DELETE FROM sales WHERE salesno >= 1 AND salesno <= 5;
SELECT salesno, product, price, cnt, dc, rdate FROM sales ORDER BY salesno ASC;

UPDATE sales SET product='남해안 여행', price=15000, cnt = 3, dc = 5.5 WHERE salesno = 6;
SELECT salesno, product, price, cnt, dc, rdate FROM sales ORDER BY salesno ASC;
   SALESNO PRODUCT                                                 PRICE        CNT         DC RDATE              
---------- -------------------------------------------------- ---------- ---------- ---------- -------------------
         6 남해안 여행                                             15000          3        5.5 2020-03-25 11:00:57


-- 컬럼명이 COUNT(SALESNO)이면 개발자가 사용하기 불편하다 그래서 별명을 붙여준다
SELECT COUNT(salesno) AS order_cnt
FROM sales;
 ORDER_CNT
----------
         1
         
SELECT sysdate FROM dual;
SYSDATE            
-------------------
2020-03-25 11:02:33

-- 주문한 날짜만 출력( TO_CHAR( ) )
SELECT salesno, product, TO_CHAR(rdate, 'YYYY-MM-DD') AS rdate
FROM sales
ORDER BY salesno;
   SALESNO PRODUCT                                            RDATE     
---------- -------------------------------------------------- ----------
         6 남해안 여행                                        2020-03-25

-- 시:분:초까지 출력
SELECT salesno, product, TO_CHAR(rdate, 'YYYY-MM-DD HH:MI:SS') AS rdate
FROM sales
ORDER BY salesno;

-- 24시간제
SELECT salesno, product, TO_CHAR(rdate, 'YYYY-MM-DD HH24:MI:SS') AS rdate
FROM sales
ORDER BY salesno;

--특정 날짜를 지정해야하는 경우, 문자열로 입력
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '동해안 여행', 12000, 100, 10.0, '2020-4-5');
SELECT salesno, product, price, cnt, dc, rdate FROM sales ORDER BY salesno ASC;
   SALESNO PRODUCT                                                 PRICE        CNT         DC RDATE              
---------- -------------------------------------------------- ---------- ---------- ---------- -------------------
         6 남해안 여행                                             15000          3        5.5 2020-03-25 11:00:57
         7 동해안 여행                                             12000        100         10 2020-04-05 12:00:00
         
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '동해안 여행', 12000, 100, 10.0, '2020-04-05 13:13:05');
오류 보고 - 에러 발생시에도 시퀀스가 증가한다..
ORA-01849: hour must be between 1 and 12

INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '동해안 여행', 12000, 100, 10.0, '2020-04-05 11:13:05');
SELECT salesno, product, price, cnt, dc, rdate FROM sales ORDER BY salesno ASC;
   SALESNO PRODUCT                                                 PRICE        CNT         DC RDATE              
---------- -------------------------------------------------- ---------- ---------- ---------- -------------------
         6 남해안 여행                                             15000          3        5.5 2020-03-25 11:00:57
         7 동해안 여행                                             12000        100         10 2020-04-05 12:00:00
        10 동해안 여행                                             12000        100         10 2020-04-05 11:13:05

--24시간제 등록( TO_DATE( ) )
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES (sales_seq.nextval, '바다 여행', 12000, 100, 10.0, 
                TO_DATE('2020-10-01 15:13:05', 'YYYY-MM-DD HH24:MI:SS') );
SELECT salesno, product, price, cnt, dc, TO_CHAR(rdate, 'YYYY-MM-DD HH24:MI:SS') AS rdate FROM sales ORDER BY salesno ASC;

-- 오전 오후 출력
SELECT salesno, product, price, cnt, dc, TO_CHAR(rdate, 'YYYY-MM-DD HH24:MI:SS AM') AS rdate FROM sales ORDER BY salesno ASC;
   SALESNO PRODUCT                                                 PRICE        CNT         DC RDATE                     
---------- -------------------------------------------------- ---------- ---------- ---------- --------------------------
         6 남해안 여행                                             15000          3        5.5 2020-03-25 11:00:57 오전  
         7 동해안 여행                                             12000        100         10 2020-04-05 00:00:00 오전  
        10 동해안 여행                                             12000        100         10 2020-04-05 11:13:05 오전  
        11 바다 여행                                               12000        100         10 2020-10-01 15:13:05 오후  
 