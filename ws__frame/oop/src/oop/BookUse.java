package oop;
 
public class BookUse {
 
  public static void main(String[] args) {
    Book book = new Book();
    
    book.name = "�ڹ� ���α׷��� ����";
    book.publisher = "���л�";
    book.price = 20000;
    book.dc = 10.0;
    book.sale = (int)(book.price - (book.price * book.dc/100));
    
    System.out.println(book.name);
    System.out.println(book.publisher);
    System.out.println(book.price + " ��");
    System.out.println(book.dc + " %");
    System.out.println(book.sale + " ��");
 
  }
 
}