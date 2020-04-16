-- 시퀀스 생성
CREATE SEQUENCE memo_seq
    START WITH 1            -- 시작 번호
    INCREMENT BY 1        -- 증가 단위
    MAXVALUE 9999999    -- 최대값ㅣ 9999999 -- NUMBER(7)이 선언 되어 있어야 함
    CACHE 2                     -- 2번은 메모리에서 계산, 2번 간 업데이트를 하지 않음 -> 속도 향상
    NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
    

-- 시퀀스 삭제
DROP SEQUENCE memo_seq;

-- sequence 사용
-- dual: sql 구조를 지원하기 위한 시스템 테이블
-- 오라클은 from이 꼭 있어야 함, mysql은 from이 없는 경우도 있음?
SELECT memo_seq.nextval FROM dual;

-- 현재까지 증가된 값 확인
SELECT memo_seq.currval FROM dual;


DROP TABLE memo;
-- 테이블에서의 sequence 사용
CREATE TABLE memo(
    memono NUMBER(7) NOT NULL,
    title VARCHAR(100) NOT NULL,
    PRIMARY KEY(memono)
);

INSERT INTO memo(memono, title)
VALUES(memo_seq.nextval, '공지사항 개발');

INSERT INTO memo(memono, title)
VALUES(memo_seq.nextval, '공지사항 테스트');

INSERT INTO memo(memono, title)
VALUES(memo_seq.nextval, '공지사항 배포');

SELECT memono, title FROM memo ORDER BY memono ASC;
    MEMONO TITLE                                                                                               
---------- ----------------------------------------------------------------------------------------------------
         2 공지사항 개발                                                                                       
         3 공지사항 테스트                                                                                     
         4 공지사항 배포  

-- 마지막에 등록된 레코드의 삭제
DELETE FROM memo WHERE memono = 4;

-- 한번 삭제된 번호는 다시 생성되지 않음
INSERT INTO memo(memono, title)
VALUES(memo_seq.nextval, '공지사항 교육');

SELECT memono, title FROM memo ORDER BY memono ASC;
    MEMONO TITLE                                                                                               
---------- ----------------------------------------------------------------------------------------------------
         2 공지사항 개발                                                                                       
         3 공지사항 테스트                                                                                     
         4 공지사항 배포   