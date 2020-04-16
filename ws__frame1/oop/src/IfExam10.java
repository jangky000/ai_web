
public class IfExam10 {

  public static void main(String[] args) {
    String country = args[0];
    int number = Integer.parseInt(args[1]);
    
    int price = 0;
    int total = 0;
    
    if(country.equals("호주")) {
      price = 600000;
    } else if(country.equals("태국")) {
      price = 400000;
    } else if(country.equals("대만")) {
      price = 500000;
    }
    
//    문자열도 switch문 사용 가능
//    switch(country) {
//      case "호주":
//        price = 600000;
//        break;
//      case "태국":
//        price = 400000;
//        break;
//      case "대만":
//        price = 500000;
//        break;
//      default:
//        break;
//    }
    
    total = price*number;
    
    System.out.println("국가: " + country);
    System.out.println("대인: " + number + "명 " + (price*number) + " 원");
    System.out.println("-------------------------------");
    System.out.println("결제 금액: " + total + "원");
  }

}
