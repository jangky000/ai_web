package oop2;
 
public class BookUse {
 
  public static void main(String[] args) {
    Book book = new Book();
    book.print();
    
    Book book2 = new Book();
    book2.print();
    
    book = new Book("JSP");
    book.print();
    
    book = new Book("Spring", 25000);
    book.print();

    book = new Book("코스모스", 45000, "칼세이건");
    book.print();
    
  }
 
}