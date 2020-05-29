-- constraint.sql
-- 1) 테이블 생성
CREATE TABLE department(
    no NUMBER(10) NOT NULL,
    name VARCHAR2(10) NOT NULL,
    PRIMARY KEY(no)
);

-- 2) 제약조건의 확인
-- 시스템 테이블은 내부적으로 대문자로 만들어져 있음
SELECT constraint_name, constraint_type, search_condition
FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'DEPARTMENT';

CONSTRAINT_NAME                C SEARCH_CONDITION                                                                
------------------------------ - --------------------------------------------------------------------------------
SYS_C007339                    C "NO" IS NOT NULL                                                                
SYS_C007340                    C "NAME" IS NOT NULL                                                              
SYS_C007341                    P                                                                                 

-- 3) 제약조건의 삭제
-- 기본으로 만들어진 제약조건 삭제
ALTER TABLE department DROP CONSTRAINT SYS_C007341;

--PK 제약조건 추가
-- 제약조건명: position_pk, 제약 조건을 알기 쉽게 의미 있는 이름을 지정할 수 있다. 에러원인이 구체적으로 나오게 됨
ALTER TABLE department 
ADD CONSTRAINT department_pk 
PRIMARY KEY (no);

-- 4) FK 테이블 생성
DROP TABLE employee;

CREATE TABLE employee(
    empno NUMBER(10) NOT NULL, --PK
    name VARCHAR2(10) NOT NULL,
    no NUMBER(10) NOT NULL, -- FK
    PRIMARY KEY(empno)
);

-- 5) FK 추가
-- 제약조건명: 자식테이블_부모테이블_fk
ALTER TABLE employee ADD CONSTRAINT employee_department_fk
                                    FOREIGN KEY (no) REFERENCES department (no); -- FOREIGN KEY (no_fk)에는 칼럼명만 명시

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

