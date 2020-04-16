package jdbc;

import java.util.Scanner;
/**
 * ������� movieDAO2 Ŭ������ ����ؼ�
 * ó���� �ϴ� Ŭ����
 * @author soldesk
 *
 */
public class MovieProc {
  
  MovieDAO2 movieDAO = null;
  Scanner scan = null;
  
  //�⺻ ������, �ʵ� ���� ��ü ����
  public MovieProc() {
    this.movieDAO = new MovieDAO2();
    this.scan = new Scanner(System.in);
  }
  
  public void menu() {
    int menu = 0;
    
    while(true) {
      System.out.println();
      System.out.println("Movie chart(ver 1.0)");
      System.out.println("����������������������");//�� + ���� ��
      System.out.println("      1. ���");
      System.out.println("      2. ���");
      System.out.println("      3. ��ȸ");
      System.out.println("      4. ����");
      System.out.println("      5. ����");    
      System.out.println("      9. ����");
      System.out.println("����������������������");
      System.out.print("�޴� �Է�: ");
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
        System.out.println("���õ� �����߽��ϴ�.");
        this.scan.close();
        System.exit(0); // static method, JVM ����, 0: ���� ����
      } else{
        System.out.println("�߸��� �޴� ��ȣ�Դϴ�.");
      } 
    } // while
  }//menu class
  
  public void create() {
    String title ="";
    double score = 0.0;
    String actor = "";
    
    System.out.print("����: ");
    title = scan.nextLine();
    
    System.out.print("����(0.0~10.0): ");
    score = Double.parseDouble(scan.nextLine());
    
    System.out.print("�ֿ�: ");
    actor = scan.nextLine();
    
    int count = this.movieDAO.create(title, score, actor);
    if(count == 1) {
      System.out.println("�� ��� ó�� ����");
    }else {
      System.out.println("�� ó�� ����");
    }
  }
  
  public void list() {
    this.movieDAO.list();
  }
  
  public void read() {
    int movieno = 0;
    
    System.out.print("��ȣ: ");
    movieno = Integer.parseInt(scan.nextLine());
    this.movieDAO.read(movieno);
  }
  
  public void update() {
    System.out.println();
    System.out.println("������ ������ �Է����ּ���");
    int movieno = 0;
    String title = "";
    double score = 0.0;
    String actor = "";
    
    System.out.print("��ȣ: ");
    movieno = Integer.parseInt(scan.nextLine());
    System.out.print("����: ");
    title = scan.nextLine();
    System.out.print("����(0.0~10.0): ");
    score = Double.parseDouble(scan.nextLine());
    System.out.print("�ֿ�: ");
    actor = scan.nextLine();
    
    int count = this.movieDAO.update(movieno, title, score, actor);
    
    if(count == 1) {
      System.out.println("��� ó�� ����");
    }else {
      System.out.println("ó�� ����");
    }
      
  }
  
  public void delete() {
    int movieno = 0;
    
    System.out.println();
    System.out.println("������ ��ȭ ��ȣ�� �Է����ּ���.");
    
    System.out.print("��ȣ: ");
    movieno = Integer.parseInt(scan.nextLine());
    
    int count = this.movieDAO.delete(movieno);
    
    if(count == 1) {
      System.out.println("��� ó�� ����");
    }else {
      System.out.println("ó�� ����");
    }
  }
  
}
 
 