package oop2;
 
import java.lang.String; // 자동 import
import java.text.DecimalFormat;
import java.util.Date;

public class APITest {
 
  public static void main(String[] args) {
//    String str = null // 메모리 할당을 받지 않아 메소드 사용 불가
//    String str_new = new String("How much is it?"); // 권장하지 않음
    String str = "How much is it?"; // String class 객체 생성
    String res = str.toLowerCase();
    System.out.println("1) "+ res);
    
    res = str.toUpperCase();
    System.out.println("2) "+ res);
    
    int len = str.length();
    System.out.println("3) "+ len);
    
    //How 추출
    res = str.substring(0,3);
    System.out.println("4) " + res);
    
    //much 추출
    res = str.substring(4,8);
    System.out.println("5) " + res);
    
    res = "JAVA";
    boolean sw = res.equals("JAVA");
    
    if(sw == true) {
      System.out.println("6) 동일한 문자열");
    }
    
    sw = res.equals("java");
    if(sw == false) {
      System.out.println("7) JAVA 아님");
    }
    
    res = "JAVA";
    sw = res.equalsIgnoreCase("java"); // 대소문자를 무시한 비교
    if(sw == true) {
      System.out.println("8) 동일한 문자열");
    }
    
    //toLowerCase(), equals()
    if(res.toLowerCase().equals("java")) {
      System.out.println("9) 동일한 문자열");
    }
    
    if(res.toLowerCase().equals("Java".toLowerCase())) {
      System.out.println("10) 동일한 문자열");
    }
    
    //파일 확장자 확인
    String image = "fall.jPg";
    image = image.toLowerCase();
    sw = image.endsWith("jpg");
    if(sw == true) {
      System.out.println("11) jpg 전송가능");
    }
    
    //논리 연산자 || 사용
    sw = image.endsWith("jpg") || image.endsWith("png");
    if(sw == true) {
      System.out.println("12) jpg,  png 전송가능");
    }
    
    //comma 구분
    DecimalFormat df = new DecimalFormat("#,###,###");
    String pay = df.format(2000000);
    System.out.println("13) " + pay);

    df = new DecimalFormat("￦ #,###,###원");
    pay = df.format(2000000);
    System.out.println("13) " + pay);

    Date date = new Date();
    String str_date = date.toLocaleString(); // 취소선: deprecated = 권장하지 않음, 근데 편리하게 사용가능
    System.out.println("15) " + str_date);
    
    
  }
}