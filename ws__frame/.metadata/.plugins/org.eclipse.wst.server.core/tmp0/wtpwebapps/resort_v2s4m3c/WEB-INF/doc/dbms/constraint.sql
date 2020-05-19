-- constraint.sql
-- 1) ���̺� ����
CREATE TABLE department(
    no NUMBER(10) NOT NULL,
    name VARCHAR2(10) NOT NULL,
    PRIMARY KEY(no)
);

-- 2) ���������� Ȯ��
-- �ý��� ���̺��� ���������� �빮�ڷ� ������� ����
SELECT constraint_name, constraint_type, search_condition
FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'DEPARTMENT';

CONSTRAINT_NAME                C SEARCH_CONDITION                                                                
------------------------------ - --------------------------------------------------------------------------------
SYS_C007339                    C "NO" IS NOT NULL                                                                
SYS_C007340                    C "NAME" IS NOT NULL                                                              
SYS_C007341                    P                                                                                 

-- 3) ���������� ����
-- �⺻���� ������� �������� ����
ALTER TABLE department DROP CONSTRAINT SYS_C007341;

--PK �������� �߰�
-- �������Ǹ�: position_pk, ���� ������ �˱� ���� �ǹ� �ִ� �̸��� ������ �� �ִ�. ���������� ��ü������ ������ ��
ALTER TABLE department 
ADD CONSTRAINT department_pk 
PRIMARY KEY (no);

-- 4) FK ���̺� ����
DROP TABLE employee;

CREATE TABLE employee(
    empno NUMBER(10) NOT NULL, --PK
    name VARCHAR2(10) NOT NULL,
    no NUMBER(10) NOT NULL, -- FK
    PRIMARY KEY(empno)
);

-- 5) FK �߰�
-- �������Ǹ�: �ڽ����̺�_�θ����̺�_fk
ALTER TABLE employee ADD CONSTRAINT employee_department_fk
                                    FOREIGN KEY (no) REFERENCES department (no); -- FOREIGN KEY (no_fk)���� Į���� ���

SELECT constraint_name, constraint_type, search_condition
FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'EMPLOYEE';

ONSTRAINT_NAME                     C         SEARCH_CONDITION                                                                
------------------------------------------------------------------------------------
EMPLOYEE_DEPARTMENT_FK         R                                                                                 
SYS_C007348                              C        "EMPNO" IS NOT NULL                                                             
SYS_C007349                              C        "NAME" IS NOT NULL                                                              
SYS_C007350                              C        "NO" IS NOT NULL                                                                
SYS_C007351                              P                                                                                 

