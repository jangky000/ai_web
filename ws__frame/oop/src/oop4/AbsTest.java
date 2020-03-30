package oop4;
 
public class AbsTest {
 
  public static void main(String[] args) {
    //추상 클래스의 객체 생성 불가(can't instantiate)
    // Payment payment = new Payment();
    
    Pay2015 pay2015 = new Pay2015();
    pay2015.cach();
    pay2015.card();
    pay2015.mobile();
    System.out.println("-----------------------------------");
    //pay2015 = new Pay2016(); // Type mismatch: cannot convert from Pay2016 to Pay2015
    
    Pay2016 pay2016 = new Pay2016();
    pay2016.cach();
    pay2016.card();
    pay2016.mobile();
    System.out.println("-----------------------------------");
    
    Pay2017 pay2017 = new Pay2017();
    pay2017.cach();
    pay2017.card();
    pay2017.mobile();
    System.out.println("-----------------------------------");
    
    //객체 선언
//    Payment payment = null;
 // 추상 클래스를 상속 받은 자식 클래스 객체 생성 가능, 상속 관계이므로
//    payment = new Pay2015(); 
    Payment payment = new Pay2015(); // 부모 클래스(추상) <- 자식 클래스(추상 메소드 구현)
    payment.cach(); // Payment 타입이지만, 자식 클래스의 메소드가 실행, 메모리 상에는 pay2015가 올라가므로
    payment.card();
    payment.mobile();
    //instanceof ~의 자식인지 확인하는 연산자
    System.out.println(payment instanceof Pay2017); // false
    System.out.println("-----------------------------------");
    
    payment = new Pay2016(); // 추상 클래스를 상속 받은 자식 클래스 객체 생성 가능, 상속 관계이므로
    payment.cach(); // Payment 타입이지만, 자식 클래스의 메소드가 실행, 메모리 상에는 pay2015가 올라가므로
    payment.card();
    payment.mobile();
    System.out.println(payment instanceof Pay2017); // false
    System.out.println("-----------------------------------");
    
    payment = new Pay2017(); // 추상 클래스를 상속 받은 자식 클래스 객체 생성 가능, 상속 관계이므로
    payment.cach(); // Payment 타입이지만, 자식 클래스의 메소드가 실행, 메모리 상에는 pay2015가 올라가므로
    payment.card();
    payment.mobile();
    System.out.println(payment instanceof Pay2017); // true
    System.out.println("-----------------------------------");
    
  }
  
}
 