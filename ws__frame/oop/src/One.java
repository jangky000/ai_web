
public class One {

  public static void main(String[] args) {
    System.out.println("계산기");
    System.out.println(10 + 5);
    System.out.println(10 +5 + 20);
    System.out.println((10 + 5+20)/2); // 연산자 우선순위 17.5 -> 17
    System.out.println((10 + 5+20)/2 + 100); // 117
    
    System.out.println("----------");
    int tot = 10 + 5+ 20; //정수형 변수의 선언
    System.out.println(tot);
    System.out.println(tot/2);
    System.out.println(tot/2 + 100);
    
  }

}
