package oop3;
 
public class DataProcess {
  public DataProcess() {
    
  }
  public void swap(Data data) {
    // 데이터 클래스의 해시코드(객체)를 전달 받음, 해시코드가 동일하다
    // 메모리를 공유한다 -> 메모리 절약
    System.out.println("3) " + data.hashCode());
    
    int tmp = data.su1;
    data.su1 = data.su2;
    data.su2 = tmp;
  }
}