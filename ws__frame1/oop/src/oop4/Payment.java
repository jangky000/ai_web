package oop4;
 
public abstract class Payment { //추상 클래스
  public void cach() {
    System.out.println("현금 결재");
  }
  
  public abstract void card();    // 추상 메소드, 실체가 없음
  public abstract void mobile();  // 추상 메소드
}
 