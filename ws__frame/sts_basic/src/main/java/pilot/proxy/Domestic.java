package pilot.proxy;
 
public class Domestic implements Trip {
 
  @Override
  public void start() {
    System.out.println("2016�� 5�� 5�� ���￪ ����");
  }
 
  @Override
  public void destination() {
    System.out.println("1��2�� ���ǻ�");
 
  }
 
  @Override
  public void end() {
    System.out.println("2016�� 5�� 6�� ��꿪 �ػ�");
 
  }
 
}