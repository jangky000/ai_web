package beans;

// VO: value object, 변수 객체
public class SungjukVO {
  //필드는 private로 선언한다.
  private String name;
  private int tot;
  private int avg;
  
  public void setName(String name) {
    this.name = name;
  }
  
  public void setTot(int tot) {
    this.tot = tot;
  }
  
  public void setAvg(int avg) {
    this.avg = avg;
  }
  
  public String getName() {
    return this.name;
  }
  
  public int getTot() {
    return this.tot;
  }
  
  public int getAvg() {
    return this.avg;
  }
}
