package oop4;
 
class Final{
  // 1) ��ü �����ؾ� ��� ����, �� ���� ����, ���� ���� ���, instance ����
  private String normal = "���� ��ǳ ���� ����"; 
  
  // 2) ��ü ���� ���ص� ��� ����, �� ���� ����, ���� ���, ���� ����
  public static int COUNT = 0;   
  
  // 3) ��ü �����ؾ� ��� ����, ���� �� ���� �Ұ���, ��� ���� 
  public final String com = "(��)�ູ �����";
 
  // 4) ��ü ���� ���ص� ��� ����, ���� �� ���� �Ұ���, ��� ����, ���� ���� ����
  // public static final String TEL = "�� 02-1111-1111";  
  public final static String TEL = "�� 02-1111-1111";
  
  // private ������ �� ����
  public String getNormal(){
    return this.normal;
  }
  
  // private ������ �� ����
  public void setNormal(String normal) {
    this.normal = normal;
  }
}
 
public class FinalTest {
  public static void main(String[] args) {
    Final obj = new Final();
    
    // System.out.println("����: " + obj.normal); // ERROR
    
    System.out.println("����: " + obj.getNormal());   // ���� ��ǳ ���� ����
    
    obj.setNormal("���� Ʃ�︳ ����");
    System.out.println("����: " + obj.getNormal());   // ���� Ʃ�︳ ����
    
    Final.COUNT++; // static ����
    System.out.println("���� �ο�: " + Final.COUNT);  // 1
    
    // obj.com = "(��)����"; // final ���� ���� �Ҵ�� �� ���� �Ұ���
    System.out.println("�����: " + obj.com);  // (��)�ູ �����
    
    // Final.TEL = "123"; // final static �����̸� �� ���� �Ұ��� 
    System.out.println("����ó: " + Final.TEL); // �� 02-1111-1111
  }
 
}