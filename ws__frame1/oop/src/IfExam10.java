
public class IfExam10 {

  public static void main(String[] args) {
    String country = args[0];
    int number = Integer.parseInt(args[1]);
    
    int price = 0;
    int total = 0;
    
    if(country.equals("ȣ��")) {
      price = 600000;
    } else if(country.equals("�±�")) {
      price = 400000;
    } else if(country.equals("�븸")) {
      price = 500000;
    }
    
//    ���ڿ��� switch�� ��� ����
//    switch(country) {
//      case "ȣ��":
//        price = 600000;
//        break;
//      case "�±�":
//        price = 400000;
//        break;
//      case "�븸":
//        price = 500000;
//        break;
//      default:
//        break;
//    }
    
    total = price*number;
    
    System.out.println("����: " + country);
    System.out.println("����: " + number + "�� " + (price*number) + " ��");
    System.out.println("-------------------------------");
    System.out.println("���� �ݾ�: " + total + "��");
  }

}
