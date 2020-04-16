
public class DataType {

  public static void main(String[] args) {
    boolean sw = true;
    
    System.out.println("sw");
    System.out.println(sw);
    
    sw = false; // 재사용
    System.out.println(sw);
    System.out.println("sw: " + sw);
    
    
    System.out.println("--------------------");
    
    char chr  = 'A';
    String str = "A";
    System.out.println("chr= " + chr);
    System.out.println("str= " + str);
    
    String movie = "Exit";
    System.out.println("movie = " + movie);
    
    movie = "봉오동 전투";
    String star = "★☆☆☆☆";
    System.out.println(movie + "(" + star + ")");
    
    int payment = 2000000;
    int pay = payment; //변수 <- 변수의 값 할당
    
    System.out.println("급여1: " + pay);
    System.out.println("급여2: " + pay + 500000 );
    System.out.println("급여3: " + (pay + 500000) );
    System.out.println("연봉: " + pay*13  );
    
    int year = pay *13 + 2000000;
    System.out.println("연봉 + 성과금: " + year  );
    System.out.println("-----------");
    
    long year_long = year; // 8바이트에 4바이트 할당
//    year = year_long; // 4바이트에 8바이트 할당 불가, ERROR
    int year_int = (int)year_long; // 형변환
    
    float f = 1.0f;
    double d = 1.0; // 소수의 기본형 double, 8 byte가 기본
    
    float f2 = (float)d; // 소수점 표현이 복잡하지 않은 경우 float으로 메모리 절약
    
  }
}
