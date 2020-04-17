package oop;
 
public class SSD2 {
  String name = "256 GB";
  int price = 70000;
  int dc = 65000;
  int point = 1000;
  int count = 1;
 
  public void print() { // print 메소드, Alt + ←: 원 위치로
    System.out.println(name);
    System.out.println(price + " 원");
    System.out.println(dc + " 원");
    System.out.println(point + " 원");
    System.out.println(count + " 개");
    System.out.println("-------------------");
  }
}