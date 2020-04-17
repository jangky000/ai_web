package oop;
 
public class HanwooUse2 {
 
  public static void main(String[] args) {
    Hanwoo hanwoo = new Hanwoo();
    
    hanwoo.name = "꽃등심";
    hanwoo.productor = "횡성";
    hanwoo.weight = 400;
    hanwoo.price = (hanwoo.weight/100) * 12000;
    hanwoo.dc = hanwoo.price - (int)(hanwoo.price * 0.1);
    
    System.out.println("상품명: " + hanwoo.name);
    System.out.println("원산지: " + hanwoo.productor);
    System.out.println("무   게: " + hanwoo.weight + " g");
    System.out.println("가   격: " + hanwoo.price + " 원");
    System.out.println("할인가: " + hanwoo.dc + " 원");
    System.out.println("------------------------------");
    
    hanwoo.name = "부채살";
    hanwoo.productor = "횡성";
    hanwoo.weight = 400;
    hanwoo.price = (hanwoo.weight/100) * 15000;
    hanwoo.dc = hanwoo.price - (int)(hanwoo.price * 0.1);
    
    System.out.println("상품명: " + hanwoo.name);
    System.out.println("원산지: " + hanwoo.productor);
    System.out.println("무   게: " + hanwoo.weight + " g");
    System.out.println("가   격: " + hanwoo.price + " 원");
    System.out.println("할인가: " + hanwoo.dc + " 원");
    System.out.println("------------------------------");
    
    hanwoo.name = "채끝";
    hanwoo.productor = "산외한우 마을";
    hanwoo.weight = 400;
    hanwoo.price = (hanwoo.weight/100) * 10000;
    hanwoo.dc = hanwoo.price - (int)(hanwoo.price * 0.1);
    
    System.out.println("상품명: " + hanwoo.name);
    System.out.println("원산지: " + hanwoo.productor);
    System.out.println("무   게: " + hanwoo.weight + " g");
    System.out.println("가   격: " + hanwoo.price + " 원");
    System.out.println("할인가: " + hanwoo.dc + " 원");
    System.out.println("------------------------------");
    
    hanwoo.name = "갈비살";
    hanwoo.productor = "홍성";
    hanwoo.weight = 400;
    hanwoo.price = (hanwoo.weight/100) * 11000;
    hanwoo.dc = hanwoo.price - (int)(hanwoo.price * 0.1);
    
    System.out.println("상품명: " + hanwoo.name);
    System.out.println("원산지: " + hanwoo.productor);
    System.out.println("무   게: " + hanwoo.weight + " g");
    System.out.println("가   격: " + hanwoo.price + " 원");
    System.out.println("할인가: " + hanwoo.dc + " 원");
    System.out.println("------------------------------");
    
    hanwoo.name = "안심";
    hanwoo.productor = "홍성";
    hanwoo.weight = 500;
    hanwoo.price = (hanwoo.weight/100) * 12000;
    hanwoo.dc = hanwoo.price - (int)(hanwoo.price * 0.1);
    
    System.out.println("상품명: " + hanwoo.name);
    System.out.println("원산지: " + hanwoo.productor);
    System.out.println("무   게: " + hanwoo.weight + " g");
    System.out.println("가   격: " + hanwoo.price + " 원");
    System.out.println("할인가: " + hanwoo.dc + " 원");
    
  }
 
}