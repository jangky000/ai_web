package oop3;

import java.util.StringTokenizer;

public class Token2 {

  public static void main(String[] args) {
    StringTokenizer st = new StringTokenizer("봄, ,가을,겨울", ","); // 문자가 없으면 제외, 공백도 문자
    int count = st.countTokens();
    System.out.println(count);
    
    // 사용할 다음 단어가 존재하는지 검사, 다음 요소 있으면 true, 아니면 false
    while(st.hasMoreTokens()) { 
      System.out.println(st.nextToken());  // 단어 추출
    }
    
  }

}