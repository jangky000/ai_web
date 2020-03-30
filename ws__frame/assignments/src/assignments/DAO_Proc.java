package assignments;

import java.util.Scanner;

public class DAO_Proc {
  DAO mail = null;
  Scanner scan = null;
  
  public DAO_Proc() {
    mail = new DAO();
    scan = new Scanner(System.in);
  }
  
  public void menu() {
    int menu = 0;
    
    while(true) {
      System.out.println("------------------------");
      System.out.println("메일 시스템");
      System.out.println("1. 받은 메일 ");
      System.out.println("2. 보낸 메일");
      System.out.println("3. 메일 읽기");
      System.out.println("4. 메일 쓰기");
      System.out.println("5. 메일 수정");
      System.out.println("6. 메일 삭제");
      System.out.println("9. 시스템 종료");
      System.out.println("-----------------------");
      System.out.println("기능을 선택하세요");
      System.out.print("> ");
      menu = Integer.parseInt(scan.nextLine());
      
      if(menu == 1) {
        System.out.println("메일 리스트");
        this.list(1);
      } else if(menu == 2) {
        System.out.println("보낸 메일");
        this.list(2);
      } else if(menu == 3) {
        System.out.println("메일 읽기");
        this.read();
      } else if(menu == 4) {
        System.out.println("메일 쓰기");
        this.insert();
      } else if(menu == 5) {
        System.out.println("메일 수정");
        this.update();
      } else if(menu == 6) {
        System.out.println("메일 삭제");
        this.delete();
      } else if(menu == 9) {
        System.out.println("메일 종료");
        scan.close();
        System.exit(0);
      }
      System.out.println("아무키나 입력해주세요");
      scan.nextLine();
      
    }
    
  }

  public void list(int control) {
    if(control == 1) mail.list();
    else if(control == 2) mail.list("from_me");
  }
  
  public void read() {
    System.out.print("메일 번호: ");
    int mailno = Integer.parseInt(scan.nextLine());
    mail.read(mailno);
  }
  
  public void insert() {
    System.out.print("메일 제목: ");
    String title = scan.nextLine();
    String mail_from = "me";
    System.out.println("보내는 이: " + mail_from);
    System.out.print("받는 이: ");
    String mail_to = scan.nextLine();
    System.out.print("내용: ");
    String content = scan.nextLine();
    
    mail.insert(title, mail_from, mail_to, content);
  }
  
  public void update() {
    System.out.println("메일 번호: ");
    int mailno = Integer.parseInt(scan.nextLine());
    System.out.println("수정할 제목: ");
    String title = scan.nextLine();
    System.out.println("받는 이: ");
    String mail_to = scan.nextLine();
    System.out.println("수정할 내용: ");
    String content = scan.nextLine();
    
    int count = this.mail.update(mailno, title, mail_to, content);
    
    if(count == 1) {
      System.out.println("등록 처리 성공");
    }else {
      System.out.println("처리 실패");
    }
  }
  
  public void delete() {
    System.out.println("삭제할 메일 번호: ");
    int mailno = Integer.parseInt(scan.nextLine());

    int count = this.mail.delete(mailno);
    
    if(count == 1) {
      System.out.println("등록 처리 성공");
    }else {
      System.out.println("처리 실패");
    }
  }
  
}
