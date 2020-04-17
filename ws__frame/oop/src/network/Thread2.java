package network;
 
public class Thread2 {
 
  public static void main(String[] args) {
    // sleep
    int second = 0;
    int minute = 0;
    
    while(true) {
      try {
        Thread.sleep(1000); // 1000 = 1초
        second = second + 1;
        System.out.println("현재 경과된 시험 시간: " + minute + " 분" + second + " 초");
        
        if (second == 60) {
          minute = minute + 1;
          second = 0;
        }
        
      } catch (InterruptedException e) {
        e.printStackTrace();
      }
    }
    

  }
  
}