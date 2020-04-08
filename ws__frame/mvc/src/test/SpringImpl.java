package test;

public class SpringImpl implements SeasonInter{
  @Override// 추상메소드 구현
  public void season() {
    System.out.println("child season!");
  }
  
  public void spring() {
    System.out.println("child spring!");
  }

}
