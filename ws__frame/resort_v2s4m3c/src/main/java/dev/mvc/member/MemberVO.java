package dev.mvc.member;
 
public class MemberVO {
  /*
  memberno INT NOT NULL AUTO_INCREMENT, -- ȸ�� ��ȣ, ���ڵ带 �����ϴ� �÷� 
  id           VARCHAR(20)   NOT NULL UNIQUE, -- ���̵�, �ߺ� �ȵ�, ���ڵ带 ���� 
  passwd    VARCHAR(20)   NOT NULL, -- �н�����, ������ ����
  mname    VARCHAR(20)   NOT NULL, -- ����, �ѱ� 10�� ���� ����
  tel          VARCHAR(14)   NOT NULL, -- ��ȭ��ȣ
  zipcode   VARCHAR(5)        NULL, -- �����ȣ, 12345
  address1  VARCHAR(80)       NULL, -- �ּ� 1
  address2  VARCHAR(50)       NULL, -- �ּ� 2
  mdate     DATETIME            NOT NULL, -- ������    
  PRIMARY KEY (mno)             -- �ѹ� ��ϵ� ���� �ߺ� �ȵ� 
  */
 
  /** ������ ��ȣ */
  private int memberno;
  /** ���̵� */
  private String id = "";
  /** �н����� */
  private String passwd = "";
  /** ������ ���� */
  private String mname = "";
  /** ��ȭ ��ȣ */
  private String tel = "";
  /** ���� ��ȣ */
  private String zipcode = "";
  /** �ּ� 1 */
  private String address1 = "";
  /** �ּ� 2 */
  private String address2 = "";
  /** ������ */
  private String mdate = "";
  
  /** ��ϵ� �н����� */
  private String old_passwd = "";
  /** id ���� ���� */
  private String id_save = "";
  /** passwd ���� ���� */
  private String passwd_save = "";
  /** �̵��� �ּ� ���� */
  private String url_address = "";
  

 
}