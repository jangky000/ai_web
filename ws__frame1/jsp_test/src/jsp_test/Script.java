package jsp_test;
 
public class Script {
 
  public static void main(String[] args) {
    String name = "����";
    int kor = 90;
    int eng = 70;
    int mat = 80;
    int tot = kor + eng + mat;
    int avg = tot / 3;
 
    // System.out: ǥ�� ��� ��ġ, ����� �ܼ�
    System.out.println("--> ����: " + name);
    // out: web ���
    System.out.println("WEB");
    System.out.println("����: " + name);
    System.out.println("����: " + kor);
    System.out.println("����: " + eng);
    System.out.println("����: " + mat);
    System.out.println("����: " + tot);
    System.out.println("���: " + avg);
  }
 
}