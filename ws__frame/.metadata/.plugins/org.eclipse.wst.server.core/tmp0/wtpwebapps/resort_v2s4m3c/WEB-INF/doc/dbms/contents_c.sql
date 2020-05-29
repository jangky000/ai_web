/**********************************/
/* Table Name: 컨텐츠 */
/**********************************/
DROP TABLE attachfile;
DROP TABLE contents;
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

DROP SEQUENCE contents_seq;
CREATE SEQUENCE contents_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
1) 글 등록
INSERT INTO contents(contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate)
VALUES(contents_seq.nextval, 1, 1, '신규확진 2명', '전원 입국검역서 확인', 'http://www.daum.net',
            '127.0.0.1', '123', '코로나', sysdate);

INSERT INTO contents(contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate)
VALUES(contents_seq.nextval, 1, 1, '신규확진 1명', '전원 입국검역서 확인', 'http://www.daum.net',
            '127.0.0.1', '123', '코로나', sysdate);
            
INSERT INTO contents(contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate)
VALUES(contents_seq.nextval, 1, 1, '신규확진 0명', '종식', 'http://www.daum.net',
            '127.0.0.1', '123', '코로나', sysdate);

SELECT contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate
FROM contents 
ORDER BY contentsno ASC;    

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
SELECT contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate 
FROM contents 
ORDER BY contentsno DESC;

2-1) cateno별 목록
SELECT contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate 
FROM contents 
WHERE cateno = 1
ORDER BY contentsno DESC;

2-2) ① cateno별 검색 목록
SELECT contentsno, memberno, cateno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
WHERE cateno=23 AND word LIKE '%스위스%'
ORDER BY contentsno DESC;

SELECT contentsno, memberno, cateno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
WHERE cateno=2 AND word LIKE '%스의스%'
ORDER BY contentsno DESC;

SELECT contentsno, memberno, cateno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
WHERE cateno=2 AND word LIKE '%수의스%'
ORDER BY contentsno DESC;

-- title, content, word 칼럼 검색
SELECT contentsno, memberno, cateno, title, content, 
           recom, cnt, replycnt, rdate, word
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
SELECT contentsno, memberno, cateno, title, content, recom, web, map, youtube, ip, passwd, word, rdate 
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


