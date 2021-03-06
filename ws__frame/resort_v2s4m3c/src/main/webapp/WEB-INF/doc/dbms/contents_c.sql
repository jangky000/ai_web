/**********************************/
/* Table Name: 컨텐츠 */
/**********************************/
DROP TABLE attachfile;
DROP TABLE contents CASCADE CONSTRAINTS;
CREATE TABLE contents(
		contentsno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)	 NOT NULL ,
		cateno                        		NUMBER(10)		 NOT NULL ,
		title                         		VARCHAR2(300)		 NOT NULL,
		content                       		CLOB         		 NOT NULL,
		recom                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		cnt                           		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		replycnt                      		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		web                           		VARCHAR2(500)		 NULL ,
		map                           		VARCHAR2(1000)		 NULL ,
		youtube                       		VARCHAR2(1000)		 NULL ,
		mp3                           		VARCHAR2(1000)		 NULL ,
		mp4                           		VARCHAR2(1000)		 NULL ,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		ip                            	     	VARCHAR2(15)		 NOT NULL,
		passwd                        		VARCHAR2(15)		 NOT NULL,
		grpno                         		NUMBER(8)		 DEFAULT 0		 NOT NULL,
		indent                        		NUMBER(2)		 DEFAULT 0		 NOT NULL,
		ansnum                        		NUMBER(3)		 DEFAULT 0		 NOT NULL,
		word                          		VARCHAR2(300)		 NULL ,
        rdate                                 DATE               NOT NULL,
        file1                                   VARCHAR(100)          NULL,
        thumb1                              VARCHAR(100)          NULL,
        size1                                   NUMBER(10)      DEFAULT 0 NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (cateno) REFERENCES cate (cateno)
);

COMMENT ON TABLE contents is '컨텐츠';
COMMENT ON COLUMN contents.contentsno is '컨텐츠 번호';
COMMENT ON COLUMN contents.memberno is '회원 번호';
COMMENT ON COLUMN contents.cateno is '카테고리 번호';
COMMENT ON COLUMN contents.title is '제목';
COMMENT ON COLUMN contents.content is '내용';
COMMENT ON COLUMN contents.recom is '추천수';
COMMENT ON COLUMN contents.cnt is '조회수';
COMMENT ON COLUMN contents.replycnt is '댓글수';
COMMENT ON COLUMN contents.web is '인터넷 주소';
COMMENT ON COLUMN contents.map is '지도';
COMMENT ON COLUMN contents.youtube is 'Youtube';
COMMENT ON COLUMN contents.mp3 is 'MP3';
COMMENT ON COLUMN contents.mp4 is 'MP4';
COMMENT ON COLUMN contents.visible is '출력 모드';
COMMENT ON COLUMN contents.ip is 'IP';
COMMENT ON COLUMN contents.passwd is '패스워드';
COMMENT ON COLUMN contents.grpno is '그룹번호';
COMMENT ON COLUMN contents.indent is '들여쓰기/답변차수';
COMMENT ON COLUMN contents.ansnum is '답변순서';
COMMENT ON COLUMN contents.word is '검색어';
COMMENT ON COLUMN contents.rdate is '등록일';
COMMENT ON COLUMN contents.file1 is '메인 이미지';
COMMENT ON COLUMN contents.thumb1 is '메인이미지 Preview';
COMMENT ON COLUMN contents.size1 is '메인이미지 크기';


DROP SEQUENCE contents_seq;
CREATE SEQUENCE contents_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
1) 글 등록
--INSERT INTO contents(contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate,
--                              file1, thumb1, size1)
--VALUES(contents_seq.nextval, 1, 1, '신규확진 2명', '전원 입국검역서 확인', 'http://www.daum.net',
--            '127.0.0.1', '123', '코로나', sysdate, 'spring.jpg', 'spring_t.jpg', 23657);
--
--INSERT INTO contents(contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate,
--                              file1, thumb1, size1)
--VALUES(contents_seq.nextval, 1, 1, '신규확진 2명', '전원 입국검역서 확인', 'http://www.daum.net',
--            '127.0.0.1', '123', '코로나', sysdate, 'summer.jpg', 'summer_t.jpg', 23657);
--            
--INSERT INTO contents(contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate,
--                              file1, thumb1, size1)
--VALUES(contents_seq.nextval, 1, 1, '신규확진 2명', '전원 입국검역서 확인', 'http://www.daum.net',
--            '127.0.0.1', '123', '코로나', sysdate, 'winter.jpg', 'winter_t.jpg', 23657);

SELECT contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate, file1, thumb1, size1
FROM contents 
ORDER BY contentsno DESC;    

COMMIT;

-- 현재 시퀀스의 확인
SELECT contents_seq.nextval FROM dual;
   NEXTVAL
----------
        47
SELECT contents_seq.currval FROM dual; -- 앞에 nextval을 한 후에만 확인 가능
   CURRVAL
----------
        47

2) 전체목록
SELECT contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate, file1, thumb1, size1 
FROM contents 
ORDER BY contentsno DESC;

2-1) cateno별 목록
SELECT contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate, file1, thumb1, size1 
FROM contents 
WHERE cateno = 1
ORDER BY contentsno DESC;

2-2) ① cateno별 검색 목록
SELECT contentsno, memberno, cateno, title, content, 
           recom, cnt, replycnt, rdate, word, file1, thumb1, size1
FROM contents
WHERE cateno=23 AND word LIKE '%스위스%'
ORDER BY contentsno DESC;

SELECT contentsno, memberno, cateno, title, content, 
           recom, cnt, replycnt, rdate, word, file1, thumb1, size1
FROM contents
WHERE cateno=2 AND word LIKE '%스의스%'
ORDER BY contentsno DESC;

SELECT contentsno, memberno, cateno, title, content, 
           recom, cnt, replycnt, rdate, word, file1, thumb1, size1
FROM contents
WHERE cateno=2 AND word LIKE '%수의스%'
ORDER BY contentsno DESC;

-- title, content, word 칼럼 검색
SELECT contentsno, memberno, cateno, title, content, 
           recom, cnt, replycnt, rdate, word, file1, thumb1, size1
FROM contents
WHERE cateno=23 AND (title LIKE '%유럽%' OR content LIKE '%유럽%' OR word LIKE '%유럽%')
ORDER BY contentsno DESC;

② 검색 레코드 갯수
-- 전체 레코드 갯수
SELECT COUNT(*) as cnt
FROM contents
WHERE cateno=23;

-- 검색 레코드 갯수
SELECT COUNT(*) as cnt
FROM contents
WHERE cateno=23 AND word LIKE '%스위스%';

SELECT COUNT(*) as cnt
FROM contents
WHERE cateno=23 AND (title LIKE '%유럽%' OR content LIKE '%유럽%' OR word LIKE '%유럽%');






3) 1건 조회
SELECT contentsno, memberno, cateno, title, content, recom, web, map, youtube, ip, passwd, word, rdate, file1, thumb1, size1 
FROM contents
WHERE contentsno = 1;

4) 수정
UPDATE contents 
SET title='제목', content='내용', web='http://', word='검색어'
WHERE contentsno = 5;

COMMIT;

5) 패스워드 검사
SELECT COUNT(*) as passwd_cnt
FROM contents
WHERE contentsno=5 AND passwd='1234';

SELECT contentsno, passwd
FROM contents 
ORDER BY contentsno DESC;    

6) 삭제
-- 전체 레코드 삭제
DELETE FROM contents;
COMMIT;  

DELETE FROM contents
WHERE contentsno=1;

COMMIT;  


7) 모든 레코드 갯수
SELECT COUNT(*) as cnt
FROM contents;
 
 COUNT
 -----
     5
     
8) 특정 회원이 작성한 글만 출력: cate + contents + member
SELECT c.cateno as c_cateno, c.name as c_name, c.rdate as c_rdate,
          t.contentsno as t_contentsno, t.title as t_title, t.web as t_web, t.ip as t_ip, t.rdate as t_rdate,
          m.memberno as m_memberno, m.mname as m_mname          
FROM cate c, contents t, member m
WHERE c.cateno = t.cateno AND t.memberno = m.memberno AND m.memberno = 1
ORDER BY c.cateno ASC, t.contentsno DESC;

-- ANSI
SELECT c.cateno as c_cateno, c.name as c_name, c.rdate as c_rdate,
          t.contentsno as t_contentsno, t.title as t_title, t.web as t_web, t.ip as t_ip, t.rdate as t_rdate,
          m.memberno as m_memberno, m.mname as m_mname          
FROM cate c
INNER JOIN contents t
ON c.cateno = c.cateno
INNER JOIN member m
ON t.memberno = m.memberno
WHERE m.memberno = 1
ORDER BY c.cateno ASC, t.contentsno DESC;

-- 특정 회원의 글 출력을 위한 cate, contents join
SELECT c.cateno as c_cateno, c.name as c_name, c.rdate as c_rdate,
          t.contentsno as t_contentsno, t.title as t_title, t.web as t_web, t.ip as t_ip, t.rdate as t_rdate        
FROM cate c, contents t, member m
WHERE c.cateno = t.cateno AND t.memberno = m.memberno AND m.memberno = 1
ORDER BY c.cateno ASC, t.contentsno DESC;

9) map
-- map                           		VARCHAR2(1000)		 NULL ,
UPDATE contents
SET map='고창 보리밭 축제'
WHERE contentsno=1 AND passwd='1234'; 
  
SELECT contentsno, memberno, cateno, web, map
FROM contents 
ORDER BY contentsno ASC;    
  
  
  
select * from sql1;
        N1 V1 
---------- ---
         1 A  
         2    
         3 B  
insert into sql1(n1, v1) values(5, "C");
오류 발생 명령행: 176 열: 36
오류 보고 -
SQL 오류: ORA-00984: column not allowed here
00984. 00000 -  "column not allowed here"
*Cause:    
*Action:
insert into sql1(n1, v1) values(5, 'C');





10) Youtube

-- youtube                                   VARCHAR2(1000)         NULL ,
UPDATE contents
SET youtube='youtube URL'
WHERE contentsno=21; 
  
commit;
  
SELECT contentsno, memberno, cateno, web, map, youtube
FROM contents 
ORDER BY contentsno ASC;    


11) mp3

UPDATE contents
SET mp3='mp3 file name'
WHERE contentsno=1 AND passwd='123'; 
  
SELECT contentsno, memberno, cateno, web, map, youtube, mp3
FROM contents 
ORDER BY contentsno ASC;

-- 검색 + 페이징
-- step 1
SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, file1, thumb1, size1
FROM contents
WHERE cateno=25 AND word LIKE '%스위스%'
ORDER BY contentsno DESC;

-- step 2
SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, rownum as r
FROM (
          SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, file1, thumb1, size1
          FROM contents
          WHERE cateno=25 AND word LIKE '%스위스%'
          ORDER BY contentsno DESC
);

-- step 3, 1 page
SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, r
FROM (
           SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, rownum as r
           FROM (
                     SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, file1, thumb1, size1
                     FROM contents
                     WHERE cateno=25 AND word LIKE '%스위스%'
                     ORDER BY contentsno DESC
           )          
)
WHERE r >= 1 AND r <= 10;

-- step 3, 2 page
SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, r, file1, thumb1, size1, ip
FROM (
           SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, rownum as r, file1, thumb1, size1, ip
           FROM (
                     SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, file1, thumb1, size1, ip
                     FROM contents
                     WHERE cateno=25 AND word LIKE '%스위스%'
                     ORDER BY contentsno DESC
           )          
)
WHERE r >= 11 AND r <= 20;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
게시글 답변관련 시작
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

[답변 쓰기]
-- 1번글 기준 답변 등록 예: grpno: 1, indent: 1, ansnum: 1
SELECT * FROM member;
SELECT * FROM categrp;
SELECT * FROM cateno;
 
1) 등록 변경(답변형 게시판에만 사용할 것 -> 서브쿼리의 사용으로 부하가 발생할 수 있다. )
-- grpno: 새롭게 글을 등록하면, 하나의 신규 그룹이 생성됨.(categrpno랑 관계 없음)
-- indent: 들여쓰기, n차 답변에 대한 효과
-- ansnum: 답변 순서 
INSERT INTO contents(contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate,
                              file1, thumb1, size1, grpno, indent, ansnum)
VALUES(contents_seq.nextval, 1, 1, '신규확진 2명', '전원 입국검역서 확인', 'http://www.daum.net',
            '127.0.0.1', '123', '코로나', sysdate, 'spring.jpg', 'spring_t.jpg', 23657,
            (SELECT NVL(MAX(grpno), 0)+1 FROM contents), 0, 0);

2) 1건 조회 변경
SELECT contentsno, memberno, cateno, title, content, recom, web, map, youtube, ip, passwd, 
            word, rdate, file1, thumb1, size1, grpno, indent, ansnum
FROM contents
WHERE contentsno = 1;


3) 새로운 답변을 최신으로 등록하기 위해 기존 답변을 뒤로 미룹니다.
-- 모든 글의 우선 순위가 1씩 증가됨, 1등 -> 2등
UPDATE contents
SET ansnum = ansnum + 1
WHERE cateno=1 AND grpno = 1 AND ansnum > 0;
 
-- 2등부터 우선 순위가 1씩 증가됨, 2등 -> 3등
UPDATE contents
SET ansnum = ansnum + 1
WHERE cateno=1 AND grpno = 1 AND ansnum > 1;
 
-- 3등부터 우선 순위가 1씩 증가됨, 3등 -> 4등
UPDATE contents
SET ansnum = ansnum + 1
WHERE cateno=1 AND grpno = 1 AND ansnum > 2;
 
-- 6등부터 우선 순위가 1씩 증가됨, 6등 -> 7등
UPDATE contents
SET ansnum = ansnum + 1
WHERE cateno=1 AND grpno = 1 AND ansnum > 5;
 
 
4) 답변 등록
- catenono: FK, mno: FK
INSERT INTO contents(contentsno, cateno, memberno, title, content, web, ip, passwd, thumb1, file1, size1, cnt, rdate, word, grpno, indent, ansnum)  
VALUES()

(contents_seq.nextval, 1, 1, '신규확진 2명', '전원 입국검역서 확인', 'http://www.daum.net',
            '127.0.0.1', '123', '코로나', sysdate, 'spring.jpg', 'spring_t.jpg', 23657,
            (SELECT NVL(MAX(grpno), 0)+1 FROM contents), 0, 0);

 
5) 답변에 따른 정렬 순서 변경    
-- ORDER BY grpno DESC, ansnum ASC
SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, ip
            file1, thumb1, size1,
            grpno, indent, ansnum, r
FROM (
           SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, ip
                        file1, thumb1, size1,
                        grpno, indent, ansnum, rownum as r
           FROM (
                     SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, ip
                                file1, thumb1, size1,
                                grpno, indent, ansnum
                     FROM contents
                     WHERE cateno=29 AND word LIKE '%스위스%'
                     ORDER BY grpno DESC, ansnum ASC -- 공식과도 같다.
           )          
)
WHERE r >= 1 AND r <= 10;      

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
답변관련 종료
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- replycnt는 replyVO와는 별개로 있는 칼럼이므로, 컨텐츠 개발자가 개발해줘야 함
1) 댓글수 증가
UPDATE contents
SET replycnt = replycnt + 1
WHERE contentsno = 1;

2) 댓글수 감소
UPDATE contents
SET replycnt = replycnt - 1
WHERE contentsno = 1;

COMMIT;














