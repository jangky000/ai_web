package array;
 
public class Array1 {
 
  public static void main(String[] args) {
    String[] months = {"January", "February", "March", "April", "May", "June", "Juliy", "August", "Setember", "October", "November", "December"};
    int index = Integer.parseInt(args[0]);
    
    if(index < 1 || index > 12) {
      System.out.println("1~12까지 입력하세요");
    } else {
      System.out.println(months[index-1]);
    }
    
  }
}