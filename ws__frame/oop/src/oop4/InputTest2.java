package oop4;
 
import java.util.Scanner;
/**
 * ���� �Է� �� �߻��ϴ� ����
 * @author soldesk
 *
 */
public class InputTest2 {
 
  public static void main(String[] args) {
    
    Scanner scan = new Scanner(System.in);
    System.out.print("��� ��ȣ: ");
    // ����, ���� + Enter �Էµǰ� ���ڸ� sano ������ �Ҵ��, Enter�� �޸𸮿� ������!!!
    // int sano = scan.nextInt(); 
    
    // ����, ������ �Է¹��� ��� ����, ���ڸ� �Է� ���� ���� �������� �Է¹޾� ����ȯ�Ͽ� ���
    int sano = Integer.parseInt(scan.nextLine());
    
    System.out.print("��� ����: ");
    String job = scan.nextLine(); // ���� �Է�
    
     System.out.print("����: ");
     float incentive = Float.parseFloat(scan.nextLine());
    
    System.out.println("-----------------------------");
    System.out.println("��� ��ȣ: " + sano);
    System.out.println("��� ����: " + job);
    System.out.println("����: " + incentive + " %");
    
    scan.close();
  }
 
}