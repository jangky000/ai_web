package array;

public class Array3 {

  public static void main(String[] args) {
    String names[] = new String[3];
    
    names[0] = "�մ���";
    names[1] = "�Ʒι�";
    names[2] = "ȫ�浿";
    
    int[][][] score = new int[3][2][4];
    
    //�մ���
    score[0][0][0] = 90;
    score[0][0][1] = 85;
    score[0][0][2] = 100;
    score[0][0][3] = 95;
    
    System.out.println("������ ��� �� ����\n");
    System.out.println("1. " + names[0]);
    System.out.println("�� 1�� ��");
    System.out.println("Java: " + score[0][0][0]);
    System.out.println("Python: " + score[0][0][1]);
    System.out.println("JSP: " + score[0][0][2]);
    System.out.println("R: " + score[0][0][3]);

    score[0][1][0] = 90;
    score[0][1][1] = 85;
    score[0][1][2] = 100;
    score[0][1][3] = 95;
    
    System.out.println("�� 2�� ��");
    System.out.println("Java: "     + score[0][1][0]);
    System.out.println("Python: " + score[0][1][1]);
    System.out.println("JSP: "      + score[0][1][2]);
    System.out.println("R: "         + score[0][1][3]);
    
    //�Ʒι� ����
    score[1][0][0] = 80;
    score[1][0][1] = 80;
    score[1][0][2] = 75;
    score[1][0][3] = 100;
    
    System.out.println("������ ��� �� ����\n");
    System.out.println("2. " + names[1]);
    System.out.println("�� 1�� ��");
    System.out.println("Java: " + score[1][0][0]);
    System.out.println("Python: " + score[1][0][1]);
    System.out.println("JSP: " + score[1][0][2]);
    System.out.println("R: " + score[1][0][3]);

    score[1][1][0] = 80;
    score[1][1][1] = 80;
    score[1][1][2] = 75;
    score[1][1][3] = 100;
    
    System.out.println("�� 2�� ��");
    System.out.println("Java: "     + score[1][1][0]);
    System.out.println("Python: " + score[1][1][1]);
    System.out.println("JSP: "      + score[1][1][2]);
    System.out.println("R: "         + score[1][1][3]);
    
  }
}
