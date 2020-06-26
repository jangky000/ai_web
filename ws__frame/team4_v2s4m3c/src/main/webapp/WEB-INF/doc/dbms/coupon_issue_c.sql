DROP TABLE coupon_issue CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 쿠폰발급내역 */
/**********************************/
CREATE TABLE coupon_issue(
		coupon_issueno                		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memno                         		NUMBER(10)		 NOT NULL,
		couponno                      		NUMBER(10)		 NOT NULL ,
		cpcnt                           		NUMBER(10)		 NOT NULL,
		cpissue                        		DATE		 NOT NULL,
		cpexpired                      		DATE		 NOT NULL,
		cpstatus                 		CHAR(1)		 NOT NULL ,
	FOREIGN KEY (memno) REFERENCES mem(memno),
    FOREIGN KEY (couponno) REFERENCES coupon (couponno)
);

COMMENT ON TABLE coupon_issue is '쿠폰발급내역';
COMMENT ON COLUMN coupon_issue.coupon_issueno is '쿠폰발급no';
COMMENT ON COLUMN coupon_issue.memno is '회원no';
COMMENT ON COLUMN coupon_issue.couponno is '쿠폰no';
COMMENT ON COLUMN coupon_issue.cpcnt is '쿠폰발급수량';
COMMENT ON COLUMN coupon_issue.cpissue is '쿠폰발급일';
COMMENT ON COLUMN coupon_issue.cpexpired is '쿠폰만료일';
COMMENT ON COLUMN coupon_issue.cpstatus is '쿠폰상태'; -- I: issue 발급, U: used 사용완료

DROP SEQUENCE coupon_issue_seq;
CREATE SEQUENCE coupon_issue_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- coupon_issueno, memno, couponno, cpcnt, cpissue, cpexpired, cpstatus

-- CREATE
-- 취소시 재발급
INSERT INTO coupon_issue(coupon_issueno, memno, couponno, cpcnt, cpissue, cpexpired, cpstatus)
VALUES(coupon_issue_seq.nextval, 1, 1, 1, sysdate, add_months(sysdate,1), 'I');
INSERT INTO coupon_issue(coupon_issueno, memno, couponno, cpcnt, cpissue, cpexpired, cpstatus)
VALUES(coupon_issue_seq.nextval, 1, 2, 1, sysdate, add_months(sysdate,1), 'I');
INSERT INTO coupon_issue(coupon_issueno, memno, couponno, cpcnt, cpissue, cpexpired, cpstatus)
VALUES(coupon_issue_seq.nextval, 1, 3, 1, sysdate, add_months(sysdate,1), 'I');

COMMIT;

-- LIST
SELECT coupon_issueno, memno, couponno, cpcnt, cpissue, cpexpired, cpstatus
FROM coupon_issue
ORDER BY coupon_issueno DESC;

-- READ
SELECT coupon_issueno, memno, couponno, cpcnt, cpissue, cpexpired, cpstatus
FROM coupon_issue
WHERE coupon_issueno=1;

-- UPDATE
-- 사용 완료
UPDATE coupon_issue 
SET cpstatus='U'
WHERE coupon_issueno = 1;

-- 수량 변경
UPDATE coupon_issue 
SET cpcnt=2
WHERE coupon_issueno = 1;

-- DELETE
DELETE FROM coupon_issue
WHERE coupon_issueno = 1;

ROLLBACK;

-- JOIN
SELECT *
FROM coupon cp, coupon_issue cpi
WHERE cp.couponno = cpi.couponno;