package forexam;
 
public class ForExam2 {
 
  public static void main(String[] args) {
    int odd = 0;  // È¦¼ö
    int even = 0; // Â¦¼ö
    
    for(int i=1; i<=100; i++) {
      if(i%2 == 1) {
        odd += i;
      } else {
        even+= i;
      }
    }
 
    System.out.println("Â¦¼öÀÇ ÇÕ: " + even);
    System.out.println("È¦¼öÀÇ ÇÕ: " + odd);
 
  }
 
}