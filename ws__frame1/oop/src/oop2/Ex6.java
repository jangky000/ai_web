package oop2;
 
public class Ex6 {
  public void calc1(int tot, int cnt) {
    int avg = tot / cnt;
    
    System.out.println("avg: " + avg);
  }
  
  // ���� �޼ҵ忡�� ���ܸ� ó�������ʰ�,
  // ���� �߻��� ȣ���� ������ ����
  public void calc2(int tot, int cnt) throws Exception {
    int avg = tot / cnt;
    
    System.out.println("avg: " + avg);
  }
}
 