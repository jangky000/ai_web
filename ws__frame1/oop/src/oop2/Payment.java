package oop2;
 
public class Payment {
  String name = ""; // 상품명
  int price = 0;       // 가격
  int count = 0;      // 갯수
  int total = 0;       // 결재 금액
  
  public void order(String name, int price, int count) {
    this.name = name;
    this.price = price;
    this.count = count;
  }
  
  public void calc() {
    this.total = this.price * this.count;
    
    System.out.println("상품명: " + name);
    System.out.println("가격: " + price);
    System.out.println("수량: " + count);
    System.out.println("결재 금액: " + this.total);
  }
}