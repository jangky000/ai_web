package dev.mvc.calc;
 
public class CalcVO {
  private String msg;
  private int no1;
  private int no2;
  private int result;
  
  public String getMsg() {
    return msg;
  }
  public void setMsg(String msg) {
    this.msg = msg;
  }
  public int getResult() {
    return result;
  }
  public void setResult(int result) {
    this.result = result;
  }
  public int getNo1() {
    System.out.println("getNo1() called." + this.no1 + "���� ��");
    return no1;
  }
  public void setNo1(int no1) {
    System.out.println("setNo1() called." + no1 + "�����");    
    this.no1 = no1;
  }
  public int getNo2() {
    return no2;
  }
  public void setNo2(int no2) {
    this.no2 = no2;
  }
  
  
}