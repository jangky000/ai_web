package pilot.proxy;
 
public class Domestic implements Trip {
 
  @Override
  public void start() {
    System.out.println("2016년 5월 5일 서울역 집합");
  }
 
  @Override
  public void destination() {
    System.out.println("1박2일 설악산");
 
  }
 
  @Override
  public void end() {
    System.out.println("2016년 5월 6일 용산역 해산");
 
  }
 
}