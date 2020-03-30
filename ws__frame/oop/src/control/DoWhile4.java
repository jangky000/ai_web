package control;
 
public class DoWhile4 {
 
  // 1부터 100까지의 정수중에서 짝수와 홀수의 합을 출력하는 프로그램을 제작하세요.
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
    
    System.out.println("짝수: " + even_total);
    System.out.println("홀수: " + odd_total);
  }
 
}