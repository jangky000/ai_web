package dev.mvc.contents;

/*
    contentsno                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    memberno                          NUMBER(10)   NOT NULL ,
    cateno                            NUMBER(10)     NOT NULL,
    title                             VARCHAR2(300)    NOT NULL,
    content                           CLOB             NOT NULL,
    recom                             NUMBER(7)    DEFAULT 0     NOT NULL,
    cnt                               NUMBER(7)    DEFAULT 0     NOT NULL,
    replycnt                          NUMBER(7)    DEFAULT 0     NOT NULL,
    web                               VARCHAR2(500)    NULL ,
    map                               VARCHAR2(1000)     NULL ,
    youtube                           VARCHAR2(1000)     NULL ,
    mp3                               VARCHAR2(1000)     NULL ,
    mp4                               VARCHAR2(1000)     NULL ,
    visible                           CHAR(1)    DEFAULT 'Y'     NOT NULL,
    ip                                VARCHAR2(15)     NOT NULL,
    passwd                            VARCHAR2(15)     NOT NULL,
    grpno                             NUMBER(8)    DEFAULT 0     NOT NULL,
    indent                            NUMBER(2)    DEFAULT 0     NOT NULL,
    ansnum                            NUMBER(3)    DEFAULT 0     NOT NULL,
    word                              VARCHAR2(300)    NULL , 
    rdate                                 DATE               NOT NULL,
 */
public class ContentsVO {
  /** 컨텐츠 번호 */
  private int contentsno;
  /** 회원 번호 */
  private int memberno;
  /** 카테고리 번호*/
  private int cateno;
  /** 제목 */
  private String title;
  /** 내용 */
  private String content;
  /** 추천수 */
  private int recom;
  /** 인터넷 주소*/
  private String web;
  /** IP */
  private String ip;
  /** 패스워드 */
  private String passwd;
  /** 검색어 */
  private String word;
  /** 등록 날짜 */
  private String rdate;
  
  public int getContentsno() {
    return contentsno;
  }
  public void setContentsno(int contentsno) {
    this.contentsno = contentsno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public int getCateno() {
    return cateno;
  }
  public void setCateno(int cateno) {
    this.cateno = cateno;
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
  public String getWeb() {
    return web;
  }
  public void setWeb(String web) {
    this.web = web;
  }
  public String getIp() {
    return ip;
  }
  public void setIp(String ip) {
    this.ip = ip;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getWord() {
    return word;
  }
  public void setWord(String word) {
    this.word = word;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public int getRecom() {
    return recom;
  }
  public void setRecom(int recom) {
    this.recom = recom;
  }
  
  
}





