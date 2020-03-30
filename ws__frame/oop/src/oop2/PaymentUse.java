package oop2;

public class PaymentUse {
  public static void main(String[] args) {
    Cash cash = new Cash();
    cash.order("Â¥Àå¸é", 5000, 2);
    cash.calc();
    cash.cash();
    System.out.println("----------------------------");
    
    Card card = new Card();
    card.order("»ï°ã»ì", 13000, 5);
    card.calc();
    card.card();
    System.out.println("----------------------------");
    
    Mobile mobile = new Mobile();
    mobile.order("¶óººÀÌ", 5000, 2);
    mobile.calc();
    mobile.mobile();
    System.out.println("----------------------------");
    
    Point point = new Point();
    point.order("¾Æ¸Þ¸®Ä«³ë", 2000, 3);
    point.calc();
    point.point();
    System.out.println("----------------------------");
  } 
}