package forexam;
 
public class ForExam5 {
 
  public static void main(String[] args) {
    int dan = Integer.parseInt(args[0]);
    
    System.out.println(dan + " ´Ü");
    for(int i=1; i<=9; i++) {
      System.out.println(dan + " x " + i + " = " + dan*i);
    }
    
  }
}