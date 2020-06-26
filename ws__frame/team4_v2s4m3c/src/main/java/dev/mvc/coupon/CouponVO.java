package dev.mvc.coupon;

/** ���� �߱� ���� */
public class CouponVO {
  /*
    couponno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    cpimg                             VARCHAR2(100)    NULL ,
    cpname                            VARCHAR2(200)    NOT NULL,
    cpdiscount                        NUMBER(10)     DEFAULT 0     NOT NULL,
    cpstock                           NUMBER(10)     DEFAULT 0     NOT NULL,
    cpcate                            VARCHAR2(100)    NULL 
 */
  
  /** ����no */
  private int couponno;
  /** �����̹��� */
  private String cpimg;
  /** �����̸� */
  private String cpname;
  /** �������αݾ� */
  private int cpdiscount;
  /** ������� */
  private int cpstock;
  /** ��밡��ī�װ� */
  private String cpcate;
  
  // getter setter
  public int getCouponno() {
    return couponno;
  }
  public void setCouponno(int couponno) {
    this.couponno = couponno;
  }
  public String getCpimg() {
    return cpimg;
  }
  public void setCpimg(String cpimg) {
    this.cpimg = cpimg;
  }
  public String getCpname() {
    return cpname;
  }
  public void setCpname(String cpname) {
    this.cpname = cpname;
  }
  public int getCpdiscount() {
    return cpdiscount;
  }
  public void setCpdiscount(int cpdiscount) {
    this.cpdiscount = cpdiscount;
  }
  public int getCpstock() {
    return cpstock;
  }
  public void setCpstock(int cpstock) {
    this.cpstock = cpstock;
  }
  public String getCpcate() {
    return cpcate;
  }
  public void setCpcate(String cpcate) {
    this.cpcate = cpcate;
  }
  
}
