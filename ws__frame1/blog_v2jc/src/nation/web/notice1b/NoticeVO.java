package nation.web.notice1b;

public class NoticeVO {
/*
  noticeno  NUMBER(7)      NOT NULL, -- -9999999 ~ 9999999, �������� ��ȣ
  title        VARCHAR(100)  NOT NULL, -- ����
  content CLOB                 NOT NULL,-- ������ ���� �� �����Ƿ� CLOB
  rname     VARCHAR(20)     NOT NULL, -- ����� ����
  passwd VARCHAR(20)    NOT NULL, -- �н�����
  rdate      DATE               NOT NULL, -- �����
*/
  
  private int noticeno = 0;
  private String title = null;
  private String content = null;
  private String rname = null;
  private String passwd = null;
  private String rdate = null; // ��¥ Ÿ���� String���� ���� ���� ��õ
  
  // �⺻ ������
  public NoticeVO() {
    
  }
  // �μ� �ִ� ������
  public NoticeVO(String title, String content, String rname, String passwd) {
    this.title = title;
    this.content = content;
    this.rname = rname;
    this.passwd = passwd;
  }

  public NoticeVO(int noticeno, String title, String content, String rname, String passwd, String rdate) {
    this.noticeno = noticeno;
    this.title = title;
    this.content = content;
    this.rname = rname;
    this.passwd = passwd;
    this.rdate = rdate;
  }



  //��Ŭ�� > source > gernerate Getters and Setters
  public int getNoticeno() {
    return noticeno;
  }
  public void setNoticeno(int noticeno) {
    this.noticeno = noticeno;
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
  public String getRname() {
    return rname;
  }
  public void setRname(String rname) {
    this.rname = rname;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }

  
}