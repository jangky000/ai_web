package oop2;
 
public class Ex7 {
 
  public static void main(String[] args) {
    int cnt = 0;
    int avg = 0;
 
    try {
      cnt = Integer.parseInt(args[0]);
      avg = 260 / cnt;
      
      String str = null;
      System.out.println(str.toLowerCase());
      
    } catch (NumberFormatException e) {
      System.out.println("������ �Է��ϼ���. ��) 1 ~ ");
    } catch (ArithmeticException e) {
      System.out.println("0���� ���� �� �����ϴ�.");
    } catch (NullPointerException e) {
      System.out.println("��ü�� �������� �ʾҽ��ϴ�.");
    } catch (Exception e) {
      System.out.println("�� �� ���� ���ܰ� �߻��߽��ϴ�.");
      System.out.println(e.toString());
    }
    
    System.out.println("������ ó�����Դϴ�...");
 
  }
 
}
 
 
 