package oop;
 
public class Mean {
  public void avg(int n1, int n2) {
    System.out.println( (n1 + n2) /2);
  }
  
  public void avg(int n1, int n2, int n3) {
    System.out.println( (n1 + n2 + n3) / 3 );
  }
  
  public void avg(double n1, double n2, double n3) {
    System.out.println( (int)(n1 + n2 + n3) / 3 );
  }
  
  public void avg(String name, int n1, int n2, int n3) {
    System.out.print(name + ": ");
    System.out.println( (n1 + n2 + n3) / 3 );
  }
  
  public void avg(int[] datas) {
    System.out.print("요소의 개수: " + datas.length + " / ");
    System.out.print("평균: ");
    int sum = 0;
    for(int i = 0; i < datas.length; i++) {
      sum += datas[i];
    }
    System.out.println(sum / datas.length);
  }
  
}