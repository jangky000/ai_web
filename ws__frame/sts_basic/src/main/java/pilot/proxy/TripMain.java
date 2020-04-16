package pilot.proxy;
 
public class TripMain {
 
  public static void main(String[] args) {
    // Domestic ��ü�� �����Ͽ� �޼ҵ� ȣ��, ������ ����
    Trip trip = new Domestic();
    trip.start();
    trip.destination();
    trip.end();
    
    System.out.println("------------------------------------");
    // DomesticProxy ��ü�� �����Ͽ� �޼ҵ� ȣ��, ������ ����
    trip = new DomesticProxy();
    trip.start();
    trip.destination();
    trip.end();
    
  }
 
}