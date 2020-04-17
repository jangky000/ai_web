package network;

// 인터페이스
class Three implements Runnable{
  private String name;
 
  public Three(String name){
    this.name = name;
  }
  
  @Override
  public void run(){
    for (int i=0 ;i<5; i++){
      System.out.println(i + ": " + name);
    }
  }
}
 
public class Thread1 {
 
  public static void main(String[] args) {
    Three three1 = new Three("캐리어 공격");
    Thread thread1 = new Thread(three1);// 스레드 객체 생성
    thread1.start(); // 스레드 시작 -> run() 호출
    
    Three three2 = new Three("드라군 공격");
    Thread thread2 = new Thread(three2);
    thread2.start();
    
    Three three3 = new Three("스카우트 공격");
    Thread thread3 = new Thread(three3);
    thread3.start();
  }
} 