package oop2;
 
public class Book {
  String name = "도서명"; // 필드
  int price = 30000;
  String author = "저자";
 
  public Book() {
    System.out.println("기본 생성자 호출 됨");
    this.name = "JAVA";
    this.price = 20000;
    this.author = "왕눈이";
  }
  
  // 생성자 오버로딩
  public Book(String name) {
    this.name = name;
  }
  
  public Book(String name, int price) {
    this.name = name;
    this.price = price;
  }
  
  public Book(String name, int price, String author) {
    this.name = name;
    this.price = price;
    this.author = author;
  }
  
  public void print() {
    System.out.println(this.name +" "+ this.price +" "+ this.author);
    System.out.println();
  }
 
}