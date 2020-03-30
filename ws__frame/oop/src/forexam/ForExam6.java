package forexam;
 
public class ForExam6 {
 
  public static void main(String[] args) {
    String comment = args[0];
    int iterate = Integer.parseInt(args[1]);
    
    for(int i=0; i<iterate; i++) {
      System.out.println(comment);
    }
 
  }
}