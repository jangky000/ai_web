
public class IfExam10_1 {

  public static void main(String[] args) {
    String country = args[0];
    int number = Integer.parseInt(args[1]);
    
    int price = 0;
    int total = 0;
    
    if(number < 1 || number > 30) {
      System.out.println("��û������ �ο��� 1 ~ 30������Դϴ�.");
    }
    
    if(country.equals("ȣ��")) {
      price = 600000;
    } else if(country.equals("�±�")) {
      price = 400000;
    } else if(country.equals("�븸")) {
      price = 500000;
    }
    
    total = price*number;
    
    System.out.println("����: " + country);
    System.out.println("����: " + number + "�� " + (price*number) + " ��");
    System.out.println("-------------------------------");
    System.out.println("���� �ݾ�: " + total + "��");

  }

}
