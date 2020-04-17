package test;
 
interface Payment {
  public abstract void pay(); // �߻� �޼ҵ�
  
}
 
class Cash implements Payment {
  @Override// �߻�޼ҵ� ����
  public void pay() {
    System.out.println("���� ���縦 �մϴ�.");
  }
   
  public void print() {
    System.out.println("Cash class ��ü print()");
  }
  
}
 
class Mobile implements Payment {
  @Override
  public void pay() {
    System.out.println("����Ʈ�� ���縦 �մϴ�.");
  }
   
  public void print() {
    System.out.println("Mobile class ��ü print()");
  }
  
}
 
class Card implements Payment {
  @Override
  public void pay() {
    System.out.println("�ſ�ī�� ���縦 �մϴ�.");
  }
     
}
 
public class InterTest {
  public static void main(String[] args) {
    //�������̽��� ��ü�� ���� �� ����.
    //Payment payment = new Payment(); // Cannot instantiate the type Payment
    
    Payment payment = new Cash(); // Interface�� �ִ� �޼ҵ常 ȣ�� ����
    payment.pay(); // ����(implements)�� �ڽ� Ŭ������ �޼ҵ� ȣ��
    // payment.print(); // ������ �ڽ��� ���� �޼ҵ�� ȣ������ ���Ѵ�.
    
    Cash cash = (Cash) payment;
    cash.pay();
    cash.print(); // �ڽ� Ÿ������ ����ȯ �ϸ�, �ڽ��� ���� �޼ҵ嵵 �� ȣ���� �� �ִ�.
   
    System.out.println("-----------------------------------------------------");
    
    // Payment Ÿ������ Mobile Ŭ������ ��ü�� ����
    Payment payment2 = new Mobile();
    payment2.pay();
    
    Mobile mobile = (Mobile) payment2;
    mobile.pay();
    mobile.print();
    
    System.out.println("-----------------------------------------------------");
    // Payment Ÿ������ Card Ŭ������ ��ü�� ����
    Payment payment3 = new Card();
    payment3.pay();
    
    System.out.println("-----------------------------------------------------");
    Card card = new Card();
    card.pay();
  }
}