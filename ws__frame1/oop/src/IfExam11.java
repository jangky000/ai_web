
public class IfExam11 {

  public static void main(String[] args) {
    //args
    String country = args[0];
    int old = Integer.parseInt(args[1]);
    int young = Integer.parseInt(args[2]);
    
    //variables
    int per_old=0;
    int per_young=0;
    int old_price = 0;
    int young_price = 0;
    int total = 0;
    
    //exit
    if(old + young < 1 || old + young > 30) {
      System.out.println("��û������ �ο��� 1 ~ 30������Դϴ�");
      return; // �����α׷��� �� ���� return ����ϸ� �� ȭ�� ��� ������ ������� ����
    }
    
    //country & price
    if(country.equals("ȣ��")) {
      per_old = 600000;
      per_young = 500000;
    } else if(country.equals("�±�")) {
      per_old = 400000;
      per_young = 300000;
    } else if(country.equals("�븸")) {
      per_old = 500000;
      per_young = 400000;
    }
    
    //calculation
    old_price = per_old*old;
    young_price = per_young*young;
    total = old_price + young_price;
    
    //print
    System.out.println("����: " + country);
    System.out.println("����: " + old + "�� " + old_price + " ��");
    System.out.println("����: " + young + "�� " + young_price + " ��");
    System.out.println("-------------------------------");
    System.out.println("���� �ݾ�: " + total + "��");

  }

}
