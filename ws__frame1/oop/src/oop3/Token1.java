package oop3;
import java.util.StringTokenizer;

public class Token1 {
 
  public static void main(String[] args) {
    String str = "����/��õ/���";
    // delim: delimiter: ������
    StringTokenizer st = new StringTokenizer(str, "/");
    String item = st.nextToken();
    System.out.println(item);
    
    item = st.nextToken();
    System.out.println(item);
    
    item = st.nextToken();
    System.out.println(item);
    
    System.out.println("--------------------");
    st = new StringTokenizer(str, "/");
    System.out.println("�ܾ��� ����: " + st.countTokens());
    
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
    System.out.println("�ܾ��� ����: " + st.countTokens());
    
  }
 
}