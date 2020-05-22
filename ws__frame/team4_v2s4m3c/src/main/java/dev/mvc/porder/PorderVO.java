package dev.mvc.porder;

/** 주문 */
public class PorderVO {
  /*
    porderno                         NUMBER(10)     NOT NULL    PRIMARY KEY,
    rdate                             DATE     NOT NULL,
    total_price                       NUMBER(10)     DEFAULT 0     NOT NULL,
    status                            CHAR(1)    NOT NULL,
    memberno                          NUMBER(10)     NOT NULL,
 */
  
  /** 주문no */
  private int porderno;
  /** 회원번호 */
  private int memberno;
  /** 주문날짜 */
  private int rdate;
  /** 주문총액 */
  private int total_price;
  /** 주문상태 */
  private String status;
  
  //getter / setter
  public int getPorderno() {
    return porderno;
  }
  public void setPorderno(int porderno) {
    this.porderno = porderno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public int getRdate() {
    return rdate;
  }
  public void setRdate(int rdate) {
    this.rdate = rdate;
  }
  public int getTotal_price() {
    return total_price;
  }
  public void setTotal_price(int total_price) {
    this.total_price = total_price;
  }
  public String getStatus() {
    return status;
  }
  public void setStatus(String status) {
    this.status = status;
  }

 
  
}
