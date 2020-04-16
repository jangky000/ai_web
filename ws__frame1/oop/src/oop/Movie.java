package oop;
 
public class Movie {
  //메소드 오버로딩
  public void print(String name) {
    System.out.println("영화명: " + name);
    System.out.println("----------------------");
  }
  public void print(String name, String genre) {
    System.out.println("영화명: " + name);
    System.out.println("장   르: " + genre);
    System.out.println("----------------------");
  }
  
  public void print(String name, String genre, int long_time) {
    System.out.println("영화명: " + name);
    System.out.println("장   르: " + genre);
    System.out.println("시   간: " + long_time);
    System.out.println("----------------------");
  }
  
  public void print(String name, String genre, int long_time, double score, int open) {
    System.out.println("영화명: " + name);
    System.out.println("장   르: " + genre);
    System.out.println("시   간: " + long_time);
    System.out.println("평   점: " + score);
    System.out.println("개   봉: " + open);
    System.out.println("----------------------");
  }
  
  public void print(String name, String[] actors) {
    System.out.println("영화명: " + name);
    System.out.print("주   연:  ");
    for(int i =0; i<actors.length; i++) {
      System.out.print(actors[i] + " ");
    }
    System.out.println();
    System.out.println("----------------------");
  }
  public void print2(String name, String[] actors) {
    System.out.println("영화명: " + name);
    System.out.print("주   연:  ");
    if(actors.length == 0) {
      System.out.println("배우 없음");
    } else {
      //방법 1
      for(int i =0; i<actors.length-1; i++) {
        System.out.print(actors[i] + ", ");
      }
      System.out.println(actors[actors.length-1]);
      
      //혹은(for와 if를 활용) 의미 파악이 더 좋음
      for(int i =0; i<actors.length-1; i++) {
        System.out.print(actors[i]);
        if(i < actors.length - 1) {
          System.out.print(", ");
        }
      }
      
    }
    
    System.out.println("----------------------");
  }
  
}