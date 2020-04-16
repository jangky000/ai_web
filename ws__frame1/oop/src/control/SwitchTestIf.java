package control;
public class SwitchTestIf {
 
  public static void main(String[] args) {
    int month = 1;
    
    if(month == 1) {
      System.out.println("1월 January");
    } else if(month == 2) {
      System.out.println("2월 February");
    } else if(month == 3) {
      System.out.println("3월 March");
    } else {
      System.out.println("1/4 분기만 가능합니다.");
    }
    
    System.out.println("switch문 실행 종료");
    
  }
 
}