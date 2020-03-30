DROP TABLE test;

CREATE TABLE test(
    testno    NUMBER(5)   NOT NULL, -- -99999 ~ +99999 자릿수
    mname  VARCHAR(20) NOT NULL, -- 한글 10자 
    funct     VARCHAR(50) NOT NULL, -- 주요 기술 분야  
    PRIMARY KEY (testno)         -- 중복 안됨, 고유한 값만 가능  
); 


INSERT INTO test(testno, mname, funct) 
VALUES(1, '왕눈이', 'JAVA/JSP/Spring'); 

INSERT INTO test(testno, mname, funct) 
VALUES(2, '아로미', 'JAVA/JSP/Spring/JQuery'); 

INSERT INTO test(testno, mname, funct) 
VALUES(3, '투투', 'JAVA/JSP/Spring/JQuery/HTML5'); 

SELECT testno, mname, funct FROM test ORDER BY testno ASC; 

-- TESTNO MNAME FUNCT
-- ------ ----- ----------------------------
--      1 왕눈이   JAVA/JSP/Spring
--      2 아로미   JAVA/JSP/Spring/JQuery
--      3 투투    JAVA/JSP/Spring/JQuery/HTML5

-- VARCHAR 타입의 저장 가능 글자수 확인      
INSERT INTO test(testno, mname, funct) 
VALUES(4, '오늘은 금요일 FRIDAY12!!', 'JAVA/JSP/Spring/JQuery/HTML5');
-- '오늘은 금요일 비옵니다'가 너무 길어서 에러 발생 13자 밖에 안되지만 오라클에서 한글 1자가 3바이트, MySQL은 모든 문자열에 x2하면 됨 
--ORA-12899: value too large for column "AI4"."TEST"."MNAME" (actual: 33, maximum: 20)

DELETE FROM test WHERE testno=4;


--Oracle: 한글 1자는 3바이트, 특수 문자는 1바이트 사용
--MySQL: varchar(10)이면 모든 문자를 10자 저장 가능 