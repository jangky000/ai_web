package control;
 
public class DoWhile1 {
 
  public static void main(String[] args) {
    int avg = -60;
    
    do {
      System.out.println("평균: " + avg);
    } while(avg >= 0); // 양수만 처리
 
  }
 
}