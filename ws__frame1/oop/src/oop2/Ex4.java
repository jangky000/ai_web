package oop2;

public class Ex4 {

  public static void main(String[] args) {
    int tot = 260;
    int avg = 0;
    
    try {
      avg = tot / 0;
    } catch (Exception e) {
      System.out.println("���� �߻�");
    } finally {
      System.out.println("��� ó�� ����");
      System.out.println("�Է°�: " + tot + " ���: " + avg);
    }

  }

}
