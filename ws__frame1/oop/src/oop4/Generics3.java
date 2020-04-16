package oop4;
 
import java.util.ArrayList;
 
class Print {
  public void print(ArrayList<String> list) {
    for (int i = 0; i < list.size(); i++) {
      System.out.println(list.get(i));
    }
  }
}
 
public class Generics3 {
 
  public static void main(String[] args) {
    Print print = new Print();
    ArrayList<String> list1 = new ArrayList<String>();
    list1.add("1월");
    list1.add("2월");
    list1.add("3월");
    
    // 문자열만 저장된 ArrayList() 전달
    print.print(list1);
    
    ArrayList<Integer> list2 = new ArrayList<Integer>();
    list2.add(2014);
    list2.add(2015);
    list2.add(2016);
    
    // The method print(ArrayList<String>) in the type Print is not applicable for the arguments (ArrayList<Integer>)
    // print.print(list2);
    
  }
 
}