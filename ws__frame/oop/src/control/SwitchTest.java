package control;
public class SwitchTest {
 
  public static void main(String[] args) {
    int month = 1;
    
    switch(month) {
    case 1:
      System.out.println("1월 January");
      break;
    case 2:
      System.out.println("2월 February");
      break;
    case 3:
      System.out.println("3월 March");
      break;
    default:
      System.out.println("1/4 분기만 가능합니다.");
    }
    
    System.out.println("switch문 실행 종료");
    
  }
 
}