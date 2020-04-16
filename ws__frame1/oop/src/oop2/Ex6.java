package oop2;
 
public class Ex6 {
  public void calc1(int tot, int cnt) {
    int avg = tot / cnt;
    
    System.out.println("avg: " + avg);
  }
  
  // 현재 메소드에서 예외를 처리하지않고,
  // 예외 발생시 호출한 쪽으로 전달
  public void calc2(int tot, int cnt) throws Exception {
    int avg = tot / cnt;
    
    System.out.println("avg: " + avg);
  }
}
 