[03] INDEX ����
     - index ����� ���Ͽ� ����Ŭ�� �˻� �ӵ��� ����ų �� �ֽ��ϴ�.
       ������ ������ �̸� ����� �δ� �Ͱ� ���� �����Դϴ�.

     - WHERE���ǿ� ������ �÷��� ������� �մϴ�.
       PK�÷��� �ڵ����� �ε����� �����˴ϴ�.
       �ٸ� �÷��� �ʿ�� �������� �����մϴ�.

     - �ϳ��� index�� ���̺� �뷮�� 5%~20%������ ������ �� ��������
       ������ �ε��� ������ ���ؾ��մϴ�.
       index�� �������� index ���� ������ ���Ͽ� Transaction(INSERT, UPDATE, DELETE) �ð��� ������ϴ�.

     - ������ index�� SQL����ÿ� ����Ŭ�����κ��� �ڵ�����
       ���˴ϴ�.

     - index�� �̿��� �˻� ���ڵ���� 5%�� ��� ����� �����մϴ�.

     - PK �÷��� �ڵ����� index�� ������.

       
�� /ai3/oracle/index.sql
-------------------------------------------------------------------------------------     
1) ���� ���ڵ� ����
DELETE FROM itpay;
 
2) sample�� ���ڵ� �߰�
INSERT INTO itpay(payno, part, sawon, age, address,month, gdate, bonbong, tax, bonus)
VALUES(1, '��������', '���浿', 27, '��⵵ ������', '200801', sysdate, 1530000, 12345.67, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address,month, gdate, bonbong, tax, bonus)
VALUES(2, '��������', '���浿', 30, '��õ�� ��籸','200801', sysdate-5, 1940000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(3, '������', '�ٱ浿', 34, '��⵵ ������', '200801', sysdate-3, 2890000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(4, '������', '��浿', 36, '��⵵ ��õ��','200802', sysdate-1, 4070000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(5, 'DB������', '���浿', 38, '��⵵ ��õ��', '200802', sysdate-0, 2960000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(6, '��ȹ������', '�ٱ浿', 40, '����� ������', '200802', sysdate-0, 3840000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(7, '������', '��浿', 42, '��õ�� ��籸', '200803', sysdate-0, 4230000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(8, 'DB������', '��浿', 42, '��⵵ ��õ��', '200803', sysdate-1, 4010000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(9, 'DB������', '�̱浿', 42, '����� ������', '200803', sysdate-1, 3500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus) 
VALUES(10, '������', '�ű浿', 33, '����� ���Ǳ�', '200804', sysdate, 3500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(11, '������', '�ֱ浿', 31, '����� ���Ǳ�', '200804', sysdate, 4500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(12, '������', '���浿', 29, '����� ���Ǳ�', '200804', sysdate, 3200000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(13, '��������', '���浿', 27, '��⵵ ������', '200801', sysdate, 1530000, 12345.67, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(14, '��������', '���浿', 30, '��õ�� ��籸', '200801', sysdate-5, 1940000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(15, '������', '�ٱ浿', 34, '��⵵ ������', '200801', sysdate-3, 2890000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(16, '������', '��浿', 36, '��⵵ ��õ��', '200802', sysdate-1, 4070000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(17, 'DB������', '���浿', 38, '��⵵ ��õ��', '200802', sysdate-0, 2960000, 0, 0);
  
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(18, '��ȹ������', '�ٱ浿', 40, '����� ������', '200802', sysdate-0, 3840000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(19, '������', '��浿', 42, '��õ�� ��籸', '200803', sysdate-0, 4230000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(20, 'DB������', '��浿', 42, '��⵵ ��õ��', '200803', sysdate-1, 4010000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(21, 'DB������', '�̱浿', 42, '����� ������', '200803', sysdate-1, 3500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(22, '������', '�ű浿', 33, '����� ���Ǳ�', '200804', sysdate, 3500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(23, '������', '�ֱ浿', 31, '����� ���Ǳ�', '200804', sysdate, 4500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(24, '������', '���浿', 29, '����� ���Ǳ�', '200804', sysdate, 3200000, 0, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(25, '������', '�����', 23, '��⵵ ����', '200804', sysdate, 3200000, 0, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(26, '������', '�����', 24, '��⵵ ���ֽ�', '200804', sysdate, 3200000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(27, '������', '�ٱ��', 25, '��⵵ �Ⱦ��', '200804', sysdate, 2500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(28, '������', '����', 26, '����� ���α�', '200804', sysdate, 2300000, 0, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(29, '������', '�����', 27, '����� ���α�', '200804', sysdate, 2200000, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(30, '������', '�ٱ��', 28, '����� ���α�', '200804', sysdate, 2200000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address,month, gdate, bonbong, tax, bonus)
VALUES(31, '��������', '���浿', 27, '��⵵ ������', '200801', sysdate, 1530000, 12345.67, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address,month, gdate, bonbong, tax, bonus)
VALUES(32, '��������', '���浿', 30, '��õ�� ��籸','200801', sysdate-5, 1940000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(33, '������', '�ٱ浿', 34, '��⵵ ������', '200801', sysdate-3, 2890000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(34, '������', '��浿', 36, '��⵵ ��õ��','200802', sysdate-1, 4070000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(35, 'DB������', '���浿', 38, '��⵵ ��õ��', '200802', sysdate-0, 2960000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(36, '��ȹ������', '�ٱ浿', 40, '����� ������', '200802', sysdate-0, 3840000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(37, '������', '��浿', 42, '��õ�� ��籸', '200803', sysdate-0, 4230000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(38, 'DB������', '��浿', 42, '��⵵ ��õ��', '200803', sysdate-1, 4010000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(39, 'DB������', '�̱浿', 42, '����� ������', '200803', sysdate-1, 3500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(40, '������', '�ű浿', 33, '����� ���Ǳ�', '200804', sysdate, 3500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(41, '������', '�ֱ浿', 31, '����� ���Ǳ�', '200804', sysdate, 4500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(42, '������', '���浿', 29, '����� ���Ǳ�', '200804', sysdate, 3200000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(43, '��������', '���浿', 27, '��⵵ ������', '200801', sysdate, 1530000, 12345.67, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(44, '��������', '���浿', 30, '��õ�� ��籸', '200801', sysdate-5, 1940000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(45, '������', '�ٱ浿', 34, '��⵵ ������', '200801', sysdate-3, 2890000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(46, '������', '��浿', 36, '��⵵ ��õ��', '200802', sysdate-1, 4070000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(47, 'DB������', '���浿', 38, '��⵵ ��õ��', '200802', sysdate-0, 2960000, 0, 0);
  
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(48, '��ȹ������', '�ٱ浿', 40, '����� ������', '200802', sysdate-0, 3840000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(49, '������', '��浿', 42, '��õ�� ��籸', '200803', sysdate-0, 4230000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(50, 'DB������', '��浿', 42, '��⵵ ��õ��', '200803', sysdate-1, 4010000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(51, 'DB������', '�̱浿', 42, '����� ������', '200803', sysdate-1, 3500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(52, '������', '�ű浿', 33, '����� ���Ǳ�', '200804', sysdate, 3500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(53, '������', '�ֱ浿', 31, '����� ���Ǳ�', '200804', sysdate, 4500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(54, '������', '���浿', 29, '����� ���Ǳ�', '200804', sysdate, 3200000, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(55, '������', '�����', 23, '��⵵ ����', '200804', sysdate, 3200000, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(56, '������', '�����', 24, '��⵵ ���ֽ�', '200804', sysdate, 3200000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(57, '������', '�ٱ��', 25, '��⵵ �Ⱦ��', '200804', sysdate, 2500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(58, '������', '����', 26, '����� ���α�', '200804', sysdate, 2300000, 0, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(59, '������', '�����', 27, '����� ���α�', '200804', sysdate, 2200000, 0, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(60, '������', '�ٱ��', 28, '����� ���α�', '200804', sysdate, 2200000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(61, 'DB������', '�̱浿', 42, '����� ������', '200803', sysdate-1, 3500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(62, '������', '�ű浿', 33, '����� ���Ǳ�', '200804', sysdate, 3500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(63, '������', '�ֱ浿', 31, '����� ���Ǳ�', '200804', sysdate, 4500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(64, '������', '���浿', 29, '����� ���Ǳ�', '200804', sysdate, 3200000, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(65, '������', '�����', 23, '��⵵ ����', '200804', sysdate, 3200000, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(66, '������', '�����', 24, '��⵵ ���ֽ�', '200804', sysdate, 3200000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(67, '������', '�ٱ��', 25, '��⵵ �Ⱦ��', '200804', sysdate, 2500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(68, '������', '����', 26, '����� ���α�', '200804', sysdate, 2300000, 0, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(69, '������', '�����', 27, '����� ���α�', '200804', sysdate, 2200000, 0, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(70, '������', '�ٱ��', 28, '����� ��걸', '200804', sysdate, 2200000, 0, 0);
 
 INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(71, 'DB������', '�̱浿', 42, '����� ������', '200803', sysdate-1, 3500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(72, '������', '�ű浿', 33, '����� ���Ǳ�', '200804', sysdate, 3500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(73, '������', '�ֱ浿', 31, '����� ���Ǳ�', '200804', sysdate, 4500000, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(74, '������', '���浿', 29, '����� ���Ǳ�', '200804', sysdate, 3200000, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(75, '������', '�����', 23, '��⵵ ������', '200804', sysdate, 3200000, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(76, '������', '�����', 24, '��⵵ �����', '200804', sysdate, 3200000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(77, '������', '�ٱ��', 25, '��⵵ ���ֽ�', '200804', sysdate, 2500000, 0, 0);
 
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(78, '������', '����', 26, '��⵵ �ǿս�', '200804', sysdate, 2300000, 0, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(79, '������', '�����', 27, '��⵵ ������', '200804', sysdate, 2200000, 0, 0);
       
INSERT INTO itpay(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(80, '������', '�ٱ��', 28, '����� ��걸', '200804', sysdate, 2200000, 0, 0);
 
 
SELECT COUNT(*) FROM itpay;
        
3) index�� ���� address �÷��� �˻�, 0.121 ��
SELECT * FROM itpay WHERE address = '����� ���α�';
  
4) index ����: ���̺��_�÷���_idx
CREATE INDEX itpay_address_idx ON itpay(address);
 
5) index ���, ���ٸ� ���� �ʿ� ����, 0.067 ��
SELECT * FROM itpay WHERE address = '����� ���α�'; 
 
6) index ����
DROP INDEX itpay_address_idx;
 
7) ����ε� �̸��� �빮�ڷ� �����Ͽ� �Լ���� �ε����� ������ ���
-- �Լ����� �ε����� �� �� �ִ�. 
CREATE INDEX emp_sawon_idx
ON itpay(UPPER(sawon));
 
    