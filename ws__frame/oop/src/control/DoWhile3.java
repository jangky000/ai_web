package control;
 
public class DoWhile3 {
 
  // 1부터 100까지의 정수중에서 짝수와 홀수의 갯수를 출력하는
  // 프로그램을 제작하세요. 
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
    
    System.out.println("짝수: " + even_count);
    System.out.println("홀수: " + odd_count);
  }
 
}