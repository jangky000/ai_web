package oop4;
 
import java.util.Scanner;
 
public class InputTest {
  public static void main(String[] args) {
    Scanner scan = new Scanner(System.in);
    
    String str = scan.next(); // �ϳ��� ���ڿ�
    System.out.println("1) " + str);
    
    int year = scan.nextInt();
    System.out.println("2) "+ year);
    
    long sale = scan.nextLong();
    System.out.println("3) "+ sale);
    
    // Input Stream �Է� �� 1.25f�� �Է��ϸ� ���� �߻�** > 1.25�� �Է�
    float ft = scan.nextFloat();
    System.out.println("4) "+ ft);
    // ft = 1.25;  // Error
    // ft = 1.25f; // f: float 4 byte
    
    double db = scan.nextDouble();
    System.out.println("5) "+ db);
    
    
    scan.close();
    
  }
}