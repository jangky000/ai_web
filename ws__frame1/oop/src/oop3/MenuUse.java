package oop3;
 
public class MenuUse {
  public static void main(String[] args) {
    MenuList menu = new MenuList();
    One one = menu.getMenu1();
    System.out.println("1) " + one.menu);
    
    System.out.println("2) " + menu.getMenu2().menu);
    System.out.println("3) " + menu.getMenu3().menu);
    System.out.println("4) " + menu.getMenu4().menu);
  }
}