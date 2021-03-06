package test;

public class SeasonMain {

  public static void main(String[] args) {
    
    //일반적으로 계속 써온 형태
    //부모 클래스가 (추상 클래스 or 인터페이스)인 경우에 부모 객체를 생성할 수 없을 수도 있다. -> 그래서 자식 객체를 부모 객체에 할당 
    Season season = new Season();
    season.print();
    
    //부모 타입에 자식 객체를 할당
    Spring spring1 = new Spring();
    Season season1 = spring1;
    season1.print(); // spring! 출력 / 타입은 Season, 객체는 Spring의 인스턴스
    
    //자식 타입에 부모 객체를 할당 -> 에러
    //Season season2 = new Season();
    //Spring spring2 = (Spring)season2; // 에러 발생: Exception in thread "main" java.lang.ClassCastException: test.Season cannot be cast to test.Spring at test.SeasonMain.main(SeasonMain.java:11)
    //spring2.print(); 
    
    //Season 타입의 Spring객체를 (Spring으로 형변환하여)Spring 타입에 할당
    Season season3 = new Spring();
    Spring spring3 = (Spring)season3; 
    spring3.print(); // Spring! 출력, 타입은 Spring, 객체는 Spring의 인스턴스

    }

}
