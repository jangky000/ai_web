package dev.mvc.porder;

/** �ֹ� */
public class PorderVO {
  /*
    porderno                         NUMBER(10)     NOT NULL    PRIMARY KEY,
    rdate                             DATE     NOT NULL,
    total_price                       NUMBER(10)     DEFAULT 0     NOT NULL,
    status                            CHAR(1)    NOT NULL,
    memberno                          NUMBER(10)     NOT NULL,
 */
  
  /** �ֹ�no */
  private int porderno;
  /** ȸ����ȣ */
  private int rdate;
  /** �ֹ���¥ */
  private int total_price;
  /** �ֹ��Ѿ� */
  private int status;
  /** �ֹ����� */
  private int memberno;
  
  // getter / setter
  public int getPorderno() {
    return porderno;
  }
  public void setPorderno(int porderno) {
    this.porderno = porderno;
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
  public int getStatus() {
    return status;
  }
  public void setStatus(int status) {
    this.status = status;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  
  
}