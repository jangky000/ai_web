package oop4;
 
import java.util.ArrayList;
import java.util.Date;
 
public class ArrayListTest {
 
  public static void main(String[] args) {
    // �޸𸮿� ��ü ����
    ArrayList list = new ArrayList();
    list.add("JAVA ������"); //String -> Object
    list.add(2020);               //Integer -> Object
    list.add(10.5);                //Double -> Object
    list.add(new Date());      //Date -> Object
    
    String str = "Web ����";
    list.add(str);                  //String -> Object
    
    // �޸𸮿��� ��ü ������
    Object obj = list.get(0);
    String dev = (String)obj;
    System.out.println(dev);
    
    obj = list.get(1);
    // int year = (int)obj; // -> �̷��� ���� �ʰ�, Ŭ���� ���·� ��ȯ ����ϴ� ���� �������̴�.
    int year = (Integer)obj; // Object -> Integer Ŭ���� Ÿ��
    System.out.println(year);
    
    obj = list.get(2);
    double db = (double)obj;
    System.out.println(db);
    
    Date date = (Date)list.get(3);
    System.out.println(date.toLocaleString());
    
    System.out.println(list.get(4)); // System.out.println�� �� ���ڿ��� �ٲپ� ����Ѵ�.
    
    System.out.println(((Date)list.get(3)).toLocaleString());
    
    
    
    
    
    
    
    //���ڿ� ������
    System.out.println("".format("%d", 1));
    System.out.printf("%d", 1);
    
  }
}