
public class IfExam14 {

  public static void main(String[] args) {
    //args
    int java = Integer.parseInt(args[0]);
    int jsp = Integer.parseInt(args[1]);
    int spring = Integer.parseInt(args[2]);
    
    //variable
    String result = "";
    
    //result
    if(java >= 80 || jsp >= 80 || spring >= 80) {
      if((java+jsp+spring)/3 < 60) {
        result = "평균 점수 미달입니다.";
      } else {
        result = "합격";
      }
    } else {
      result="재심사";
    }
    
    //print
    System.out.println("결과: " + result);

  }

}
