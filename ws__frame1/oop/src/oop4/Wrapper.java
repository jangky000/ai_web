package oop4;

import javax.sound.midi.Synthesizer;

class Winter {
  static String snow; // class 변수, static 변수(필드)
  String rain;          // instance variable, 필드
}
 
public class Wrapper {
 
  public static void main(String[] args) {
    Winter.snow = "함박눈"; // static 변수는 기울어져 표현된다.
//    Winter.rain = "비"; // -> 에러
    
    System.out.println(Winter.snow);
    
    System.out.println("-------------------------");
    
    Winter winter = new Winter();
//    winter.snow = "함박눈2"; // warning: The static field Winter.snow should be accessed in a static way
    Winter.snow = "봄눈";
    winter.rain = "비";
    
//    System.out.println(winter.snow);
    System.out.println(Winter.snow);
    System.out.println(winter.rain);
    
    //static 메소드
    int price = Integer.parseInt("50000");
    price += 15000;
    System.out.println(price);
    
    Integer itg = new Integer(2019); // JDK 1.5 이상에서 가능
    int year = itg; 
    System.out.println(year);
    
    Integer itg2 = 2020;
    System.out.println(itg2);
    
    //scanner class
    // PrintStream = 표준 출력 장치: 모니터
    // System 클래스 내의 out은 static 필드(타입: PrintStream)
    //파란색: 필드, 오른쪽으로 기울어짐: static
    // println은 PrintStream 내부의 퍼블릭 메소드
  }
 
}