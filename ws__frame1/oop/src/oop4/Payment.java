package oop4;
 
public abstract class Payment { //�߻� Ŭ����
  public void cach() {
    System.out.println("���� ����");
  }
  
  public abstract void card();    // �߻� �޼ҵ�, ��ü�� ����
  public abstract void mobile();  // �߻� �޼ҵ�
}
 