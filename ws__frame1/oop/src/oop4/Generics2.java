package oop4;
 
import java.util.ArrayList;
 
public class Generics2 {
 
  public static void main(String[] args) {
    ArrayList<String> list = new ArrayList<String>();
    list.add("JAVA");
    list.add("HTML5");
    list.add("CSS3");
    // list.add(2017); // ERROR. ����� Ÿ�Կܿ��� ���� �Ұ���
    
    String str = list.get(0); // ����ȯ �ʿ� ����
    System.out.println(str);
    
    ArrayList<Integer> sales = new ArrayList<Integer>();
    // sales.add("����"); // ���� ���¸� ���� ����
    sales.add(1000000000); 
    
    int sale = sales.get(0);
    System.out.println(sale);
 
  }
 
}