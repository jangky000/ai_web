package pilot.proxy;
 
public class ForeignProxy implements Trip {
  // Foreign ��ü ����
  Foreign foreign = null;
  
  public ForeignProxy() {
    // Foreign ��ü ����
    foreign = new Foreign();
  }
 
  @Override
  public void start() {
    System.out.println();
    System.out.println("��� �ȳ�");
    this.foreign.start();
  }
 
  @Override
  public void destination() {
    System.out.println();
    System.out.println("�غ� �ȳ�");
    System.out.println("����: ��� ����, ���ȭ(�ȭ), ȸ��: ����");
    this.foreign.destination();
  }
 
  @Override
  public void end() {
    System.out.println();
    System.out.println("��Ǯ�� �ȳ�");
    System.out.println("ȸ��: �δ��, ��Ÿ");
    this.foreign.end();
  }
 
}