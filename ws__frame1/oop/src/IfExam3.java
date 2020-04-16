
public class IfExam3 {

  public static void main(String[] args) {
    int num = Integer.parseInt(args[0]);
    
    int digit = 0;
    String str = "";
    
    System.out.println("정수: " + num);
    
    if(num < 0) System.out.println("음수는 처리하지 않습니다.");
    else if(num >=0 && num < 10) digit = 1;
    else if(num >= 10 && num < 100) digit = 10;
    else if(num >= 100 && num < 1000) digit = 100;
    else digit = 1000;
    
    str = digit + "의 자리";
    if(digit == 1000) str += " 이상";
    
    System.out.println(str);
        
  }

}
