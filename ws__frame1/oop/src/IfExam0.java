
public class IfExam0 {

  public static void main(String[] args) {
    String name = args[0];
    
    int python = Integer.parseInt(args[1]);
    int R = Integer.parseInt(args[2]);
    
    int tot = python + R;
    int avg = tot / 2;
    System.out.println(name);
    System.out.println(tot + "/" + avg);
  }

}
