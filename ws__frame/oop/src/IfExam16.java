
public class IfExam16 {

  public static void main(String[] args) {
    //args
    int type = Integer.parseInt(args[0]);
    int extra_people = Integer.parseInt(args[1]);
    int how_pay_code = Integer.parseInt(args[2]);
    
    //variables
    String type_name = "";
    String how_pay = "";
    int type_price = 0;
    int per_extra = 5000;
    int extra_fee = 0;
    int point = 0;
    int total = 0;
    
    //type
    if(type == 1) {
      type_name = "ķ��";
      type_price = 40000;
    } else if(type == 2) {
      type_name = "��ǽ� ��";
      type_price = 150000;
    }
    
    //how pay
    if(how_pay_code == 1) {
      how_pay = "�ſ�ī��";
    } else if(how_pay_code == 2) {
      how_pay = "������ü(����)";
    } else if(how_pay_code == 3) {
      how_pay = "����� ����";
    } else if(how_pay_code == 4) {
      how_pay = "����Ʈ ����";
    }
    
    //calculation
    extra_fee = per_extra * extra_people;
    total = type_price + extra_fee;
    point = (int)(total * 0.07);
    
    //print
    System.out.println("ķ���� ���� ����");
    System.out.println("����: " + type_name + " | ����: " + type_price + " ��");
    System.out.println("�߰� �ο�: " + extra_people + " �� | �ݾ�: " + extra_fee + " ��");
    System.out.println("-------------------------------------------------------");
    System.out.println("���� ���: " + how_pay);
    System.out.println("���� �ݾ�: " + total + " (����Ʈ: " + point +" ��)");
  }

}
