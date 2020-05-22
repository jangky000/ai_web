/**********************************/
/* Table Name: ������ */
/**********************************/
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

COMMENT ON TABLE contents is '������';
COMMENT ON COLUMN contents.contentsno is '������ ��ȣ';
COMMENT ON COLUMN contents.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN contents.cateno is 'ī�װ� ��ȣ';
COMMENT ON COLUMN contents.title is '����';
COMMENT ON COLUMN contents.content is '����';
COMMENT ON COLUMN contents.recom is '��õ��';
COMMENT ON COLUMN contents.cnt is '��ȸ��';
COMMENT ON COLUMN contents.replycnt is '��ۼ�';
COMMENT ON COLUMN contents.web is '���ͳ� �ּ�';
COMMENT ON COLUMN contents.map is '����';
COMMENT ON COLUMN contents.youtube is 'Youtube';
COMMENT ON COLUMN contents.mp3 is 'MP3';
COMMENT ON COLUMN contents.mp4 is 'MP4';
COMMENT ON COLUMN contents.visible is '��� ���';
COMMENT ON COLUMN contents.ip is 'IP';
COMMENT ON COLUMN contents.passwd is '�н�����';
COMMENT ON COLUMN contents.grpno is '�׷��ȣ';
COMMENT ON COLUMN contents.indent is '�鿩����/�亯����';
COMMENT ON COLUMN contents.ansnum is '�亯����';
COMMENT ON COLUMN contents.word is '�˻���';
COMMENT ON COLUMN contents.rdate is '�����';

DROP SEQUENCE contents_seq;
CREATE SEQUENCE contents_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
1) �� ���
INSERT INTO contents(contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate)
VALUES(contents_seq.nextval, 1, 1, '�ű�Ȯ�� 2��', '���� �Ա��˿��� Ȯ��', 'http://www.daum.net',
            '127.0.0.1', '123', '�ڷγ�', sysdate);

INSERT INTO contents(contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate)
VALUES(contents_seq.nextval, 1, 1, '�ű�Ȯ�� 1��', '���� �Ա��˿��� Ȯ��', 'http://www.daum.net',
            '127.0.0.1', '123', '�ڷγ�', sysdate);
            
INSERT INTO contents(contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate)
VALUES(contents_seq.nextval, 1, 1, '�ű�Ȯ�� 0��', '����', 'http://www.daum.net',
            '127.0.0.1', '123', '�ڷγ�', sysdate);
            
SELECT contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate
FROM contents 
ORDER BY contentsno ASC;    

COMMIT;

2) ��ü ���
SELECT contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate 
FROM contents 
ORDER BY contentsno DESC;

2-1) cateno �� ���
SELECT contentsno, memberno, cateno, title, content, web, ip, passwd, word, rdate 
FROM contents
WHERE cateno = 1
ORDER BY contentsno DESC;

3) 1�� ��ȸ
SELECT contentsno, memberno, cateno, title, content, recom, web, ip, passwd, word, rdate 
FROM contents
WHERE contentsno = 1;

4) ����
UPDATE contents
SET title='����', content='����', web='http://', word='�˻���'
WHERE contentsno = 1;
  
5) �н����� �˻�
��ġ�ϸ� 1, ��ġ���� ������ 0
SELECT COUNT(*) AS passwd_cnt
FROM contents
WHERE contentsno=1 AND passwd=123;
  
6) ����
DELETE FROM contents
WHERE contentsno=1;

COMMIT;

7) ��� ���ڵ� ����
SELECT COUNT(*) as cnt
FROM contents;
 
 COUNT
 -----
     10


8) Ư�� ȸ���� �ۼ��� �۸� ���(3�� ���̺� ����)
SELECT c.cateno as c_cateno, c.name as c_name, c.rdate as c_rdate,
           t.contentsno as t_contentsno, t.title as t_title, t.web as t_web, t.ip as t_ip, t.rdate as t_rdate,
           m.memberno as m_memberno,  m.mname as m_mname
FROM cate c, contents t, member m
WHERE c.cateno = t.cateno AND t.memberno = m.memberno AND m.memberno=1
ORDER BY  c.cateno ASC, t.contentsno DESC;

--ANSI
SELECT c.cateno as c_cateno, c.name as c_name, c.rdate as c_rdate,
           t.contentsno as t_contentsno, t.title as t_title, t.web as t_web, t.ip as t_ip, t.rdate as t_rdate,
           m.memberno as m_memberno,  m.mname as m_mname
FROM cate c
INNER JOIN contents t
ON c.cateno = t.cateno
INNER JOIN member m
ON t.memberno = m.memberno
WHERE m.memberno=1
ORDER BY  c.cateno ASC, t.contentsno DESC;

-- Ư�� ȸ���� �� ����� ���� cate, contents ����, 
-- member�� select�� ���� �ʰ� from�� ������
SELECT c.cateno as c_cateno, c.name as c_name, c.rdate as c_rdate,
           t.contentsno as t_contentsno, t.title as t_title, t.web as t_web, t.ip as t_ip, t.rdate as t_rdate
FROM cate c, contents t, member m
WHERE c.cateno = t.cateno AND t.memberno = m.memberno AND m.memberno=1
ORDER BY  c.cateno ASC, t.contentsno DESC;

9) map
-- map         VARCHAR(1000)         NULL,
UPDATE contents
SET map='��â ������ ����'
WHERE contentsno=1; 

