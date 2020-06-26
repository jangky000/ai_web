package dev.mvc.coupon;

/** 쿠폰 발급 내역 */
public class CouponVO {
  /*
    couponno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    cpimg                             VARCHAR2(100)    NULL ,
    cpname                            VARCHAR2(200)    NOT NULL,
    cpdiscount                        NUMBER(10)     DEFAULT 0     NOT NULL,
    cpstock                           NUMBER(10)     DEFAULT 0     NOT NULL,
    cpcate                            VARCHAR2(100)    NULL 
 */
  
  /** 쿠폰no */
  private int couponno;
  /** 쿠폰이미지 */
  private String cpimg;
  /** 쿠폰이름 */
  private String cpname;
  /** 쿠폰할인금액 */
  private int cpdiscount;
  /** 쿠폰재고 */
  private int cpstock;
  /** 사용가능카테고리 */
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
