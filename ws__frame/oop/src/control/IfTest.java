package control;

public class IfTest {

  public static void main(String[] args) {
    int age = 18;
    
    // 3�� ������
    String vote = (age >= 18) ? "��ǥ ����" : "��ǥ �Ұ���";
    System.out.println(vote);
    
    int tot = 79; // 4 byte 2^32, ��21�� ����, 2,000,000,000
    
    if(tot >= 80) {
      System.out.println("�հ�");
      System.out.println("��Ʈ��");
    }
    
    int su = 2;
    System.out.println("����: " + su);
    
    if(su%2 == 0)
    {
      System.out.println("¦��"); // true
    } else {
      System.out.println("Ȧ��"); // false
    }
    
    String month = "";
    if(su == 1) {
      month = "January";
    } else if(su == 2) {
      month = "February";
    } else if(su == 3) {
      month = "March";
    } else {
      month = "1~3���� �����մϴ�.";
    }
    System.out.println(month);
    
    String korean = "";
    if(month.equals("January")) {
      korean = "1�� ��ũ�븮";
    } else if(month.equals("February")) {
      korean = "2�� �����";
    } else if(month.equals("March")) {
      korean = "3�� ����";
    } else {
      korean = "�ش� �ڷ� ����";
    }
    System.out.println(korean);
    
    int test = 81;
    if(test >= 60) {//60~
      System.out.println("�հ��Դϴ�.");
      if(test >= 85) {
        System.out.println("-> ������Ʈ ����"); //85~
      } else {
        System.out.println("->�߰� ���� �ǽ�"); // 60~85
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
      System.out.println("�����Դϴ�.");
    }
    
    season = 12;
    if(season == 12 || season == 1 || season == 2) {
      System.out.println("�ܿ��Դϴ�.");
    }
    
  }
}
