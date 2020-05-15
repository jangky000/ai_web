--JOIN
--1) 부모 테이블 생성 후 SELECT 결과
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY categrpno ASC;

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 영화                                                        1 Y 2020-05-12 04:02:33
         2 여행                                                        2 Y 2020-05-12 04:02:33
         3 캠핑                                                        3 Y 2020-05-12 04:02:33

--2) 자식 테이블 생성 후 SELECT 결과
SELECT cateno, categrpno, name, seqno, visible, rdate, cnt
FROM cate
ORDER BY cateno ASC;

    CATENO  CATEGRPNO NAME              SEQNO V RDATE                      CNT
---------- ---------- ------------------------- ---------- - ------------------- ----------
         1          1              SF                    1 Y 2020-04-27 12:16:37          0
         2          1              드라마              1 Y 2020-04-27 12:16:37          0
         3          1              스릴러              1 Y 2020-04-27 12:16:37          0


-- 3) CROSS JOIN: 
-- 정보로서 가치가 없음
-- 부모테이블 레코드 3 * 자식테이블 레코드 3
SELECT categrp.categrpno, categrp.name, categrp.seqno,
            cate.cateno, cate.name, cate.seqno
FROM categrp, cate
ORDER BY categrp.categrpno, cate.cateno ASC;

-- 테이블 별명
SELECT r.categrpno, r.name, r.seqno,
            c.cateno, c.name, c.seqno
FROM categrp r, cate c
ORDER BY r.categrpno, c.cateno ASC;


-- 칼럼 별명
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r, cate c
ORDER BY r.categrpno, c.cateno ASC;

-- 4) Equal JOIN(INNER JOIN)
--- PK, FK 컬럼의 같은 레코드 join
--- WHERE c.categrpno = t.categrpno: 2개의 테이블에서 categrpno 컬럼이 일치하는
--  레코드만을 읽어 메모리상에서 하나의 레코드로 결합하여 메모리 테이블을
--  생성합니다. (DBMS는 많은 메모리 사용)
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r, cate c
WHERE r.categrpno = c.categrpno
ORDER BY r.categrpno, c.cateno ASC;

R_CATEGRPNO R_NAME                                                R_SEQNO   C_CATENO C_NAME                                                                                                  C_SEQNO
----------- -------------------------------------------------- ---------- ---------- ---------------------------------------------------------------------------------------------------- ----------
          1 영화                                                        1          1 SF                                                                                                            1
          1 영화                                                        1          2 드라마                                                                                                        1
          1 영화                                                        1          3 스릴러                                                                                                        1

-- INNER JOIN + WHERE문 조건 추가(AND)
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r, cate c
WHERE r.categrpno = c.categrpno AND c.name = 'SF'
ORDER BY r.categrpno, c.cateno ASC;

-- ANSI:
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r 
INNER JOIN cate c 
ON r.categrpno = c.categrpno
ORDER BY r.categrpno, c.cateno ASC;

R_CATEGRPNO R_NAME                                                R_SEQNO   C_CATENO C_NAME                                                                                                  C_SEQNO
----------- -------------------------------------------------- ---------- ---------- ---------------------------------------------------------------------------------------------------- ----------
          1 영화                                                        1          1 SF                                                                                                            1
          1 영화                                                        1          2 드라마                                                                                                        1
          1 영화                                                        1          3 스릴러                                                                                                        1

--ANSI + WHERE 사용 가능
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r 
INNER JOIN cate c 
ON r.categrpno = c.categrpno
WHERE c.name = 'SF'
ORDER BY r.categrpno, c.cateno ASC;

R_CATEGRPNO R_NAME                                                R_SEQNO   C_CATENO C_NAME                                                                                                  C_SEQNO
----------- -------------------------------------------------- ---------- ---------- ---------------------------------------------------------------------------------------------------- ----------
          1 영화                                                        1          1 SF                                                                                                            1

-- 5) LEFT Outer join
--- 부모 테이블의 PK중 자식 테이블에서 사용되지 않는 PK도 출력시 사용
--- 자식 테이블 방향에 선언한 '+'는 대응하는 레코드가 없으면 NULL 값으로 출력
--- 일치하지 않아도 PK 부모(왼쪽) 테이블 레코드 모두 출력됨.
-- 자식 쪽에 (+)를 붙임
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r, cate c
WHERE r.categrpno = c.categrpno(+)
ORDER BY r.categrpno, c.cateno ASC;

R_CATEGRPNO R_NAME                                                R_SEQNO   C_CATENO C_NAME                                                                                                  C_SEQNO
----------- -------------------------------------------------- ---------- ---------- ---------------------------------------------------------------------------------------------------- ----------
          1 영화                                                        1          1 SF                                                                                                            1
          1 영화                                                        1          2 드라마                                                                                                        1
          1 영화                                                        1          3 스릴러                                                                                                        1
          2 여행                                                        2                                                                                                                           
          3 캠핑                                                        3                                                                                                                           

-- ANSI
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r 
LEFT OUTER JOIN cate c
ON r.categrpno = c.categrpno
ORDER BY r.categrpno, c.cateno ASC;

R_CATEGRPNO R_NAME                                                R_SEQNO   C_CATENO C_NAME                                                                                                  C_SEQNO
----------- -------------------------------------------------- ---------- ---------- ---------------------------------------------------------------------------------------------------- ----------
          1 영화                                                        1          1 SF                                                                                                            1
          1 영화                                                        1          2 드라마                                                                                                        1
          1 영화                                                        1          3 스릴러                                                                                                        1
          2 여행                                                        2                                                                                                                           
          3 캠핑                                                        3                                                                                                                           

-- 6) RIGHT Outer join
--- 오른쪽 자식 테이블 기준 레코드 모두 출력
--- 일반적으로 INNER join과 동일한 결과
--- 부모 테이블의 PK가 FK로 선언되지 않은 자식 테이블 레코드 출력
--- INSERT시에 PK, FK 제약조건이 걸린경우 FK는 반드시 값이 있어야함으로 정보로서의 가치는 부족함.
--- 제약조건이 만들어지기 전에 추가된 자식 레코드의 발견(권장 하지 않음)
-- 이걸 사용해야 하는 상황이 발생하면 설계를 잘못했을 가능성이 크다
-- 제약조건을 만들지 않고 프로젝트를 진행한다 -> 권장하지 않음
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r, cate c
WHERE r.categrpno(+) = c.categrpno
ORDER BY r.categrpno, c.cateno ASC;

R_CATEGRPNO R_NAME                                                R_SEQNO   C_CATENO C_NAME                                                                                                  C_SEQNO
----------- -------------------------------------------------- ---------- ---------- ---------------------------------------------------------------------------------------------------- ----------
          1 영화                                                        1          1 SF                                                                                                            1
          1 영화                                                        1          2 드라마                                                                                                        1
          1 영화                                                        1          3 스릴러                                                                                                        1

-- ANSI
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r 
RIGHT OUTER JOIN cate c
ON r.categrpno = c.categrpno
ORDER BY r.categrpno, c.cateno ASC;

R_CATEGRPNO R_NAME                                                R_SEQNO   C_CATENO C_NAME                                                                                                  C_SEQNO
----------- -------------------------------------------------- ---------- ---------- ---------------------------------------------------------------------------------------------------- ----------
          1 영화                                                        1          1 SF                                                                                                            1
          1 영화                                                        1          2 드라마                                                                                                        1
          1 영화                                                        1          3 스릴러                                                                                                        1

-- 7) FULL OUTER JOIN 
--- left outer join, right outer join의 결합
--- 일반적으로 left outer join과 결과가 같음
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno as r_seqno,
            c.cateno as c_cateno, c.name as c_name, c.seqno as c_seqno
FROM categrp r 
FULL OUTER JOIN cate c
ON r.categrpno = c.categrpno
ORDER BY r.categrpno, c.cateno ASC;

R_CATEGRPNO R_NAME                                                R_SEQNO   C_CATENO C_NAME                                                                                                  C_SEQNO
----------- -------------------------------------------------- ---------- ---------- ---------------------------------------------------------------------------------------------------- ----------
          1 영화                                                        1          1 SF                                                                                                            1
          1 영화                                                        1          2 드라마                                                                                                        1
          1 영화                                                        1          3 스릴러                                                                                                        1
          2 여행                                                        2                                                                                                                           
          3 캠핑                                                        3                                                                                                                           






















--INNER JOIN과 EXISTS 비교 1:N 관계에서 공통 1만을 출력할 때 EXISTS의 성능이 더 좋다
SELECT DISTINCT S.categrpno, S.name, S.seqno, S.visible, S.rdate
FROM categrp S INNER JOIN cate P ON P.categrpno = S.categrpno;

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 영화                                                        1 Y 2020-05-12 04:02:33

SELECT *
FROM categrp S
WHERE EXISTS (SELECT 'x' FROM cate P WHERE P.categrpno = S.categrpno);

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 영화                                                        1 Y 2020-05-12 04:02:33





















