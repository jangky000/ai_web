
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
      System.out.println("신청가능한 인원은 1 ~ 30명까지입니다");
      return; // 웹프로그래밍 할 때는 return 사용하면 빈 화면 출력 때문에 사용하지 않음
    }
    
    //country & price
    if(country.equals("호주")) {
      per_old = 600000;
      per_young = 500000;
    } else if(country.equals("태국")) {
      per_old = 400000;
      per_young = 300000;
    } else if(country.equals("대만")) {
      per_old = 500000;
      per_young = 400000;
    }
    
    //calculation
    old_price = per_old*old;
    young_price = per_young*young;
    total = old_price + young_price;
    
    //print
    System.out.println("국가: " + country);
    System.out.println("대인: " + old + "명 " + old_price + " 원");
    System.out.println("소인: " + young + "명 " + young_price + " 원");
    System.out.println("-------------------------------");
    System.out.println("결제 금액: " + total + "원");

  }

}
