package oop2;

import java.util.Date;

class Movie{ // Object 클래스 자동 상속
//class Movie extends Object{
  //
}
 
public class InheTest4 {
 
  public static void main(String[] args) {
    Movie movie = new Movie();
    System.out.println(movie.hashCode());
//    Object obj = new Date();
//    Object obj2 = "JAVA";
  }
}