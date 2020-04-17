package oop4;

public class InterTest {

  public static void main(String[] args) {
    //Smartphone smartphone = new Smartphone(); // Cannot instantiate the type Smartphone
    
    Smartphone smartphone = null;
    
    smartphone = new Android();
    smartphone.map();
    smartphone.nfc();
    System.out.println("--------------------");
    
    smartphone = new IPhone();
    smartphone.map();
    smartphone.nfc();
    System.out.println("----------------------");
    
    
  }

}
