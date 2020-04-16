
public class IfExam1 {

  public static void main(String[] args) {
    int number = Integer.parseInt(args[0]);
    System.out.println("정수: " + number);
    
    if(number % 2 == 0) System.out.println("2의 배수");
    if(number % 3 == 0) System.out.println("3의 배수");
    if(number % 4 == 0) System.out.println("4의 배수");
    if(number % 5 == 0) System.out.println("5의 배수");
  }

}
