package oop4;
 
import java.util.ArrayList;
 
public class Generics2 {
 
  public static void main(String[] args) {
    ArrayList<String> list = new ArrayList<String>();
    list.add("JAVA");
    list.add("HTML5");
    list.add("CSS3");
    // list.add(2017); // ERROR. 선언된 타입외에는 저장 불가능
    
    String str = list.get(0); // 형변환 필요 없음
    System.out.println(str);
    
    ArrayList<Integer> sales = new ArrayList<Integer>();
    // sales.add("매진"); // 정수 형태만 저장 가능
    sales.add(1000000000); 
    
    int sale = sales.get(0);
    System.out.println(sale);
 
  }
 
}