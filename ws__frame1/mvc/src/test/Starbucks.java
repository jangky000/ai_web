package test;

public class Starbucks implements CoffeeshopInter {

  @Override
  public void americano() {
    System.out.println("아메리카노: 원두 오버로스팅");
  }

  @Override
  public void latte() {
     System.out.println("라떼: 두유 옵션이 좋음");
  }

  @Override
  public void dessert() {
    System.out.println("디저트: 무난하지만 비쌈");
  }
  
  public void JHB() {
    System.out.println("자몽허니블랙티 jmt");
  }

}