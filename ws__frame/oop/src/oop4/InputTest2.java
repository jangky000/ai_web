package oop4;
 
import java.util.Scanner;
/**
 * 문장 입력 시 발생하는 문제
 * @author soldesk
 *
 */
public class InputTest2 {
 
  public static void main(String[] args) {
    
    Scanner scan = new Scanner(System.in);
    System.out.print("사원 번호: ");
    // 정수, 숫자 + Enter 입력되고 숫자만 sano 변수에 할당됨, Enter는 메모리에 남겨짐!!!
    // int sano = scan.nextInt(); 
    
    // 정수, 문장을 입력받을 경우 권장, 숫자를 입력 받을 때도 문장으로 입력받아 형변환하여 사용
    int sano = Integer.parseInt(scan.nextLine());
    
    System.out.print("희망 직무: ");
    String job = scan.nextLine(); // 문장 입력
    
     System.out.print("수당: ");
     float incentive = Float.parseFloat(scan.nextLine());
    
    System.out.println("-----------------------------");
    System.out.println("사원 번호: " + sano);
    System.out.println("희망 직무: " + job);
    System.out.println("수당: " + incentive + " %");
    
    scan.close();
  }
 
}