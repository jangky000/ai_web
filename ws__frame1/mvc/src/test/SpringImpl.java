package test;

public class SpringImpl implements SeasonInter{
  @Override// �߻�޼ҵ� ����
  public void season() {
    System.out.println("child season!");
  }
  
  public void spring() {
    System.out.println("child spring!");
  }

}
