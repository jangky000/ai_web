
public class IfExam1 {

  public static void main(String[] args) {
    int number = Integer.parseInt(args[0]);
    System.out.println("����: " + number);
    
    if(number % 2 == 0) System.out.println("2�� ���");
    if(number % 3 == 0) System.out.println("3�� ���");
    if(number % 4 == 0) System.out.println("4�� ���");
    if(number % 5 == 0) System.out.println("5�� ���");
  }

}
