package test;

public class Pizza implements Food {
  @Override
  public void menu() {
    System.out.println("child pizza");
  }
  @Override
  public void price() {
    System.out.println("child 28000");
    
  }
  @Override
  public void reserve() {
    System.out.println("child call 02) 1234 - 5678");
    
  }
}
