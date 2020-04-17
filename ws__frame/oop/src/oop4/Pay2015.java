package oop4;
 
public class Pay2015 extends Payment { // 상속
 
  @Override
  public void card() {
    System.out.println("신용 카드 결재 2.5%");
  }
 
  @Override
  public void mobile() {
    System.out.println("휴대폰 결재 300 원");
  }
 
}