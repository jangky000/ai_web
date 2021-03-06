package pilot.proxy;
 
public class ForeignProxy implements Trip {
  // Foreign 객체 선언
  Foreign foreign = null;
  
  public ForeignProxy() {
    // Foreign 객체 생성
    foreign = new Foreign();
  }
 
  @Override
  public void start() {
    System.out.println();
    System.out.println("출발 안내");
    this.foreign.start();
  }
 
  @Override
  public void destination() {
    System.out.println();
    System.out.println("준비물 안내");
    System.out.println("복장: 등산 복장, 등산화(운동화), 회비: 무료");
    this.foreign.destination();
  }
 
  @Override
  public void end() {
    System.out.println();
    System.out.println("뒷풀이 안내");
    System.out.println("회식: 부대찌개, 기타");
    this.foreign.end();
  }
 
}