
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
    System.out.println("도서명: " + book_name + " | 가격: " + per_book + " 원 | 수량: " + quantity + " 권");
    System.out.println("배송비: " + shipping_fee + " 원");
    System.out.println("-------------------------------------------------------");
    System.out.println("도서 가격: " + sum_price + "(포인트: " + point + "원)");
    System.out.println("결제 금액: " + total + " 원");
  }
}
