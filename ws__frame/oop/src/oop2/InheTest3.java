package oop2;
 
class Book2{
  public void print(){
    System.out.println("�ι� ���� å�� �ֹ��մϴ�.");
  }
}
 
class Java extends Book2{
  // ��� ���õǰ� ȣ���. @: annotation, �ΰ����� ��� ����, �ٷ� �Ʒ��� �ִ� �޼ҵ������ ��ȿ
  @Override 
  public void print(){
    System.out.println("JAVA å�� �ֹ��մϴ�.");
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