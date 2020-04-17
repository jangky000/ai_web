
public class IfExam10_1 {

  public static void main(String[] args) {
    String country = args[0];
    int number = Integer.parseInt(args[1]);
    
    int price = 0;
    int total = 0;
    
    if(number < 1 || number > 30) {
      System.out.println("신청가능한 인원은 1 ~ 30명까지입니다.");
    }
    
    if(country.equals("호주")) {
      price = 600000;
    } else if(country.equals("태국")) {
      price = 400000;
    } else if(country.equals("대만")) {
      price = 500000;
    }
    
    total = price*number;
    
    System.out.println("국가: " + country);
    System.out.println("대인: " + number + "명 " + (price*number) + " 원");
    System.out.println("-------------------------------");
    System.out.println("결제 금액: " + total + "원");

  }

}
