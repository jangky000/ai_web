package nation.web.mail_app1b;

public class NoticeVO {
/*
  mailno    NUMBER(7)      NOT NULL, -- -9999999 ~ 9999999, �������� ��ȣ
  title         VARCHAR(100)  NOT NULL, -- ����
  content   CLOB                 NOT NULL,-- ������ ���� �� �����Ƿ� CLOB
  mail_from     VARCHAR(100)     NOT NULL, -- ������ ��� ip
  mail_to       VARCHAR(100) NOT NULL, -- �޴� ��� ip
  rdate      DATE               NOT NULL, -- �����
*/
  
  private int mailno = 0;
  private String title = null;
  private String content = null;
  private String mail_from = null;
  private String mail_to = null;
  private String rdate = null; // ��¥ Ÿ���� String���� ���� ���� ��õ
  
  // �⺻ ������
  public NoticeVO() {
    
  }

  
  
  public NoticeVO(int mailno, String title, String content, String mail_from, String mail_to, String rdate) {
    this.mailno = mailno;
    this.title = title;
    this.content = content;
    this.mail_from = mail_from;
    this.mail_to = mail_to;
    this.rdate = rdate;
  }

  public NoticeVO(String title, String content, String mail_from, String mail_to) {
    this.title = title;
    this.content = content;
    this.mail_from = mail_from;
    this.mail_to = mail_to;
  }



  public int getMailno() {
    return mailno;
  }

  public void setMailno(int mailno) {
    this.mailno = mailno;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getMail_from() {
    return mail_from;
  }

  public void setMail_from(String mail_from) {
    this.mail_from = mail_from;
  }

  public String getMail_to() {
    return mail_to;
  }

  public void setMail_to(String mail_to) {
    this.mail_to = mail_to;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  



  

  
}