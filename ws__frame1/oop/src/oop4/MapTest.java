package oop4;
 
import java.util.Date;
import java.util.HashMap;

public class MapTest {
  public static void main(String[] args) {
    //키와 값의 구조
    HashMap map = new HashMap();
    map.put("dev", "JAVA 개발자");
    map.put("year", 2020);
    map.put("point", 10.5);
    map.put("date", new Date());
    map.put("web","Web 개발");
    
    Object obj = map.get("dev");
    String dev = (String)obj;
    System.out.println(dev);
    
    obj = map.get("year");
    int year = (Integer) obj;
    System.out.println(year);
    //Object는 쓸 수 있는 타입이 아니다. 중간 저장 타입이다.
    
    double point = (Double)map.get("point");
    System.out.println(point);
    
    Date date = (Date)map.get("date");
    System.out.println(date.toLocaleString());
    
    System.out.println(map.get("web"));
    
  }
}