DROP TABLE test;

CREATE TABLE test(
    testno    NUMBER(5)   NOT NULL, -- -99999 ~ +99999 �ڸ���
    mname  VARCHAR(20) NOT NULL, -- �ѱ� 10�� 
    funct     VARCHAR(50) NOT NULL, -- �ֿ� ��� �о�  
    PRIMARY KEY (testno)         -- �ߺ� �ȵ�, ������ ���� ����  
); 


INSERT INTO test(testno, mname, funct) 
VALUES(1, '�մ���', 'JAVA/JSP/Spring'); 

INSERT INTO test(testno, mname, funct) 
VALUES(2, '�Ʒι�', 'JAVA/JSP/Spring/JQuery'); 

INSERT INTO test(testno, mname, funct) 
VALUES(3, '����', 'JAVA/JSP/Spring/JQuery/HTML5'); 

SELECT testno, mname, funct FROM test ORDER BY testno ASC; 

-- TESTNO MNAME FUNCT
-- ------ ----- ----------------------------
--      1 �մ���   JAVA/JSP/Spring
--      2 �Ʒι�   JAVA/JSP/Spring/JQuery
--      3 ����    JAVA/JSP/Spring/JQuery/HTML5

-- VARCHAR Ÿ���� ���� ���� ���ڼ� Ȯ��      
INSERT INTO test(testno, mname, funct) 
VALUES(4, '������ �ݿ��� FRIDAY12!!', 'JAVA/JSP/Spring/JQuery/HTML5');
-- '������ �ݿ��� ��ɴϴ�'�� �ʹ� �� ���� �߻� 13�� �ۿ� �ȵ����� ����Ŭ���� �ѱ� 1�ڰ� 3����Ʈ, MySQL�� ��� ���ڿ��� x2�ϸ� �� 
--ORA-12899: value too large for column "AI4"."TEST"."MNAME" (actual: 33, maximum: 20)

DELETE FROM test WHERE testno=4;


--Oracle: �ѱ� 1�ڴ� 3����Ʈ, Ư�� ���ڴ� 1����Ʈ ���
--MySQL: varchar(10)�̸� ��� ���ڸ� 10�� ���� ���� 