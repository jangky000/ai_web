package pilot.proxy;
 
public class DomesticProxy implements Trip {
  // Domestic 객체 선언
  Domestic domestic = null;
  
  public DomesticProxy() {
    // Domestic 객체 생성
    domestic = new Domestic();
  }
 
  @Override
  public void start() {
    System.out.println(); // 기능 추가
    System.out.println("출발 안내 - 집합장소"); // 기능 추가
    this.domestic.start();
    
  }
 
  @Override
  public void destination() {
    System.out.println(); // 기능 추가
    System.out.println("준비물 안내"); // 기능 추가
    System.out.println("복장: 등산 복장, 등산화(스틱), 회비: 무료"); // 기능 추가
    this.domestic.destination();
 
  }
 
  @Override
  public void end() {
    System.out.println(); // 기능 추가
    System.out.println("뒷풀이 안내"); // 기능 추가
    System.out.println("회식: 오겹살, 순대 볶음 기타"); // 기능 추가
    this.domestic.end();    
  }
 
}