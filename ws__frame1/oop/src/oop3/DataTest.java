package oop3;
 
public class DataTest {
 
  public static void main(String[] args) {
    Data data = new Data(2019, 2017);
    
    // object 클래스에서 상속 받은 메소드, hashCode를 호출
    // F3을 눌러 자세히 보면 native라는 명시가 있는데 이건 c로 만들어진 기능을 호출할 때 사용 -> 요즘엔 쓰이지 않음
    System.out.println("1) "+data.hashCode());
    System.out.println("2) "+data.su1 + " / " + data.su2);
    
    DataProcess dp = new DataProcess();
    // 객체를 전달
    dp.swap(data);
    
    System.out.println("4) " +data.su1 + " / " + data.su2);
  }
 
}