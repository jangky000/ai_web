- 테이블 구조
-- member 삭제전에 FK가 선언된 blog 테이블 먼저 삭제합니다.
DROP TABLE attachfile;
DROP TABLE contents;
DROP TABLE member;
-- 제약 조건과 함께 삭제(제약 조건이 있어도 삭제됨, 권장하지 않음.)
DROP TABLE member CASCADE CONSTRAINTS; 
 
CREATE TABLE member (
  memberno NUMBER(6) NOT NULL, -- 회원 번호, 레코드를 구분하는 컬럼 
  id              VARCHAR(20)   NOT NULL UNIQUE, -- 아이디, 중복 안됨, 레코드를 구분 
  passwd      VARCHAR(60)   NOT NULL, -- 패스워드, 영숫자 조합
  mname      VARCHAR(20)   NOT NULL, -- 성명, 한글 10자 저장 가능
  tel            VARCHAR(14)   NOT NULL, -- 전화번호
  zipcode     VARCHAR(5)        NULL, -- 우편번호, 12345
  address1    VARCHAR(80)       NULL, -- 주소 1
  address2    VARCHAR(50)       NULL, -- 주소 2
  mdate       DATE             NOT NULL, -- 가입일    
  PRIMARY KEY (memberno)                     -- 한번 등록된 값은 중복 안됨
);
 
COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.MEMBERNO is '회원 번호';
COMMENT ON COLUMN MEMBER.ID is '아이디';
COMMENT ON COLUMN MEMBER.PASSWD is '패스워드';
COMMENT ON COLUMN MEMBER.MNAME is '성명';
COMMENT ON COLUMN MEMBER.TEL is '전화번호';
COMMENT ON COLUMN MEMBER.ZIPCODE is '우편번호';
COMMENT ON COLUMN MEMBER.ADDRESS1 is '주소1';
COMMENT ON COLUMN MEMBER.ADDRESS2 is '주소2';
COMMENT ON COLUMN MEMBER.MDATE is '가입일';
 
 
DROP SEQUENCE member_seq;
CREATE SEQUENCE member_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
 
1. 등록
 
1) id 중복 확인
SELECT COUNT(id) as cnt
FROM member
WHERE id='user1';
 
 cnt
 ---
   0   ← 중복 되지 않음.
   
2) 등록
- 일련번호 산출 서브쿼리
- MAX(memberno): memberno 컬럼의 값중에 가장 큰 값을 산출
- 레코드가 없으면 MAX 함수의 결과는 NULL이됩니다.
SELECT MAX(memberno) as memberno FROM member;
MEMBERNO
 ------
 NULL
 
 - NULL 값은 사칙연산의 결과도 NULL이됩니다. 의미 없음.
SELECT MAX(memberno)+1 as memberno FROM member;
MEMBERNO
 ------
 NULL
 
 - NVL(값, 변환할 값): 값이 NULL이면 변환할 값으로 변경, 
   NULL을 0으로 변경
SELECT NVL(MAX(memberno), 0) as memberno FROM member;
MEMBERNO
 ------
   0
   
- NULL을 처리하면서 새로운 최대값 산출 SQL
SELECT NVL(MAX(memberno), 0)+1 as memberno FROM member;
MEMBERNO
 ------
   1
 
-- 회원 관리용 계정, Q&A용 계정
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES (member_seq.nextval, 'qnaadmin', '1234', 'QNA관리자', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate);

-- 고객 관리형 CRM 계정
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES (member_seq.nextval,'crm', '1234', '고객관리자', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate);
 
-- 개인 회원 테스트 계정
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES (member_seq.nextval, 'user1', '1234', '왕눈이', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate);
 
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES (member_seq.nextval, 'user2', '1234', '아로미', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate);
 
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES (member_seq.nextval, 'user3', '1234', '투투투', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate);
 
-- 그룹별 공유 회원 기준 (계정 하나를 공유)
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES (member_seq.nextval, 'team1', '1234', '개발팀', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate);
 
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES (member_seq.nextval, 'team2', '1234', '웹퍼블리셔팀', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate);
 
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate)
VALUES (member_seq.nextval,'team3', '1234', '디자인팀', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate);
 
 
2. 목록
- 검색을 하지 않는 경우, 전체 목록 출력
 
SELECT memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate
FROM member
ORDER BY memberno ASC;
 
   MEMBERNO ID                   PASSWD                                                       MNAME                TEL            ZIPCO ADDRESS1                                                                         ADDRESS2                                           MDATE              
---------- -------------------- ------------------------------------------------------------ -------------------- -------------- ----- -------------------------------------------------------------------------------- -------------------------------------------------- -------------------
         1 qnaadmin             1234                                                         QNA관리자            000-0000-0000  12345 서울시 종로구                                                                    관철동                                             2020-05-15 05:26:22
         2 crm                  1234                                                         고객관리자           000-0000-0000  12345 서울시 종로구                                                                    관철동                                             2020-05-15 05:26:22
         3 user1                1234                                                         왕눈이               000-0000-0000  12345 서울시 종로구                                                                    관철동                                             2020-05-15 05:26:22
         4 user2                1234                                                         아로미               000-0000-0000  12345 서울시 종로구                                                                    관철동                                             2020-05-15 05:26:22
         5 user3                1234                                                         투투투               000-0000-0000  12345 서울시 종로구                                                                    관철동                                             2020-05-15 05:26:22
         6 team1                1234                                                         개발팀               000-0000-0000  12345 서울시 종로구                                                                    관철동                                             2020-05-15 05:26:22
         7 team2                1234                                                         웹퍼블리셔팀         000-0000-0000  12345 서울시 종로구                                                                    관철동                                             2020-05-15 05:26:22
         8 team3                1234                                                         디자인팀             000-0000-0000  12345 서울시 종로구
 
 
   
3. 조회
 
1) user1 사원 정보 보기
SELECT memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate
FROM member
WHERE memberno = 1;
 
 MEMBERNO ID       PASSWD MNAME  TEL           ZIPCODE ADDRESS1 ADDRESS2 MDATE
 --- -------- ------ ------ ------------- ------- -------- -------- ---------------------
   1 qnaadmin 1234   QNA관리자 000-0000-0000 12345   서울시 종로구  관철동      2019-05-24 14:51:43.0
 
SELECT memberno, id, passwd, mname, tel, zipcode, address1, address2, mdate
FROM member
WHERE id = 'user1';
 
 MEMBERNO ID    PASSWD MNAME TEL           ZIPCODE ADDRESS1 ADDRESS2 MDATE
 --- ----- ------ ----- ------------- ------- -------- -------- ---------------------
   3 user1 1234   왕눈이   000-0000-0000 12345   서울시 종로구  관철동      2019-05-24 14:51:48.0
 
 
   
4. 수정
UPDATE member 
SET mname='아로미', tel='111-1111-1111', zipcode='00000',
      address1='경기도', address2='파주시'
WHERE memberno=1;
 
 
5. 패스워드 변경
1) 패스워드 검사
SELECT COUNT(memberno) as cnt
FROM member
WHERE memberno=1 AND passwd='1234';
 
2) 패스워드 수정
UPDATE member
SET passwd='0000'
WHERE memberno=1;
 
 
6. 삭제
1) 모두 삭제
DELETE FROM member;
 
2) 특정 회원 삭제
DELETE FROM member
WHERE memberno=4;
 
 
7. 로그인
SELECT COUNT(memberno) as cnt
FROM member
WHERE id='user1' AND passwd='1234';
 cnt
 ---
   0
   
 