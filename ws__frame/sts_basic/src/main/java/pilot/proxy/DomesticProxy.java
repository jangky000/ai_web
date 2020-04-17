package pilot.proxy;
 
public class DomesticProxy implements Trip {
  // Domestic ��ü ����
  Domestic domestic = null;
  
  public DomesticProxy() {
    // Domestic ��ü ����
    domestic = new Domestic();
  }
 
  @Override
  public void start() {
    System.out.println(); // ��� �߰�
    System.out.println("��� �ȳ� - �������"); // ��� �߰�
    this.domestic.start();
    
  }
 
  @Override
  public void destination() {
    System.out.println(); // ��� �߰�
    System.out.println("�غ� �ȳ�"); // ��� �߰�
    System.out.println("����: ��� ����, ���ȭ(��ƽ), ȸ��: ����"); // ��� �߰�
    this.domestic.destination();
 
  }
 
  @Override
  public void end() {
    System.out.println(); // ��� �߰�
    System.out.println("��Ǯ�� �ȳ�"); // ��� �߰�
    System.out.println("ȸ��: �����, ���� ���� ��Ÿ"); // ��� �߰�
    this.domestic.end();    
  }
 
}