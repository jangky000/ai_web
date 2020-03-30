package network;
 
class User {  // 사용자
  private String name;
  private int point;
  
  public User() {  // 기본 생성자
    this.name = "손님";
    this.point = 1000;
  }
 
  public User(String name, int point) { // 인수있는 생성자
    this.name = name;
    this.point = point;
  }
  
  public void setName(String name){ // setter, 설정자
    // name의 값이 15자를 넘어가면 15자만 name 필드에 저장하세요.
    if (name.length() > 15) {
      this.name = name.substring(0, 15);  
    }else{
      this.name = name;
    }
  }
  
  public void setPoint(int point) {
    // 음수이면 0으로 처리
    if (point < 0) {
      this.point = 0;
    } else{
      this.point = point;  
    }
   
  }
  
  public String getName(){ // getter, 접근자
    return this.name;
  }
  
  public int getPoint(){
    return this.point;        
  }
 
}
 
class Act {  // 사용자 데이터 변경
  User user;
  
  public Act(User user){ // 생성자
    this.user = user;
  }
  
  // synchronized: 하나의 thread가 처리중이면 Lock이 걸려 다른 스레드는 대기해야함.
  public synchronized void increase() {
    int point = user.getPoint();
    point++;
    user.setPoint(point);
    System.out.println(user.getName() + ": " + user.getPoint());
  }
 
  public synchronized void decrease() {
    int point = user.getPoint();
    point--;
    user.setPoint(point);
    System.out.println(user.getName() + ": " + user.getPoint());
  }
}
 
class Play implements Runnable { // 동시 처리 기능 지원, Thread 구현
  private Act act;
  
  public Play(Act act) {
    this.act = act;
  }
  
  @Override // 부모 메소드 재정의, 추상 메소드 정의
  public void run() {
    for (int i=1; i<=5; i++) {
      act.increase();
      // act.decrease();
    }
  }
  
}
 
public class Thread3 {
  public static void main(String[] args) {
    User user1 = new User("왕눈이", 0); // 데이터 객체
    
    Act act = new Act(user1);              // 게임 기능
    
    Thread thread1 = new Thread(new Play(act));  // 연속적인 동작임으로 Thread
    thread1.start();  // run() 호출
 
    Thread thread2 = new Thread(new Play(act));
    thread2.start();
 
    Thread thread3 = new Thread(new Play(act));
    thread3.start();
  }
 
}