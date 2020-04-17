
public class IfExam6 {

  public static void main(String[] args) {
    String str = args[0];
    int price = 0;
    
    if(str.equals("i3") == true) {
      price = 100000;
    } else if(str.equals("i5") == true) {
      price = 150000 ;
    } else if(str.equals("i7") == true) {
      price = 200000 ;
    }
    
    System.out.println("CPU:"+ str +" " + price + "원\n------------------------\n결제 금액:" + price+ "원");

  }

}
