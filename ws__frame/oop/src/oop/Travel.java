package oop;
 
public class Travel {
  String area = "청평사";
  
  public void trip1() {
    System.out.println("1) 전역 변수: " + area);
  }
  
  public void  trip2() {
    String area = "가평";
    System.out.println("2) 지역 변수: " + area);
  }
  
  public void trip3(){
    String area = "강촌";
    System.out.println("3) 지역 / 전역 변수: " + area + " / " + this.area);
  }
  
  public void trip4(String area) {
    System.out.println("4) 지역 변수: " + area);
  }
  
  public void trip5(String area) {
    this.area = area; //  전역변수 <- 지역변수
  }
  
  //메소드 내에 지역 변수가 없을 때 this를 사용하지 않아도 전역변수 접근
  public void trip6() {
    System.out.println("6) 전역변수: " + area);
  }
  
}