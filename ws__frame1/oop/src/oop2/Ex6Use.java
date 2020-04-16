package oop2;
 
public class Ex6Use {
 
  public static void main(String[] args) {
    Ex6 ex6 = new Ex6();
    
    //Type 1
    //-----------------------------------------------------
    //ex6.calc1(210,  0);
    //-----------------------------------------------------
    
    //Type 2
    //-----------------------------------------------------
/*    try {
      // try 문에서 메소드를 호출하면 throws가 없어도
      // 자동으로 예외가 전달되어 잡힘.
      ex6.calc1(210,  0);
    } catch (Exception e) {
      System.out.println("▶ Ex6Use에서 예외 잡음.");
      e.printStackTrace();
    }
    System.out.println("나머지 루틴 정상 실행");*/
    //-----------------------------------------------------
    
    //Type 2
    //-----------------------------------------------------
    try {
      ex6.calc2(230,  0);
    } catch (Exception e) {
      System.out.println("▷ Ex6Use에서 예외 잡음.");
      e.printStackTrace();
    }
    System.out.println("나머지 루틴 정상 실행");
    System.out.println("----------------------------------------------");
    //-----------------------------------------------------
  }
 
}
 
 