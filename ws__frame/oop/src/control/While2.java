package control;
 
public class While2 {
 
  public static void main(String[] args) {
    int su = 0; // 4 byte, ¡¾21¾ï
    
    while(true) {
      su = su + 1;
      if(su%2 == 0 && su%3==0 &&
          su%4==0 && su%5==0 &&
          su%6==0) {
        System.out.println(su);
        break;
      }
    }
 
    //
    
  }
}