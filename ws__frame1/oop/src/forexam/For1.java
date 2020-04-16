package forexam;

public class For1 {

  public static void main(String[] args) {
    for(int i = 1; i <= 5; i++) {
      System.out.print(i);
    }
    
    //while
    System.out.println();
    int index=0;
    while(index < 5) {
      System.out.print(index+1);
      index++;
    }
    System.out.println();
    
    for(int i = 5; i>= 1; i--) {
      System.out.print(i);
    }
    
    
    System.out.println();
    index = 5;
    while(index >0) {
      System.out.print(index);
      index--;
    }
    
  }
}
