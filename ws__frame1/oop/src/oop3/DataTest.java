package oop3;
 
public class DataTest {
 
  public static void main(String[] args) {
    Data data = new Data(2019, 2017);
    
    // object Ŭ�������� ��� ���� �޼ҵ�, hashCode�� ȣ��
    // F3�� ���� �ڼ��� ���� native��� ��ð� �ִµ� �̰� c�� ������� ����� ȣ���� �� ��� -> ���� ������ ����
    System.out.println("1) "+data.hashCode());
    System.out.println("2) "+data.su1 + " / " + data.su2);
    
    DataProcess dp = new DataProcess();
    // ��ü�� ����
    dp.swap(data);
    
    System.out.println("4) " +data.su1 + " / " + data.su2);
  }
 
}