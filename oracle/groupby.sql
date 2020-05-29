1. AVG(), MAX(), MIN(), SUM()
SELECT * FROM itpay;
 
SELECT AVG(bonbong) as 평균, MAX(bonbong) as 최대값
          , MIN(bonbong) as 최소값, SUM(bonbong) as 합계
FROM itpay;
 
         평균        최대값        최소값         합계
---------- ---------- ---------- ----------
   3347500    4500000    1530000   40170000
 
-- 그룹화 함수는 일반 컬럼과 같이 사용할 수 없습니다.
-- 어떤 사원에 대한 평균과 합계인지 구분이 모호함!!!
SELECT sawon, AVG(bonbong), SUM(bonbong)
FROM itpay;
-- 사원: n개 결과 / 평균, 합: 1개 결과
 
2. 날짜 상에서의 MAX(), MIN()
 
SELECT MAX(gdate), MIN(gdate) FROM itpay;
 MAX(GDATE)          MIN(GDATE)         
------------------- -------------------
2020-05-29 10:13:18 2020-05-24 10:12:10
 
 -- 사전 순
SELECT MAX(sawon), MIN(sawon) FROM itpay;
 MAX(SAWON) MIN(SAWON)
---------- ----------
최길동     가길동    
 
3. COUNT(), NULL 컬럼은 카운트에 포함이 되지 않습니다.

SELECT COUNT(payno) FROM itpay;

 COUNT(PAYNO)
------------
          12
 
SELECT COUNT(bonus) FROM itpay;
 
 COUNT(BONUS)
------------
           9
 
SELECT COUNT(*) FROM itpay;
   COUNT(*)
----------
        12
 
-- NVL 함수를 이용하여 NULL 컬럼을 카운트 합니다.
-- null 값을 0으로 변경합니다.
SELECT COUNT(NVL(bonus, 0)) as bonus FROM itpay;
       BONUS
----------
        12
 
 SELECT * FROM itpay;
 
 -- 3번 직원 bonus 20만원 지급
 -- SET에 괄호 쓰면 안된다.
UPDATE  itpay SET bonus=200000 WHERE payno=3;
 -- 4번 직원 bonus 30만원 지급
UPDATE  itpay SET bonus=300000 WHERE payno=4;
 -- 5번 직원 bonus 40만원 지급
UPDATE  itpay SET bonus=400000 WHERE payno=5;

 -- 0 값을 null 값으로 변경
UPDATE itpay SET bonus = NULL WHERE bonus=0;
SELECT bonus FROM itpay;

SELECT MAX(bonus) FROM itpay; -- null이 있어도 최대값 구해짐
-- MAX(BONUS)
------------
--    400000
SELECT MIN(bonus) FROM itpay; -- null이 있어도 최소값 구해짐
--MIN(BONUS)
------------
--    200000

-- 모든 직원의 보너스를 100000원씩 인상, null 칼럼은 인상 안됨
UPDATE itpay SET bonus= bonus + 100000;

-- 모든 직원의 보너스를 100000원씩 인상, null 칼럼도 인상
SELECT NVL(bonus, 0) + 100000 FROM itpay;

-- 보너스를 받지 못한 직원만 100000원 지급
SELECT NVL(bonus, 0) + 100000 FROM itpay WHERE bonus IS NULL;


SELECT MAX(NVL(bonus, 0)) FROM itpay;
--MAX(NVL(BONUS,0))
-------------------
--           400000

SELECT MIN(NVL(bonus, 0)) FROM itpay; -- null을 0으로 바꾸는 상황이라 0이 출력됨
--MIN(NVL(BONUS,0))
-------------------
--                0

-- 모든 직원들의 보너스 평균금액은?
SELECT AVG(bonus) FROM itpay; -- null 값이 제외되어 평균값에 문제가 발생 
--AVG(BONUS)
------------
--    400000

-- 함수명을 칼럼명으로 쓰는 것을 권장하지 않음
SELECT AVG(NVL(bonus, 0)) as pay_avg FROM itpay;
--AVG(NVL(BONUS,0))
-------------------
--           100000



4. GROUP BY
-- 부서별 평균 급여를 출력하세요.
-- 어느부서의 평균 급여인지 모름으로 정보로써 가치가 없음.
SELECT AVG(bonbong) as bonbong
FROM itpay
GROUP BY part;   

   BONBONG
----------
   1735000
3731666.67
   3490000
   3840000
 
 
-- GROUP BY문에 명시된 컬럼은 SELECT문에 출력할 수 있습니다.
-- 100원 단위로 출력
SELECT part, ROUND(AVG(bonbong), -2) as bonbong
FROM itpay
GROUP BY part;   

--PART                    BONBONG
---------------------- ----------
--디자인팀                1735000
--개발팀                  3731700
--DB설계팀                3490000
--기획설계팀              3840000
 
SELECT * FROM itpay;
 
-- 부서별, 지역별 평균 급여를 출력하세요, 정렬이 안되 구분이 어려움.
-- 그룹의 그룹, 서브 그룹
SELECT part, address, TRUNC(AVG(bonbong), -1) as pay
FROM itpay
GROUP BY part, address;   
 
 
-- 부서별, 지역별 평균 급여를 구하여 부서별, 지역별로
-- 오름차순 출력하세요.
SELECT part, address, TRUNC(AVG(bonbong), -1) as bonbong
FROM itpay
GROUP BY part, address
ORDER BY part, address; 

PART                 ADDRESS                                               BONBONG
-------------------- -------------------------------------------------- ----------
DB설계팀             경기도 부천시                                         3485000
DB설계팀             서울시 강서구                                         3500000
개발팀               경기도 부천시                                         4070000
개발팀               경기도 성남시                                         2890000
개발팀               서울시 관악구                                         3733330
개발팀               인천시 계양구                                         4230000
기획설계팀           서울시 강서구                                         3840000
디자인팀             경기도 성남시                                         1530000
디자인팀             인천시 계양구                                         1940000
 
-- 동일한 부서에서 급여가 내림차순되도록 출력.
SELECT part, address, TRUNC(AVG(bonbong), -1) as bonbong
FROM itpay
GROUP BY part, address
ORDER BY part ASC, bonbong DESC; 

PART                 ADDRESS                                               BONBONG
-------------------- -------------------------------------------------- ----------
DB설계팀             서울시 강서구                                         3500000
DB설계팀             경기도 부천시                                         3485000
개발팀               인천시 계양구                                         4230000
개발팀               경기도 부천시                                         4070000
개발팀               서울시 관악구                                         3733330
개발팀               경기도 성남시                                         2890000
기획설계팀           서울시 강서구                                         3840000
디자인팀             인천시 계양구                                         1940000
디자인팀             경기도 성남시                                         1530000

 
 
6. GROUP BY문에 조건을 이용하기위한 HAVING절의 이용
 
-- 부서별 평균 급여가 300만원이 넘는 부서만 출력, 1의 자리 반올림
-- 그룹함수 조건에 WHERE 절을 사용할 수 없습니다.
SELECT part, TRUNC(AVG(bonbong), -2) as bonbong
FROM itpay
GROUP BY part
HAVING AVG(bonbong) >= 3000000
ORDER BY part; 

PART                    BONBONG
-------------------- ----------
DB설계팀                3490000
개발팀                  3731600
기획설계팀              3840000
 
-- ERROR, HAVING 절에 그룹화함수 미사용 
SELECT part, TRUNC(AVG(bonbong), -2) as avg_bonbong
FROM itpay
GROUP BY part
HAVING avg_bonbong >= 3000000
ORDER BY part; 

-- ERROR: SQL 오류: ORA-00979: not a GROUP BY expression
-- 그룹화 함수 미사용 + group by에서 사용하지 않는 칼럼 사용-> 에러 
SELECT part, TRUNC(AVG(bonbong), -2) as avg_bonbong
FROM itpay
GROUP BY part
HAVING address LIKE '서울%'
ORDER BY part; 
 
-- 그룹화 함수 미사용 시 -> 그룹by에 등장하는 칼럼을 사용해야 함
SELECT part, TRUNC(AVG(bonbong), -2) as avg_bonbong
FROM itpay
GROUP BY part
HAVING part = '개발팀'
ORDER BY part; 

PART                 AVG_BONBONG
-------------------- -----------
개발팀                   3731600 

-- 순서 주의
-- WHERE 절의 사용, 개발팀 제외, 300만원이 넘는 부서별 급여 산출
SELECT part, TRUNC(AVG(bonbong), -2) as bonbong
FROM itpay
WHERE part NOT LIKE '%개발팀%'
GROUP BY part
HAVING AVG(bonbong) >= 3000000
ORDER BY part; 

PART                    BONBONG
-------------------- ----------
DB설계팀                3490000
기획설계팀              3840000

7. 함수의 중첩
-- 부서중에 평균 급여가 가장 높은 부서의 금액을 천단위이상 출력하세요. 
SELECT TRUNC(MAX(AVG(bonbong)), -3) as bonbong
FROM itpay
GROUP BY part;

   BONBONG
   ----------
   3840000

-- ERROR: group by에서 사용한 칼럼을 사용하면 되어야하는데.. 
-- MAX()는 그룹화 함수
-- part는 여러 값이고, MAX() 결과 값은 1개의 단일 값이기 때문에
-- MAX는 단일값으로 처리되어 그룹화 할 수 없음
-- 따라서 부서 중에 평균 급여가 가장 높은 부서의 금액과 부서명을 출력할 수 없다.
-- -> 그래서 서브 쿼리를 사용한다.
SELECT part, TRUNC(MAX(AVG(bonbong)), -3) as bonbong
FROM itpay
GROUP BY part;