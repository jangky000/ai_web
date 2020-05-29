[02] SubQuery(필터링)
 --WHERE는 한번의 검색 결과만 가지고 있음
 -- 연속적인 조건에 의한 필터링이 필요한 레코드는
 -- Subquery를 사용하면 가능함.
1. WHERE문에 서브쿼리의 사용
 
-- 개발팀의 평균 급여
SELECT AVG(bonbong) as bonbong
FROM itpay
WHERE part='개발팀';

BONBONG
----------
3731666.67
 
 
-- 개발팀의 평균 급여보다 급여가 많은 직원 출력 
SELECT payno, part, sawon, bonbong
FROM itpay
WHERE bonbong >= (
                  SELECT AVG(bonbong)
                  FROM itpay
                  WHERE part='개발팀'
);

     PAYNO PART                 SAWON         BONBONG
     ---------- -------------------- ---------- ----------
         4 개발팀               라길동        4070000
         6 기획설계팀           바길동        3840000
         7 개발팀               사길동        4230000
         8 DB설계팀             김길동        4010000
        11 개발팀               최길동        4500000
        
 
-- 개발팀의 평균 급여보다 급여가 낮은 직원들의 급여를
-- 20% 추가 지급 
SELECT part, sawon, age, bonbong,
          bonbong * 0.2 as 추가금액, bonbong * 1.2 as 최종급여
FROM itpay
WHERE bonbong < (
                  SELECT AVG(bonbong)
                  FROM itpay
                  WHERE part='개발팀'
);
 
PART                 SAWON             AGE    BONBONG   추가금액   최종급여
-------------------- ---------- ---------- ---------- ---------- ----------
디자인팀             가길동             27    1530000     306000    1836000
디자인팀             나길동             30    1940000     388000    2328000
개발팀               다길동             34    2890000     578000    3468000
DB설계팀             마길동             38    2960000     592000    3552000
DB설계팀             이길동             42    3500000     700000    4200000
개발팀               신길동             33    3500000     700000    4200000
개발팀               마길동             29    3200000     640000    3840000
 
 
-- 개발팀의 평균 급여보다 급여가 많은 직원들의 급여를
-- 10% 삭감 출력 
SELECT part, sawon, age, bonbong,
          bonbong * 0.1 as 삭감금액, bonbong * 0.9 as 최종급여
FROM itpay
WHERE bonbong >= (
                  SELECT AVG(bonbong)
                  FROM itpay
                  WHERE part='개발팀'
);
 
PART                 SAWON             AGE    BONBONG    삭감금액    최종급여
-------------------- ---------- ---------- ---------- ---------- ----------
개발팀               라길동             36    4070000     407000    3663000
기획설계팀           바길동             40    3840000     384000    3456000
개발팀               사길동             42    4230000     423000    3807000
DB설계팀             김길동             42    4010000     401000    3609000
개발팀               최길동             31    4500000     450000    4050000
 
 
2. 조건의 중첩
 
-- 가길동의 부서 출력
   SELECT part
   FROM itpay
   WHERE sawon='가길동'

 PART                
--------------------
디자인팀

-- 가길동의 급여 출력
   SELECT bonbong
   FROM itpay
   WHERE sawon='가길동'
 
    BONBONG
----------
   1530000
 
-- 가길동과 같은 부서의 평균 급여 출력
   SELECT TRUNC(AVG(bonbong)) as bonbong
   FROM itpay
   WHERE part = (SELECT part
                 FROM itpay
                 WHERE sawon='가길동');
                 
    BONBONG
    ----------
    1735000
   
 
-- 가길동과 같은 부서에 근무하면서 그 부서의 
-- 평균급여 보다 급여가 많은 직원 출력
   SELECT payno, part, sawon, bonbong 
   FROM itpay
   WHERE 
         (
         part = (
                  SELECT part
                  FROM itpay
                  WHERE sawon='가길동'
                  )
         )     
         AND
         (
         bonbong > (
                     SELECT AVG(bonbong)
                     FROM itpay
                     WHERE part = (
                                          SELECT part
                                          FROM itpay
                                          WHERE sawon='가길동'
                                          )
                     )
         )
         
      PAYNO PART                 SAWON   BONBONG
    ---------- -------------------- ---------- ----------
         2 디자인팀             나길동        1940000
   
   
3. Subquery + ROWNUM 컬럼을 이용한 레코드 추출, select 시에 자동으로 일련번호가 추가됨.
 
SELECT payno, part, sawon, month, rownum
FROM itpay;
 
--      PAYNO PART                 SAWON      MONTH      ROWNUM
------------ -------------------- ---------- ------ ----------
--         1 디자인팀             가길동     200801          1
--         2 디자인팀             나길동     200801          2
--         3 개발팀               다길동     200801          3
 
-- rownum이 생성되고 난후 정렬됨으로 정보로서의 가치가 떨어짐
SELECT payno, part, sawon, rownum
FROM itpay
ORDER BY sawon;
 
--      PAYNO PART                 SAWON          ROWNUM
------------ -------------------- ---------- ----------
--         1 디자인팀             가길동              1
--         8 DB설계팀             김길동              8
--         2 디자인팀             나길동              2
 
-- sawon 명으로 먼저 정렬을 수행하고 rownum을 추가합니다.
SELECT payno, part, sawon, rownum as r
FROM (
       SELECT payno, part, sawon 
       FROM itpay
       ORDER BY sawon
);

--     PAYNO PART                 SAWON               R
------------ -------------------- ---------- ----------
--         1 디자인팀             가길동              1
--         8 DB설계팀             김길동              2
--         2 디자인팀             나길동              3     
     
-- rownum 컬럼 값에 따른 레코드 추출, ERROR, r 인식 안됨, where 사용 불가능
SELECT payno, part, sawon, rownum as r
FROM (
       SELECT payno, part, sawon
       FROM itpay
       ORDER BY sawon
)
WHERE r >= 1 AND r <= 3; 
 
-- ERROR, r 인식 안됨, where 사용 불가능
SELECT payno, part, sawon, rownum as r
FROM (
       SELECT payno, part, sawon
       FROM itpay
       ORDER BY sawon
)
WHERE r >= 4 AND r <= 6; 
 
 
-- rownum 컬럼 값에 따른 레코드 1~3 추출, 페이징 가능 유형
SELECT payno, part, sawon, r
FROM(
     SELECT payno, part, sawon, rownum as r
     FROM (
            SELECT payno, part, sawon
            FROM itpay
            ORDER BY sawon
    )
)
WHERE r >= 1 AND r <= 3;     

--     PAYNO PART                 SAWON               R
------------ -------------------- ---------- ----------
--         1 디자인팀             가길동              1
--         8 DB설계팀             김길동              2
--         2 디자인팀             나길동              3  
          
-- rownum 컬럼 값에 따른 레코드 4~6 추출
SELECT payno, part, sawon, r
FROM(
     SELECT payno, part, sawon, rownum as r
     FROM (
            SELECT payno, part, sawon
            FROM itpay
            ORDER BY sawon
    )
)
WHERE r >= 4 AND r <= 6;   
     
     
4. IN의 사용: Subquery의 결과가 2개 이상일 경우 사용
   - 급여가 300만원 넘는 사람과 같은 나이를 가지고
     있는 직원의 급여 내역을 출력하세요.
 
-- 급여가 300만원이 넘는 직원의 나이를 출력합니다.     
SELECT age 
FROM itpay
WHERE bonbong >= 3000000;

       AGE
----------
        36
        40
        42
        42
        42
        33
        31
        29
 
-- 중복된 값의 제거
SELECT DISTINCT age 
FROM itpay
WHERE bonbong >= 3000000;

       AGE
----------
        42
        29
        31
        40
        33
        36
 
-- 부서가 중복되어 출력
SELECT part
FROM itpay;
 
-- 중복된 부서의 제거 출력
SELECT DISTINCT part
FROM itpay;

PART                
--------------------
디자인팀
개발팀
DB설계팀
기획설계팀
 
SELECT payno, part, sawon, age, bonbong
FROM itpay
WHERE age IN(27, 30);

     PAYNO PART                 SAWON             AGE    BONBONG
---------- -------------------- ---------- ---------- ----------
         1 디자인팀             가길동             27    1530000
         2 디자인팀             나길동             30    1940000

 
SELECT payno, part, sawon, age, address
FROM itpay
WHERE address IN('인천시 계양구', '경기도 성남시');

     PAYNO PART                 SAWON             AGE ADDRESS                                           
---------- -------------------- ---------- ---------- --------------------------------------------------
         1 디자인팀             가길동             27 경기도 성남시                                     
         2 디자인팀             나길동             30 인천시 계양구                                     
         3 개발팀               다길동             34 경기도 성남시                                     
         7 개발팀               사길동             42 인천시 계양구                                     

 
-- 급여가 300만원이 넘는 직원의 나이와 일치하는 직원의 정보를 모두 출력합니다.
SELECT payno, part, sawon, age, bonbong
FROM itpay
WHERE age IN(
                    SELECT DISTINCT age 
                    FROM itpay
                    WHERE bonbong >= 3000000
                   )
ORDER BY age ASC;                   

     PAYNO PART                 SAWON             AGE    BONBONG
---------- -------------------- ---------- ---------- ----------
        12 개발팀               마길동             29    3200000
        11 개발팀               최길동             31    4500000
        10 개발팀               신길동             33    3500000
         4 개발팀               라길동             36     4070000
         6 기획설계팀           바길동            40    3840000
         7 개발팀               사길동             42     4230000
         9 DB설계팀             이길동            42    3500000
         8 DB설계팀             김길동            42    4010000
         
         
         
         
        