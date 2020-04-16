package pilot.proxy;
 
public class Foreign implements Trip {
 
  @Override
  public void start() {
    System.out.println("2016년 5월 5일 인천공항 집합");
 
  }
 
  @Override
  public void destination() {
    System.out.println("2박3일 홍콩");
  }
 
  @Override
  public void end() {
    System.out.println("2016년 5월 7일 서울역 해산");
 
  }
 
}