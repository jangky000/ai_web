package forexam;

public class Gugudan4 {
  public static void main(String[] args) {
    
    
    for(int i = 1;  i <= 18; i++) {
      if(i%2 == 1) continue;
      System.out.println(i + "´Ü");
      for(int j=1; j<=9; j++) {
        System.out.println(i + " x " + j + " = " + i*j);
      }
      System.out.println();
    }
    
    
    
  }
}