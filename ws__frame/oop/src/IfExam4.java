
public class IfExam4 {

  public static void main(String[] args) {
    int num = Integer.parseInt(args[0]);
    System.out.println("월: " + num);
    
    if(num >=3 && num <= 5) System.out.println("통영");
    else if(num >=6 && num <= 8) System.out.println("미시령 옛길 드라이브");
    else if(num >=9 && num <= 11) {
      if(num == 9) System.out.println("설악산");
      else if(num == 10) System.out.println("삼양 목장");
      else if(num == 11) System.out.println("내장산 단풍");
    }else if(num <= 2 || num == 12) System.out.println("한계령 눈 드라이브");
    // syso를 적게 쓰는 게 좋은 코드?
  }
}
