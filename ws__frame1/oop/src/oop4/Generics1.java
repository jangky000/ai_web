package oop4;
 
import java.util.ArrayList;
 
public class Generics1 {
  public static void main(String[] args) {
    ArrayList list = new ArrayList();
    list.add("January"); // String -> Object
    list.add("February"); 
    list.add(3); // int 상수 --> Integer --> Object  타입으로 변환
    list.add("April");
    list.add(5); // int 상수 --> Integer --> Object  타입으로 변환
    
    for (int index=0; index < list.size(); index++) {
      String str = (String)list.get(index);
      System.out.println(str);
    }
 
  }
 
}