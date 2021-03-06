package test;

class Computer { }

public class CastTest2 {
  public static void main(String[] args) {
    Computer pc = new Computer();
    System.out.println("pc: " + pc.hashCode()); // pc: 2018699554
    
    // Object는 모든 클래스의 super 클래스
    Object obj = new Computer();
    System.out.println("obj: " + obj.hashCode()); // obj: 1311053135
    
    Computer pc2 = (Computer)obj; // 타입을 변경해도 Hashcode는 변경되지 않음
    System.out.println("pc2: " + pc2.hashCode()); // pc2: 1311053135
  }

}