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
      System.out.println("���� �ý���");
      System.out.println("1. ���� ���� ");
      System.out.println("2. ���� ����");
      System.out.println("3. ���� �б�");
      System.out.println("4. ���� ����");
      System.out.println("5. ���� ����");
      System.out.println("6. ���� ����");
      System.out.println("9. �ý��� ����");
      System.out.println("-----------------------");
      System.out.println("����� �����ϼ���");
      System.out.print("> ");
      menu = Integer.parseInt(scan.nextLine());
      
      if(menu == 1) {
        System.out.println("���� ����Ʈ");
        this.list(1);
      } else if(menu == 2) {
        System.out.println("���� ����");
        this.list(2);
      } else if(menu == 3) {
        System.out.println("���� �б�");
        this.read();
      } else if(menu == 4) {
        System.out.println("���� ����");
        this.insert();
      } else if(menu == 5) {
        System.out.println("���� ����");
        this.update();
      } else if(menu == 6) {
        System.out.println("���� ����");
        this.delete();
      } else if(menu == 9) {
        System.out.println("���� ����");
        scan.close();
        System.exit(0);
      }
      System.out.println("�ƹ�Ű�� �Է����ּ���");
      scan.nextLine();
      
    }
    
  }

  public void list(int control) {
    if(control == 1) mail.list();
    else if(control == 2) mail.list("from_me");
  }
  
  public void read() {
    System.out.print("���� ��ȣ: ");
    int mailno = Integer.parseInt(scan.nextLine());
    mail.read(mailno);
  }
  
  public void insert() {
    System.out.print("���� ����: ");
    String title = scan.nextLine();
    String mail_from = "me";
    System.out.println("������ ��: " + mail_from);
    System.out.print("�޴� ��: ");
    String mail_to = scan.nextLine();
    System.out.print("����: ");
    String content = scan.nextLine();
    
    mail.insert(title, mail_from, mail_to, content);
  }
  
  public void update() {
    System.out.println("���� ��ȣ: ");
    int mailno = Integer.parseInt(scan.nextLine());
    System.out.println("������ ����: ");
    String title = scan.nextLine();
    System.out.println("�޴� ��: ");
    String mail_to = scan.nextLine();
    System.out.println("������ ����: ");
    String content = scan.nextLine();
    
    int count = this.mail.update(mailno, title, mail_to, content);
    
    if(count == 1) {
      System.out.println("��� ó�� ����");
    }else {
      System.out.println("ó�� ����");
    }
  }
  
  public void delete() {
    System.out.println("������ ���� ��ȣ: ");
    int mailno = Integer.parseInt(scan.nextLine());

    int count = this.mail.delete(mailno);
    
    if(count == 1) {
      System.out.println("��� ó�� ����");
    }else {
      System.out.println("ó�� ����");
    }
  }
  
}
