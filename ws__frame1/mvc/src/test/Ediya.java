package test;

public class Ediya implements CoffeeshopInter {

  @Override
  public void americano() {
    System.out.println("아메리카노: 옛날엔 쌌는데,,");
  }

  @Override
  public void latte() {
     System.out.println("라떼: 양이 점점 줄어드는 것 같다,,,");
  }

  @Override
  public void dessert() {
    System.out.println("디저트: 허니브래드 ㅎㅎ");
  }

  public void TL () {
    System.out.println("토피넛 라떼 jmt");
  }
}