
public class IfExam5 {

  public static void main(String[] args) {
    int num = Integer.parseInt(args[0]);
    String grade = "";
    String payment = "";
    
    if(num <=5) {
      grade = "�ʱ� �����";
      payment = "2300 ~ 4500";
    }
    else if(num <= 8) {
      grade = "�߱� �����";
      payment = "4500 ~ 5500";
    }
    else if(num <= 11) {
      grade = "��� �����";
      payment = "5500 ~ 6500";
    }
    else if(num >= 12) {
      grade = "Ư�� �����";
      payment = "6500 ~ 7500";
    }
    
    System.out.println("���: " + num+"��");
    System.out.println("���: " + grade);
    System.out.println("����: " + payment);
  }
}
