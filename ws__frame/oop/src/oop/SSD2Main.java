package oop;
 
public class SSD2Main {
  public static void main(String[] args) {
    SSD2 ssd1 = new SSD2();
    ssd1.print(); // F3Ű�� ������ ������ ������ �̵�,
    
    ssd1.name = "512GB";
    ssd1.price = 90000;
    ssd1.dc = ssd1.price - 5000;
    ssd1.point = 2700;
    ssd1.count = 2;
    
    ssd1.print();
  }
}