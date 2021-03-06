package nation.web.mail_app1b;

public class MailVO {
/*
  mailno    NUMBER(7)      NOT NULL, -- -9999999 ~ 9999999, 공지사항 번호
  title         VARCHAR(100)  NOT NULL, -- 제목
  content   CLOB                 NOT NULL,-- 내용이 많을 수 있으므로 CLOB
  mail_from     VARCHAR(100)     NOT NULL, -- 보내는 사람 ip
  mail_to       VARCHAR(100) NOT NULL, -- 받는 사람 ip
  rdate      DATE               NOT NULL, -- 등록일
*/
  
  private int mailno = 0;
  private String title = null;
  private String content = null;
  private String mail_from = null;
  private String mail_to = null;
  private String rdate = null; // 날짜 타입은 String으로 쓰는 것을 추천
  private String url1 = null;
  private String url2 = null;
  private String youtube = null;
  private int cnt = 0;
  
  // 기본 생성자
  public MailVO() {
    
  }

  
  
  public MailVO(int mailno, String title, String content, String mail_from, String mail_to, String rdate, String url1, String url2, String youtube, int cnt) {
    this.mailno = mailno;
    this.title = title;
    this.content = content;
    this.mail_from = mail_from;
    this.mail_to = mail_to;
    this.rdate = rdate;
    this.url1 = url1;
    this.url2 = url2;
    this.youtube = youtube;
    this.cnt = cnt;
  }

  public MailVO(String title, String content, String mail_from, String mail_to, String url1, String url2, String youtube, int cnt) {
    this.title = title;
    this.content = content;
    this.mail_from = mail_from;
    this.mail_to = mail_to;
    this.url1 = url1;
    this.url2 = url2;
    this.youtube = youtube;
    this.cnt = cnt;
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
  
  public String getUrl1() {
    return url1;
  }
  
  public void setUrl1(String url1) {
    this.url1 = url1;
  }

  public String getUrl2() {
    return url2;
  }
  
  public void setUrl2(String url2) {
    this.url2 = url2;
  }
  
  public String getYoutube() {
    return youtube;
  }
  
  public void setYoutube(String youtube) {
    this.youtube = youtube;
  }


  public int getCnt() {
    return cnt;
  }


  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  
}
