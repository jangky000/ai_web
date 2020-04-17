package oop3;
import java.util.StringTokenizer;

public class Token1 {
 
  public static void main(String[] args) {
    String str = "서울/인천/경기";
    // delim: delimiter: 구분자
    StringTokenizer st = new StringTokenizer(str, "/");
    String item = st.nextToken();
    System.out.println(item);
    
    item = st.nextToken();
    System.out.println(item);
    
    item = st.nextToken();
    System.out.println(item);
    
    System.out.println("--------------------");
    st = new StringTokenizer(str, "/");
    System.out.println("단어의 갯수: " + st.countTokens());
    
    boolean sw = st.hasMoreTokens();
    System.out.println(sw);
    System.out.println(st.nextToken());
    
    sw = st.hasMoreTokens();    
    System.out.println(sw);
    System.out.println(st.nextToken());
 
    sw = st.hasMoreTokens();    
    System.out.println(sw);
    System.out.println(st.nextToken());
    
    sw = st.hasMoreTokens();    
    System.out.println(sw);
    System.out.println("단어의 갯수: " + st.countTokens());
    
  }
 
}