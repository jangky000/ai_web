package oop;
 
public class SSDMain {
 
  public static void main(String[] args) {
    // ssd 객체 생성(SSD.java 컴포넌트에서 가져와 사용)
    SSD ssd = new SSD(); 
    System.out.println(ssd.hashCode()); // .: 멤버 연산자
    // 2018699554
    System.out.println(ssd.name);
    System.out.println(ssd.price + " 원");
    System.out.println(ssd.dc + " 원");
    System.out.println(ssd.count + " 개");
    
    System.out.println("-------------------");
    ssd.name = "256 GB"; // ssd 객체가 할당 받은 메모리의 name변수에 문자열 저장
    ssd.price = 70000;
    ssd.dc = ssd.price - 5000;
    ssd.count = 2;
 
    System.out.println(ssd.name);
    System.out.println(ssd.price + " 원");
    System.out.println(ssd.dc + " 원");
    System.out.println(ssd.count + " 개");
  }
 
}