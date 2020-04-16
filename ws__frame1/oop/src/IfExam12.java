
public class IfExam12 {

  public static void main(String[] args) {
    //args
    String pension = args[0];
    char bbq = args[1].charAt(0);
    char sea = args[2].charAt(0);
    char play = args[3].charAt(0);
    
    //variables
    int p_price = 0;
    int bbq_price = 0;
    int sea_price = 0;
    int play_price = 0;
    int total = 0;
    
    //pension
    if(pension.equals("Ææ¼Ç1")) {
      p_price = 80000;
    } else if(pension.equals("Ææ¼Ç2")) {
      p_price = 120000;
    } else if(pension.equals("Ææ¼Ç3")) {
      p_price = 150000;
    }
    
    //option
    if(bbq == 'Y' || bbq == 'y') {
      bbq_price = 30000;
    }
    if(sea == 'Y' || sea == 'y') {
      sea_price = 20000;
    }
    if(play == 'Y' || play == 'y') {
      play_price = 10000;
    }
    
    //calculation
    total = p_price + bbq_price + sea_price + play_price;
    
    //print
    System.out.println("Ææ¼Ç: " + pension);
    System.out.println("°¡°Ý: " + p_price + " ¿ø");
    System.out.println("¹Ùº£Å¥: " + bbq_price + " ¿ø");
    System.out.println("¹Ù´å°¡ Àü¸Á: " + sea_price + " ¿ø");
    System.out.println("¹°³îÀÌ Æ©ºê: " + play_price + " ¿ø");
    System.out.println("-------------------------------");
    System.out.println("°áÁ¦ ±Ý¾×: " + total + " ¿ø");

  }

}
