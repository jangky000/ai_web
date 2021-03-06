package pilot.proxy;
 
public class TripMain2 {
  public static void main(String[] args) {
    // Foreign 객체를 생성하여 메소드 호출, 다형성 구현
    Trip trip = new Foreign();
    trip.start();
    trip.destination();
    trip.end();
    
    System.out.println("-----------------------------------------");    
    // ForeignProxy 객체를 생성하여 메소드 호출, 다형성 구현
    trip = new ForeignProxy();
    trip.start();
    trip.destination();
    trip.end();
  }
 
}  