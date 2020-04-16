package oop2;

public class Ex4 {

  public static void main(String[] args) {
    int tot = 260;
    int avg = 0;
    
    try {
      avg = tot / 0;
    } catch (Exception e) {
      System.out.println("예외 발생");
    } finally {
      System.out.println("계속 처리 진행");
      System.out.println("입력값: " + tot + " 평균: " + avg);
    }

  }

}
