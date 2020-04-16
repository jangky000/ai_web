package jdbc;

import java.util.Scanner;
/**
 * 만들어진 movieDAO2 클래스를 사용해서
 * 처리만 하는 클래스
 * @author soldesk
 *
 */
public class MovieProc {
  
  MovieDAO2 movieDAO = null;
  Scanner scan = null;
  
  //기본 생성자, 필드 변수 객체 생성
  public MovieProc() {
    this.movieDAO = new MovieDAO2();
    this.scan = new Scanner(System.in);
  }
  
  public void menu() {
    int menu = 0;
    
    while(true) {
      System.out.println();
      System.out.println("Movie chart(ver 1.0)");
      System.out.println("───────────");//ㅂ + 한자 ㅂ
      System.out.println("      1. 등록");
      System.out.println("      2. 목록");
      System.out.println("      3. 조회");
      System.out.println("      4. 수정");
      System.out.println("      5. 삭제");    
      System.out.println("      9. 종료");
      System.out.println("───────────");
      System.out.print("메뉴 입력: ");
      menu = Integer.parseInt(scan.nextLine());
      System.out.println();
      
      if(menu == 1) {
        this.create();
      } else if(menu == 2){
        this.list();
      } else if(menu == 3){
        this.read();
      } else if(menu == 4){
        this.update();
      } else if(menu == 5){
        this.delete();
      } else if(menu ==  9){
        System.out.println("오늘도 수고했습니다.");
        this.scan.close();
        System.exit(0); // static method, JVM 종료, 0: 정상 종료
      } else{
        System.out.println("잘못된 메뉴 번호입니다.");
      } 
    } // while
  }//menu class
  
  public void create() {
    String title ="";
    double score = 0.0;
    String actor = "";
    
    System.out.print("제목: ");
    title = scan.nextLine();
    
    System.out.print("평점(0.0~10.0): ");
    score = Double.parseDouble(scan.nextLine());
    
    System.out.print("주연: ");
    actor = scan.nextLine();
    
    int count = this.movieDAO.create(title, score, actor);
    if(count == 1) {
      System.out.println("▷ 등록 처리 성공");
    }else {
      System.out.println("▷ 처리 실패");
    }
  }
  
  public void list() {
    this.movieDAO.list();
  }
  
  public void read() {
    int movieno = 0;
    
    System.out.print("번호: ");
    movieno = Integer.parseInt(scan.nextLine());
    this.movieDAO.read(movieno);
  }
  
  public void update() {
    System.out.println();
    System.out.println("수정할 정보를 입력해주세요");
    int movieno = 0;
    String title = "";
    double score = 0.0;
    String actor = "";
    
    System.out.print("번호: ");
    movieno = Integer.parseInt(scan.nextLine());
    System.out.print("제목: ");
    title = scan.nextLine();
    System.out.print("평점(0.0~10.0): ");
    score = Double.parseDouble(scan.nextLine());
    System.out.print("주연: ");
    actor = scan.nextLine();
    
    int count = this.movieDAO.update(movieno, title, score, actor);
    
    if(count == 1) {
      System.out.println("등록 처리 성공");
    }else {
      System.out.println("처리 실패");
    }
      
  }
  
  public void delete() {
    int movieno = 0;
    
    System.out.println();
    System.out.println("삭제할 영화 번호를 입력해주세요.");
    
    System.out.print("번호: ");
    movieno = Integer.parseInt(scan.nextLine());
    
    int count = this.movieDAO.delete(movieno);
    
    if(count == 1) {
      System.out.println("등록 처리 성공");
    }else {
      System.out.println("처리 실패");
    }
  }
  
}
 
 