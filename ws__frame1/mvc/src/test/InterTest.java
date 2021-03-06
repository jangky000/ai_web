package test;
 
interface Payment {
  public abstract void pay(); // 추상 메소드
  
}
 
class Cash implements Payment {
  @Override// 추상메소드 구현
  public void pay() {
    System.out.println("현금 결재를 합니다.");
  }
   
  public void print() {
    System.out.println("Cash class 객체 print()");
  }
  
}
 
class Mobile implements Payment {
  @Override
  public void pay() {
    System.out.println("스마트폰 결재를 합니다.");
  }
   
  public void print() {
    System.out.println("Mobile class 객체 print()");
  }
  
}
 
class Card implements Payment {
  @Override
  public void pay() {
    System.out.println("신용카드 결재를 합니다.");
  }
     
}
 
public class InterTest {
  public static void main(String[] args) {
    //인터페이스는 객체를 만들 수 없다.
    //Payment payment = new Payment(); // Cannot instantiate the type Payment
    
    Payment payment = new Cash(); // Interface에 있는 메소드만 호출 가능
    payment.pay(); // 구현(implements)된 자식 클래스의 메소드 호출
    // payment.print(); // 구현된 자식의 고유 메소드는 호출하지 못한다.
    
    Cash cash = (Cash) payment;
    cash.pay();
    cash.print(); // 자식 타입으로 형변환 하면, 자식의 고유 메소드도 다 호출할 수 있다.
   
    System.out.println("-----------------------------------------------------");
    
    // Payment 타입으로 Mobile 클래스의 객체를 생성
    Payment payment2 = new Mobile();
    payment2.pay();
    
    Mobile mobile = (Mobile) payment2;
    mobile.pay();
    mobile.print();
    
    System.out.println("-----------------------------------------------------");
    // Payment 타입으로 Card 클래스의 객체를 생성
    Payment payment3 = new Card();
    payment3.pay();
    
    System.out.println("-----------------------------------------------------");
    Card card = new Card();
    card.pay();
  }
}