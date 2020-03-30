package oop4;
 
public class AbsTest {
 
  public static void main(String[] args) {
    //�߻� Ŭ������ ��ü ���� �Ұ�(can't instantiate)
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
    
    //��ü ����
//    Payment payment = null;
 // �߻� Ŭ������ ��� ���� �ڽ� Ŭ���� ��ü ���� ����, ��� �����̹Ƿ�
//    payment = new Pay2015(); 
    Payment payment = new Pay2015(); // �θ� Ŭ����(�߻�) <- �ڽ� Ŭ����(�߻� �޼ҵ� ����)
    payment.cach(); // Payment Ÿ��������, �ڽ� Ŭ������ �޼ҵ尡 ����, �޸� �󿡴� pay2015�� �ö󰡹Ƿ�
    payment.card();
    payment.mobile();
    //instanceof ~�� �ڽ����� Ȯ���ϴ� ������
    System.out.println(payment instanceof Pay2017); // false
    System.out.println("-----------------------------------");
    
    payment = new Pay2016(); // �߻� Ŭ������ ��� ���� �ڽ� Ŭ���� ��ü ���� ����, ��� �����̹Ƿ�
    payment.cach(); // Payment Ÿ��������, �ڽ� Ŭ������ �޼ҵ尡 ����, �޸� �󿡴� pay2015�� �ö󰡹Ƿ�
    payment.card();
    payment.mobile();
    System.out.println(payment instanceof Pay2017); // false
    System.out.println("-----------------------------------");
    
    payment = new Pay2017(); // �߻� Ŭ������ ��� ���� �ڽ� Ŭ���� ��ü ���� ����, ��� �����̹Ƿ�
    payment.cach(); // Payment Ÿ��������, �ڽ� Ŭ������ �޼ҵ尡 ����, �޸� �󿡴� pay2015�� �ö󰡹Ƿ�
    payment.card();
    payment.mobile();
    System.out.println(payment instanceof Pay2017); // true
    System.out.println("-----------------------------------");
    
  }
  
}
 