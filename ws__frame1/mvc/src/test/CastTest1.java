package test;
 
class Sale {  // 부모 class
  public void spring_summer() {
    System.out.println("봄 -> 여름");
  }
}
// class Sale2 extends Object { } // 부모 class
 //Sale을 상속
class Y2014 extends Sale {
  @Override
  public void spring_summer() {
    System.out.println("spring -> summer");
  }
}
 
class Y2015 extends Sale { }
 
class Y2016 { }
 
public class CastTest1 {
 
  public static void main(String[] args) {
    
    Y2014 y2014 = new Y2014();
    Sale sale = y2014; // 자식 객체는 부모에 할당 가능, sale 객체 사용시 sale 객체의 class 타입은? Sale 타입, (메모리에는 y2014이지만)
    
    sale = new Y2015(); // 부모 <- 자식
    // sale = new Y2016(); // 상속 관계가 아님, 할당 할 수 없다.
    // Y2015 y2015 = sale; // 자식 <- 부모, 할당 할 수 없다.
    Y2015 y2015 = (Y2015) sale; // 객체 형변환. 자식 타입으로 부모가 할당
  
    // instanceof ~의 객체인가?
    // 다형성
    // 여러 가지 형태를 가질 수 있는 능력(여러 타입, 상속, 인터페이스)
    // 일반적으로 객체 생성과 할당되는 타입은 동일해야하나 좌변의 타입과 우변의 타입이 달라도 부모 클래스는 자식 클래스를 할당 받을 수 있음

    //Y2015의 인스턴스이기도, Sale의 객체이기도 함 -> 다형성
    System.out.println("sale instanceof Y2015: " + (sale instanceof Y2015)); // true
    System.out.println("sale instanceof Sale: " + (sale instanceof Sale));       // true
    
    //Sale 타입으로 Y2014 class의 객체를 생성할 것
    Sale sale2 = new Y2014();
    sale2.spring_summer(); // 자식 클래스의 메소드(우선)가 호출됨

  }
 
}