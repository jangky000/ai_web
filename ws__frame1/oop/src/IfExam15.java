
public class IfExam15 {

  public static void main(String[] args) {
    //args
    String book_name = args[0];
    int per_book = Integer.parseInt(args[1]);
    int quantity = Integer.parseInt(args[2]);
    
    //variables
    int sum_price = 0;
    int shipping_fee = 2500;
    int point = 0;
    int total = 0;
    
    //is fee?
    if(sum_price >= 20000) {
      shipping_fee = 0;
    }
    
    //calculation
    sum_price = per_book * quantity;
    point = (int)(sum_price * 0.05);
    total = sum_price + shipping_fee;
    
    //print
    System.out.println("������: " + book_name + " | ����: " + per_book + " �� | ����: " + quantity + " ��");
    System.out.println("��ۺ�: " + shipping_fee + " ��");
    System.out.println("-------------------------------------------------------");
    System.out.println("���� ����: " + sum_price + "(����Ʈ: " + point + "��)");
    System.out.println("���� �ݾ�: " + total + " ��");
  }
}
