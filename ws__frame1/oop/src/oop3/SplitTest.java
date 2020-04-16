package oop3;

public class SplitTest {

  public static void main(String[] args) {
    String[] list = "봄,여름,가을,겨울".split(",");
    System.out.println(list.length);
    
    for (int i = 0; i < list.length; i++) { // 0 ~ 3
      System.out.println(list[i]);
    }
     
    System.out.println("-----------------------------------");
    list = "봄, ,가을,겨울".split(","); // 여름 제거
    System.out.println(list.length);
    
    for (int i = 0; i < list.length; i++) { // 0 ~ 3
      System.out.println("--> " + list[i]);
    }
      
  }

}
  
