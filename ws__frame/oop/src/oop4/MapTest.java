package oop4;
 
import java.util.Date;
import java.util.HashMap;

public class MapTest {
  public static void main(String[] args) {
    //Ű�� ���� ����
    HashMap map = new HashMap();
    map.put("dev", "JAVA ������");
    map.put("year", 2020);
    map.put("point", 10.5);
    map.put("date", new Date());
    map.put("web","Web ����");
    
    Object obj = map.get("dev");
    String dev = (String)obj;
    System.out.println(dev);
    
    obj = map.get("year");
    int year = (Integer) obj;
    System.out.println(year);
    //Object�� �� �� �ִ� Ÿ���� �ƴϴ�. �߰� ���� Ÿ���̴�.
    
    double point = (Double)map.get("point");
    System.out.println(point);
    
    Date date = (Date)map.get("date");
    System.out.println(date.toLocaleString());
    
    System.out.println(map.get("web"));
    
  }
}