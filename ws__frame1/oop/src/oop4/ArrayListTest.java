package oop4;
 
import java.util.ArrayList;
import java.util.Date;
 
public class ArrayListTest {
 
  public static void main(String[] args) {
    // 메모리에 객체 저장
    ArrayList list = new ArrayList();
    list.add("JAVA 개발자"); //String -> Object
    list.add(2020);               //Integer -> Object
    list.add(10.5);                //Double -> Object
    list.add(new Date());      //Date -> Object
    
    String str = "Web 개발";
    list.add(str);                  //String -> Object
    
    // 메모리에서 객체 꺼내기
    Object obj = list.get(0);
    String dev = (String)obj;
    System.out.println(dev);
    
    obj = list.get(1);
    // int year = (int)obj; // -> 이렇게 쓰지 않고, 클래스 형태로 변환 출력하는 것이 문법적이다.
    int year = (Integer)obj; // Object -> Integer 클래스 타입
    System.out.println(year);
    
    obj = list.get(2);
    double db = (double)obj;
    System.out.println(db);
    
    Date date = (Date)list.get(3);
    System.out.println(date.toLocaleString());
    
    System.out.println(list.get(4)); // System.out.println은 다 문자열로 바꾸어 출력한다.
    
    System.out.println(((Date)list.get(3)).toLocaleString());
    
    
    
    
    
    
    
    //문자열 포매팅
    System.out.println("".format("%d", 1));
    System.out.printf("%d", 1);
    
  }
}