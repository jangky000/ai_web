package oop2;
 
public class Book {
  String name = "������"; // �ʵ�
  int price = 30000;
  String author = "����";
 
  public Book() {
    System.out.println("�⺻ ������ ȣ�� ��");
    this.name = "JAVA";
    this.price = 20000;
    this.author = "�մ���";
  }
  
  // ������ �����ε�
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