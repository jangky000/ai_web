package control;
 
public class DoWhile4 {
 
  // 1���� 100������ �����߿��� ¦���� Ȧ���� ���� ����ϴ� ���α׷��� �����ϼ���.
  public static void main(String[] args) {
    int su = 0;
    int odd_total = 0;
    int even_total = 0;
    
    do {
      su = su+1;
      
      if(su%2 == 0) {
        even_total += su;
      } else {
        odd_total += su;
      }
      
      if(su == 100) {
        break;
      }
    }while(true);
    
    System.out.println("¦��: " + even_total);
    System.out.println("Ȧ��: " + odd_total);
  }
 
}