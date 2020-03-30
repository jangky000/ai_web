package control;

public class IfTest {

  public static void main(String[] args) {
    int age = 18;
    
    // 3항 연산자
    String vote = (age >= 18) ? "투표 가능" : "투표 불가능";
    System.out.println(vote);
    
    int tot = 79; // 4 byte 2^32, ±21억 정도, 2,000,000,000
    
    if(tot >= 80) {
      System.out.println("합격");
      System.out.println("노트북");
    }
    
    int su = 2;
    System.out.println("정수: " + su);
    
    if(su%2 == 0)
    {
      System.out.println("짝수"); // true
    } else {
      System.out.println("홀수"); // false
    }
    
    String month = "";
    if(su == 1) {
      month = "January";
    } else if(su == 2) {
      month = "February";
    } else if(su == 3) {
      month = "March";
    } else {
      month = "1~3월만 가능합니다.";
    }
    System.out.println(month);
    
    String korean = "";
    if(month.equals("January")) {
      korean = "1월 오크밸리";
    } else if(month.equals("February")) {
      korean = "2월 빙어낚시";
    } else if(month.equals("March")) {
      korean = "3월 남해";
    } else {
      korean = "해당 자료 없음";
    }
    System.out.println(korean);
    
    int test = 81;
    if(test >= 60) {//60~
      System.out.println("합격입니다.");
      if(test >= 85) {
        System.out.println("-> 프로젝트 투입"); //85~
      } else {
        System.out.println("->추가 교육 실시"); // 60~85
      }
    }
    
    String grade = "";
    if(test >= 90) {
      grade = "A";
    } else if(test >= 80 && test <= 89) {
      grade = "B";
    } else {
      grade = "F";
    }
    System.out.println("grade: " + grade);
    
    int season = 8;
    if(season == 6 || season  == 7 || season == 8) {
      System.out.println("여름입니다.");
    }
    
    season = 12;
    if(season == 12 || season == 1 || season == 2) {
      System.out.println("겨울입니다.");
    }
    
  }
}
