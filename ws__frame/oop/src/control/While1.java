package control;
 
public class While1 {
 
  public static void main(String[] args) {
    // int형 변수 su 선언
    int su = 0;
    
    while(true) {
      su++;
      System.out.println(su);
      if(su == 5) {
        break;
      }
    }
    
    
    su = 0; // 초기화
    System.out.println("-----");
    while(su <= 4) {
      su = su + 1;
      System.out.println(su);
    }
    
  }
}