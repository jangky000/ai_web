package jdbc;
 
public class StringTest {
 
  public static void main(String[] args) {
    String str1 = "java";
    String str2 = new String("java");
    String str3 = new String("왕눈이");
    String str4 = new String("아로미");
    String str5 = new String("투투");
//    new String()
    
    System.out.println("1) " + str1);
    System.out.println("2) " + str2);
    
    //  메모리 절약을위하여 기존에 할당된 "java"를 재사용함.
    System.out.println("3) " + str1.hashCode());
    System.out.println("4) " + str2.hashCode());
    System.out.println("5) " + "java".hashCode());
    
    if (str1 == "java") {
      System.out.println("6) java");
    }
    
    // new를 이용하여 객체를 생성하면 '==' 연산자로 값 비교를 못하게 막혀 있음
    if (str2 == "java") { 
      System.out.println("7) java");
    } else {
      System.out.println("7) java가 아닙니다."); // 실행
    }
    
    if (str2.equals("java")) {  // 메소드 사용을 권장 ★
      System.out.println("8) java");
    }
    
    System.out.println("--------------------------");
    String dev = "";  // 문자열이 없어도 객체가 생성됨.
    // dev.
    System.out.println("9) " + dev.hashCode());
    
    dev = dev + "java";
    System.out.println("10) " + dev.hashCode());
    
    dev = dev + "jsp";
    System.out.println("11) " + dev.hashCode());
 
    dev = dev + "spring";
    System.out.println("12) " + dev.hashCode());
    System.out.println(dev);
    System.out.println("--------------------------");
    
    StringBuffer sb = new StringBuffer();
    sb.append("");
    System.out.println("13) " + sb.hashCode());
    sb.append("java");
    System.out.println("14) " + sb.hashCode());
    sb.append("jsp");
    System.out.println("15) " + sb.hashCode());
    sb.append("spring");
    System.out.println("16) " + sb.hashCode());
    System.out.println(sb.toString());

    // 객체가 null 이라면 자동으로 메모리 회수 대상이됨.
    // dev는 메모리를 4번 할당받아 4개의 객체가 회수 대상이됨.
    dev = null;
    
    // sb는 1번 메모리 할당을 받아 1번 회수 대상이됨.
    sb = null;  
    
  }
 
}
 