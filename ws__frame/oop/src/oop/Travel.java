package oop;
 
public class Travel {
  String area = "û���";
  
  public void trip1() {
    System.out.println("1) ���� ����: " + area);
  }
  
  public void  trip2() {
    String area = "����";
    System.out.println("2) ���� ����: " + area);
  }
  
  public void trip3(){
    String area = "����";
    System.out.println("3) ���� / ���� ����: " + area + " / " + this.area);
  }
  
  public void trip4(String area) {
    System.out.println("4) ���� ����: " + area);
  }
  
  public void trip5(String area) {
    this.area = area; //  �������� <- ��������
  }
  
  //�޼ҵ� ���� ���� ������ ���� �� this�� ������� �ʾƵ� �������� ����
  public void trip6() {
    System.out.println("6) ��������: " + area);
  }
  
}