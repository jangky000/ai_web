package oop4;
 
import java.util.Scanner;
 
public class InputTest {
  public static void main(String[] args) {
    Scanner scan = new Scanner(System.in);
    
    String str = scan.next(); // 하나의 문자열
    System.out.println("1) " + str);
    
    int year = scan.nextInt();
    System.out.println("2) "+ year);
    
    long sale = scan.nextLong();
    System.out.println("3) "+ sale);
    
    // Input Stream 입력 시 1.25f로 입력하면 에러 발생** > 1.25로 입력
    float ft = scan.nextFloat();
    System.out.println("4) "+ ft);
    // ft = 1.25;  // Error
    // ft = 1.25f; // f: float 4 byte
    
    double db = scan.nextDouble();
    System.out.println("5) "+ db);
    
    
    scan.close();
    
  }
}