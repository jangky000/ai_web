package array;

public class Array3 {

  public static void main(String[] args) {
    String names[] = new String[3];
    
    names[0] = "왕눈이";
    names[1] = "아로미";
    names[2] = "홍길동";
    
    int[][][] score = new int[3][2][4];
    
    //왕눈이
    score[0][0][0] = 90;
    score[0][0][1] = 85;
    score[0][0][2] = 100;
    score[0][0][3] = 95;
    
    System.out.println("개발직 사원 평가 점수\n");
    System.out.println("1. " + names[0]);
    System.out.println("▷ 1차 평가");
    System.out.println("Java: " + score[0][0][0]);
    System.out.println("Python: " + score[0][0][1]);
    System.out.println("JSP: " + score[0][0][2]);
    System.out.println("R: " + score[0][0][3]);

    score[0][1][0] = 90;
    score[0][1][1] = 85;
    score[0][1][2] = 100;
    score[0][1][3] = 95;
    
    System.out.println("▷ 2차 평가");
    System.out.println("Java: "     + score[0][1][0]);
    System.out.println("Python: " + score[0][1][1]);
    System.out.println("JSP: "      + score[0][1][2]);
    System.out.println("R: "         + score[0][1][3]);
    
    //아로미 성적
    score[1][0][0] = 80;
    score[1][0][1] = 80;
    score[1][0][2] = 75;
    score[1][0][3] = 100;
    
    System.out.println("개발직 사원 평가 점수\n");
    System.out.println("2. " + names[1]);
    System.out.println("▷ 1차 평가");
    System.out.println("Java: " + score[1][0][0]);
    System.out.println("Python: " + score[1][0][1]);
    System.out.println("JSP: " + score[1][0][2]);
    System.out.println("R: " + score[1][0][3]);

    score[1][1][0] = 80;
    score[1][1][1] = 80;
    score[1][1][2] = 75;
    score[1][1][3] = 100;
    
    System.out.println("▷ 2차 평가");
    System.out.println("Java: "     + score[1][1][0]);
    System.out.println("Python: " + score[1][1][1]);
    System.out.println("JSP: "      + score[1][1][2]);
    System.out.println("R: "         + score[1][1][3]);
    
  }
}
