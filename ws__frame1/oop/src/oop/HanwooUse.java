package oop;
 
public class HanwooUse {
 
  public static void main(String[] args) {
    Hanwoo hanwoo = new Hanwoo();
    
    hanwoo.name = "�ɵ��";
    hanwoo.productor = "Ⱦ��";
    hanwoo.weight = 200;
    hanwoo.price = (hanwoo.weight/100) * 12000;
    hanwoo.dc = hanwoo.price - (int)(hanwoo.price * 0.1);
    
    System.out.println(hanwoo.name);
    System.out.println(hanwoo.productor);
    System.out.println(hanwoo.weight + " g");
    System.out.println("��" + hanwoo.price + " ��");
    System.out.println("��"+hanwoo.dc + " ��");
  }
 
}