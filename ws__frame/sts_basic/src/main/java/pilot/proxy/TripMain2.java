package pilot.proxy;
 
public class TripMain2 {
  public static void main(String[] args) {
    // Foreign ��ü�� �����Ͽ� �޼ҵ� ȣ��, ������ ����
    Trip trip = new Foreign();
    trip.start();
    trip.destination();
    trip.end();
    
    System.out.println("-----------------------------------------");    
    // ForeignProxy ��ü�� �����Ͽ� �޼ҵ� ȣ��, ������ ����
    trip = new ForeignProxy();
    trip.start();
    trip.destination();
    trip.end();
  }
 
}  