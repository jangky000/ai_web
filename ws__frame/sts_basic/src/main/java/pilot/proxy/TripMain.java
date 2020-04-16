package pilot.proxy;
 
public class TripMain {
 
  public static void main(String[] args) {
    // Domestic 객체를 생성하여 메소드 호출, 다형성 구현
    Trip trip = new Domestic();
    trip.start();
    trip.destination();
    trip.end();
    
    System.out.println("------------------------------------");
    // DomesticProxy 객체를 생성하여 메소드 호출, 다형성 구현
    trip = new DomesticProxy();
    trip.start();
    trip.destination();
    trip.end();
    
  }
 
}