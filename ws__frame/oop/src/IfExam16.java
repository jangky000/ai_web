
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
      type_name = "캠핑";
      type_price = 40000;
    } else if(type == 2) {
      type_name = "펜션식 방";
      type_price = 150000;
    }
    
    //how pay
    if(how_pay_code == 1) {
      how_pay = "신용카드";
    } else if(how_pay_code == 2) {
      how_pay = "계좌이체(현금)";
    } else if(how_pay_code == 3) {
      how_pay = "모바일 결제";
    } else if(how_pay_code == 4) {
      how_pay = "포인트 결제";
    }
    
    //calculation
    extra_fee = per_extra * extra_people;
    total = type_price + extra_fee;
    point = (int)(total * 0.07);
    
    //print
    System.out.println("캠핑장 예약 내역");
    System.out.println("유형: " + type_name + " | 가격: " + type_price + " 원");
    System.out.println("추가 인원: " + extra_people + " 명 | 금액: " + extra_fee + " 원");
    System.out.println("-------------------------------------------------------");
    System.out.println("결제 방법: " + how_pay);
    System.out.println("결제 금액: " + total + " (포인트: " + point +" 원)");
  }

}
