package pilot.proxy;
 
public class Foreign implements Trip {
 
  @Override
  public void start() {
    System.out.println("2016�� 5�� 5�� ��õ���� ����");
 
  }
 
  @Override
  public void destination() {
    System.out.println("2��3�� ȫ��");
  }
 
  @Override
  public void end() {
    System.out.println("2016�� 5�� 7�� ���￪ �ػ�");
 
  }
 
}