package control;
 
public class DoWhile2 {
 
  public static void main(String[] args) {
    int su = 0; // 4 byte, ¡¾21¾ï
 
    do {
      su = su + 1;
      System.out.println(su);
    } while(su < 5);
    
  }
}