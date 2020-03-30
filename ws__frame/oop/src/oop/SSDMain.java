package oop;
 
public class SSDMain {
 
  public static void main(String[] args) {
    // ssd ��ü ����(SSD.java ������Ʈ���� ������ ���)
    SSD ssd = new SSD(); 
    System.out.println(ssd.hashCode()); // .: ��� ������
    // 2018699554
    System.out.println(ssd.name);
    System.out.println(ssd.price + " ��");
    System.out.println(ssd.dc + " ��");
    System.out.println(ssd.count + " ��");
    
    System.out.println("-------------------");
    ssd.name = "256 GB"; // ssd ��ü�� �Ҵ� ���� �޸��� name������ ���ڿ� ����
    ssd.price = 70000;
    ssd.dc = ssd.price - 5000;
    ssd.count = 2;
 
    System.out.println(ssd.name);
    System.out.println(ssd.price + " ��");
    System.out.println(ssd.dc + " ��");
    System.out.println(ssd.count + " ��");
  }
 
}