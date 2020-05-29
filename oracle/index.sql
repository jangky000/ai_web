[03] INDEX 생성
     - index 사용을 통하여 오라클의 검색 속도를 향상시킬 수 있습니다.
       도서의 목차를 미리 만들어 두는 것과 같은 원리입니다.

     - WHERE조건에 나오는 컬럼을 대상으로 합니다.
       PK컬럼은 자동으로 인덱스가 생성됩니다.
       다른 컬럼은 필요시 수동으로 생성합니다.

     - 하나의 index는 테이블 용량의 5%~20%까지도 점유할 수 있음으로
       과도한 인덱스 생성을 피해야합니다.
       index가 많아지면 index 갱신 문제로 인하여 Transaction(INSERT, UPDATE, DELETE) 시간이 길어집니다.

     - 생성된 index는 SQL실행시에 오라클서버로부터 자동으로
       사용됩니다.

     - index를 이용한 검색 레코드수가 5%인 경우 사용을 권장합니다.

     - PK 컬럼은 자동으로 index가 생성됨.

       
▷ /ai3/oracle/index.sql
-------------------------------------------------------------------------------------     
1) 기존 레코드 삭제
DELETE FROM itpay;
 
2) sample용 레코드 추가
INSERT INTO itpay(payno, part, sawon, age, address,month, gdate, bonbong, tax, bonus)
VALUES(1, '디자인팀', '가길동', 27, '경기도 성남시', '200801', sysdate, 1530000, 12345.67, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address,month, gdate, bonbong, tax, bonus)
VALUES(2, '디자인팀', '나길동', 30, '인천시 계양구','200801', sysdate-5, 1940000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(3, '개발팀', '다길동', 34, '경기도 성남시', '200801', sysdate-3, 2890000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(4, '개발팀', '라길동', 36, '경기도 부천시','200802', sysdate-1, 4070000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(5, 'DB설계팀', '마길동', 38, '경기도 부천시', '200802', sysdate-0, 2960000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(6, '기획설계팀', '바길동', 40, '서울시 강서구', '200802', sysdate-0, 3840000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(7, '개발팀', '사길동', 42, '인천시 계양구', '200803', sysdate-0, 4230000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(8, 'DB설계팀', '김길동', 42, '경기도 부천시', '200803', sysdate-1, 4010000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(9, 'DB설계팀', '이길동', 42, '서울시 강서구', '200803', sysdate-1, 3500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus) 
VALUES(10, '개발팀', '신길동', 33, '서울시 관악구', '200804', sysdate, 3500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(11, '개발팀', '최길동', 31, '서울시 관악구', '200804', sysdate, 4500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(12, '개발팀', '마길동', 29, '서울시 관악구', '200804', sysdate, 3200000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(13, '디자인팀', '가길동', 27, '경기도 성남시', '200801', sysdate, 1530000, 12345.67, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(14, '디자인팀', '나길동', 30, '인천시 계양구', '200801', sysdate-5, 1940000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(15, '개발팀', '다길동', 34, '경기도 성남시', '200801', sysdate-3, 2890000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(16, '개발팀', '라길동', 36, '경기도 부천시', '200802', sysdate-1, 4070000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(17, 'DB설계팀', '마길동', 38, '경기도 부천시', '200802', sysdate-0, 2960000, 0, 0);
  
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(18, '기획설계팀', '바길동', 40, '서울시 강서구', '200802', sysdate-0, 3840000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(19, '개발팀', '사길동', 42, '인천시 계양구', '200803', sysdate-0, 4230000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(20, 'DB설계팀', '김길동', 42, '경기도 부천시', '200803', sysdate-1, 4010000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(21, 'DB설계팀', '이길동', 42, '서울시 강서구', '200803', sysdate-1, 3500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(22, '개발팀', '신길동', 33, '서울시 관악구', '200804', sysdate, 3500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(23, '개발팀', '최길동', 31, '서울시 관악구', '200804', sysdate, 4500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(24, '개발팀', '마길동', 29, '서울시 관악구', '200804', sysdate, 3200000, 0, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(25, '개발팀', '가길순', 23, '경기도 고양시', '200804', sysdate, 3200000, 0, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(26, '개발팀', '나길순', 24, '경기도 파주시', '200804', sysdate, 3200000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(27, '개발팀', '다길순', 25, '경기도 안양시', '200804', sysdate, 2500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(28, '개발팀', '라길순', 26, '서울시 종로구', '200804', sysdate, 2300000, 0, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(29, '개발팀', '마길순', 27, '서울시 종로구', '200804', sysdate, 2200000, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(30, '개발팀', '바길순', 28, '서울시 종로구', '200804', sysdate, 2200000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address,month, gdate, bonbong, tax, bonus)
VALUES(31, '디자인팀', '가길동', 27, '경기도 성남시', '200801', sysdate, 1530000, 12345.67, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address,month, gdate, bonbong, tax, bonus)
VALUES(32, '디자인팀', '나길동', 30, '인천시 계양구','200801', sysdate-5, 1940000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(33, '개발팀', '다길동', 34, '경기도 성남시', '200801', sysdate-3, 2890000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(34, '개발팀', '라길동', 36, '경기도 부천시','200802', sysdate-1, 4070000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(35, 'DB설계팀', '마길동', 38, '경기도 부천시', '200802', sysdate-0, 2960000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(36, '기획설계팀', '바길동', 40, '서울시 강서구', '200802', sysdate-0, 3840000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(37, '개발팀', '사길동', 42, '인천시 계양구', '200803', sysdate-0, 4230000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(38, 'DB설계팀', '김길동', 42, '경기도 부천시', '200803', sysdate-1, 4010000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(39, 'DB설계팀', '이길동', 42, '서울시 강서구', '200803', sysdate-1, 3500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(40, '개발팀', '신길동', 33, '서울시 관악구', '200804', sysdate, 3500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(41, '개발팀', '최길동', 31, '서울시 관악구', '200804', sysdate, 4500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(42, '개발팀', '마길동', 29, '서울시 관악구', '200804', sysdate, 3200000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(43, '디자인팀', '가길동', 27, '경기도 성남시', '200801', sysdate, 1530000, 12345.67, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(44, '디자인팀', '나길동', 30, '인천시 계양구', '200801', sysdate-5, 1940000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(45, '개발팀', '다길동', 34, '경기도 성남시', '200801', sysdate-3, 2890000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(46, '개발팀', '라길동', 36, '경기도 부천시', '200802', sysdate-1, 4070000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(47, 'DB설계팀', '마길동', 38, '경기도 부천시', '200802', sysdate-0, 2960000, 0, 0);
  
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(48, '기획설계팀', '바길동', 40, '서울시 강서구', '200802', sysdate-0, 3840000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(49, '개발팀', '사길동', 42, '인천시 계양구', '200803', sysdate-0, 4230000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(50, 'DB설계팀', '김길동', 42, '경기도 부천시', '200803', sysdate-1, 4010000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(51, 'DB설계팀', '이길동', 42, '서울시 강서구', '200803', sysdate-1, 3500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(52, '개발팀', '신길동', 33, '서울시 관악구', '200804', sysdate, 3500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(53, '개발팀', '최길동', 31, '서울시 관악구', '200804', sysdate, 4500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(54, '개발팀', '마길동', 29, '서울시 관악구', '200804', sysdate, 3200000, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(55, '개발팀', '가길순', 23, '경기도 고양시', '200804', sysdate, 3200000, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(56, '개발팀', '나길순', 24, '경기도 파주시', '200804', sysdate, 3200000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(57, '개발팀', '다길순', 25, '경기도 안양시', '200804', sysdate, 2500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(58, '개발팀', '라길순', 26, '서울시 종로구', '200804', sysdate, 2300000, 0, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(59, '개발팀', '마길순', 27, '서울시 종로구', '200804', sysdate, 2200000, 0, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(60, '개발팀', '바길순', 28, '서울시 종로구', '200804', sysdate, 2200000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(61, 'DB설계팀', '이길동', 42, '서울시 강서구', '200803', sysdate-1, 3500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(62, '개발팀', '신길동', 33, '서울시 관악구', '200804', sysdate, 3500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(63, '개발팀', '최길동', 31, '서울시 관악구', '200804', sysdate, 4500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(64, '개발팀', '마길동', 29, '서울시 관악구', '200804', sysdate, 3200000, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(65, '개발팀', '가길순', 23, '경기도 고양시', '200804', sysdate, 3200000, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(66, '개발팀', '나길순', 24, '경기도 파주시', '200804', sysdate, 3200000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(67, '개발팀', '다길순', 25, '경기도 안양시', '200804', sysdate, 2500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(68, '개발팀', '라길순', 26, '서울시 종로구', '200804', sysdate, 2300000, 0, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(69, '개발팀', '마길순', 27, '서울시 구로구', '200804', sysdate, 2200000, 0, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(70, '개발팀', '바길순', 28, '서울시 용산구', '200804', sysdate, 2200000, 0, 0);
 
 INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(71, 'DB설계팀', '이길동', 42, '서울시 강서구', '200803', sysdate-1, 3500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(72, '개발팀', '신길동', 33, '서울시 관악구', '200804', sysdate, 3500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(73, '개발팀', '최길동', 31, '서울시 관악구', '200804', sysdate, 4500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(74, '개발팀', '마길동', 29, '서울시 관악구', '200804', sysdate, 3200000, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(75, '개발팀', '가길순', 23, '경기도 구리시', '200804', sysdate, 3200000, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(76, '개발팀', '나길순', 24, '경기도 시흥시', '200804', sysdate, 3200000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(77, '개발팀', '다길순', 25, '경기도 양주시', '200804', sysdate, 2500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(78, '개발팀', '라길순', 26, '경기도 의왕시', '200804', sysdate, 2300000, 0, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(79, '개발팀', '마길순', 27, '경기도 구리시', '200804', sysdate, 2200000, 0, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(80, '개발팀', '바길순', 28, '서울시 용산구', '200804', sysdate, 2200000, 0, 0);
 
 
SELECT COUNT(*) FROM itpay;
        
3) index가 없는 address 컬럼의 검색, 0.121 초
SELECT * FROM itpay WHERE address = '서울시 종로구';
  
4) index 생성: 테이블명_컬럼명_idx
CREATE INDEX itpay_address_idx ON itpay(address);
 
5) index 사용, 별다른 선언 필요 없음, 0.067 초
SELECT * FROM itpay WHERE address = '서울시 종로구'; 
 
6) index 삭제
DROP INDEX itpay_address_idx;
 
7) 영어로된 이름을 대문자로 변경하여 함수기반 인덱스를 생성한 경우
-- 함수에다 인덱스를 걸 수 있다. 
CREATE INDEX emp_sawon_idx
ON itpay(UPPER(sawon));
 
    