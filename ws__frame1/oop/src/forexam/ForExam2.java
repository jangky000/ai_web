package forexam;
 
public class ForExam2 {
 
  public static void main(String[] args) {
    int odd = 0;  // Ȧ��
    int even = 0; // ¦��
    
    for(int i=1; i<=100; i++) {
      if(i%2 == 1) {
        odd += i;
      } else {
        even+= i;
      }
    }
 
    System.out.println("¦���� ��: " + even);
    System.out.println("Ȧ���� ��: " + odd);
 
  }
 
}