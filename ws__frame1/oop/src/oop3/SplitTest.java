package oop3;

public class SplitTest {

  public static void main(String[] args) {
    String[] list = "��,����,����,�ܿ�".split(",");
    System.out.println(list.length);
    
    for (int i = 0; i < list.length; i++) { // 0 ~ 3
      System.out.println(list[i]);
    }
     
    System.out.println("-----------------------------------");
    list = "��, ,����,�ܿ�".split(","); // ���� ����
    System.out.println(list.length);
    
    for (int i = 0; i < list.length; i++) { // 0 ~ 3
      System.out.println("--> " + list[i]);
    }
      
  }

}
  
