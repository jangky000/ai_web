package oop3;
 
public class DataProcess {
  public DataProcess() {
    
  }
  public void swap(Data data) {
    // ������ Ŭ������ �ؽ��ڵ�(��ü)�� ���� ����, �ؽ��ڵ尡 �����ϴ�
    // �޸𸮸� �����Ѵ� -> �޸� ����
    System.out.println("3) " + data.hashCode());
    
    int tmp = data.su1;
    data.su1 = data.su2;
    data.su2 = tmp;
  }
}