package oop4;
 
public class Android implements Smartphone {
 
  @Override
  public void map() {
    System.out.println("Daum 맵 지원");
  }
 
  @Override
  public void nfc() {
    System.out.println("사원증 기능 지원");
  }
 
}
 