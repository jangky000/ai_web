package oop3;
 
import java.util.StringTokenizer;
 
public class Token3 {
 
  public static void main(String[] args) {
    String str = "10,20,30,40,50";
    StringTokenizer token = new StringTokenizer(str, ",");
    int tot = 0;
    int su = Integer.parseInt(token.nextToken());
    tot = tot + su;
    
    su = Integer.parseInt(token.nextToken());
    tot = tot + su;
    
    su = Integer.parseInt(token.nextToken());
    tot = tot + su;
    
    su = Integer.parseInt(token.nextToken());
    tot = tot + su;
    
    su = Integer.parseInt(token.nextToken());
    tot = tot + su;
    
    System.out.println("합계: " + tot);
    System.out.println("---------------");
    
    tot = 0;
    token = new StringTokenizer(str, ",");
    while(token.hasMoreTokens()) {
      tot += Integer.parseInt(token.nextToken());
    }
    
    System.out.println("합계: " + tot);
    
  }
 
}
 