package oop2;
 
public class Ex1 {
 
  public static void main(String[] args) {
    int tot = Integer.parseInt(args[0]);
    int cnt = Integer.parseInt(args[1]);
    
    int avg = tot / cnt;
    
    System.out.println("총점: " + tot);
    System.out.println("과목수: " + cnt);
    System.out.println("평균: " + avg);
 
    System.out.println("진행을 계속합니다.");
    avg =avg + 10;
    System.out.println("평균 추가 점수 부여: " + avg);
 
  }
 
}