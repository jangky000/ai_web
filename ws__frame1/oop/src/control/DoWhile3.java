package control;
 
public class DoWhile3 {
 
  // 1���� 100������ �����߿��� ¦���� Ȧ���� ������ ����ϴ�
  // ���α׷��� �����ϼ���. 
  public static void main(String[] args) {
    int su = 0;
    int odd_count = 0;
    int even_count = 0;
    
    while(su < 100)
    {
      su++;
      if(su%2 != 0) {
        odd_count++;
      }
      else {
        even_count++;
      }
    }
    
    System.out.println("¦��: " + even_count);
    System.out.println("Ȧ��: " + odd_count);
  }
 
}