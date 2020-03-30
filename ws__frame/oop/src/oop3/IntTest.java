package oop3;
 
public class IntTest {
 
  public static void main(String[] args) {
    System.out.println(1024); // 1 KB ~
    System.out.println(1024 * 1024); // 1 MB ~
    System.out.println(1024 * 1024 * 1024); // 1 GB ~ 
    System.out.println(1024 * 1024 * 1024*2-1); // 32bit에서 가장 큰 값
    System.out.println(1024 * 1024 * 1024 * 1024); // 1 TB ~
    System.out.println("---------------------------------");
    System.out.println(1024L * 1024 * 1024 * 1024); // 1 TB ~
    System.out.println(1024L * 1024 * 1024 * 1024 * 1024); // 1 PB ~
    
    System.out.println("-----------------------------------");
    Tool tool = new Tool();
    System.out.println( tool.unit(10000000000L) );
  }
 
}