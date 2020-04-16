package nation.web.notice1c;

public class NoticeVO {
/*
  noticeno  NUMBER(7)      NOT NULL, -- -9999999 ~ 9999999, 공지사항 번호
  title        VARCHAR(100)  NOT NULL, -- 제목
  content CLOB                 NOT NULL,-- 내용이 많을 수 있으므로 CLOB
  rname     VARCHAR(20)     NOT NULL, -- 등록자 성명
  passwd VARCHAR(20)    NOT NULL, -- 패스워드
  rdate      DATE               NOT NULL, -- 등록일
*/
  
  private int noticeno = 0;
  private String title = null;
  private String content = null;
  private String rname = null;
  private String passwd = null;
  private String rdate = null; // 날짜 타입은 String으로 쓰는 것을 추천
  
  // 기본 생성자
  public NoticeVO() {
    
  }
  // 인수 있는 생성자
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



  //우클릭 > source > gernerate Getters and Setters
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
