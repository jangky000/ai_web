package oop2;
 
class Book2{
  public void print(){
    System.out.println("인문 고전 책을 주문합니다.");
  }
}
 
class Java extends Book2{
  // 상속 무시되고 호출됨. @: annotation, 부가적인 기능 정의, 바로 아래에 있는 메소드까지만 유효
  @Override 
  public void print(){
    System.out.println("JAVA 책을 주문합니다.");
  }
}
 
public class InheTest3 {
 
  public static void main(String[] args) {
    Java java = new Java();
    java.print();
 
    Book2 book = new Book2();
    book.print();
 
  }
 
}