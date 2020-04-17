package test;

public class CoffeeInterMain {

  public static void main(String[] args) {

    System.out.println("");
    System.out.println("Starbucks");
    System.out.println("==============================");

    CoffeeshopInter coffee = new Starbucks();
    coffee.americano();
    coffee.latte();
    coffee.dessert();
    
    System.out.println("");
    System.out.println("Ediya");
    System.out.println("==============================");

    coffee = new Ediya();
    coffee.americano();
    coffee.latte();
    coffee.dessert();
    
    
    
  }

}