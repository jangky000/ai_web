
public class IfExam5 {

  public static void main(String[] args) {
    int num = Integer.parseInt(args[0]);
    String grade = "";
    String payment = "";
    
    if(num <=5) {
      grade = "초급 기술자";
      payment = "2300 ~ 4500";
    }
    else if(num <= 8) {
      grade = "중급 기술자";
      payment = "4500 ~ 5500";
    }
    else if(num <= 11) {
      grade = "고급 기술자";
      payment = "5500 ~ 6500";
    }
    else if(num >= 12) {
      grade = "특급 기술자";
      payment = "6500 ~ 7500";
    }
    
    System.out.println("경력: " + num+"년");
    System.out.println("등급: " + grade);
    System.out.println("연봉: " + payment);
  }
}
