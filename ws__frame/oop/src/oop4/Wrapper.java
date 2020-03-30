package oop4;

import javax.sound.midi.Synthesizer;

class Winter {
  static String snow; // class ����, static ����(�ʵ�)
  String rain;          // instance variable, �ʵ�
}
 
public class Wrapper {
 
  public static void main(String[] args) {
    Winter.snow = "�Թڴ�"; // static ������ ������ ǥ���ȴ�.
//    Winter.rain = "��"; // -> ����
    
    System.out.println(Winter.snow);
    
    System.out.println("-------------------------");
    
    Winter winter = new Winter();
//    winter.snow = "�Թڴ�2"; // warning: The static field Winter.snow should be accessed in a static way
    Winter.snow = "����";
    winter.rain = "��";
    
//    System.out.println(winter.snow);
    System.out.println(Winter.snow);
    System.out.println(winter.rain);
    
    //static �޼ҵ�
    int price = Integer.parseInt("50000");
    price += 15000;
    System.out.println(price);
    
    Integer itg = new Integer(2019); // JDK 1.5 �̻󿡼� ����
    int year = itg; 
    System.out.println(year);
    
    Integer itg2 = 2020;
    System.out.println(itg2);
    
    //scanner class
    // PrintStream = ǥ�� ��� ��ġ: �����
    // System Ŭ���� ���� out�� static �ʵ�(Ÿ��: PrintStream)
    //�Ķ���: �ʵ�, ���������� ������: static
    // println�� PrintStream ������ �ۺ� �޼ҵ�
  }
 
}