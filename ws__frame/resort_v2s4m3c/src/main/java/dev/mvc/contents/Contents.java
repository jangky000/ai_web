package dev.mvc.contents;
 
public class Contents {
  // 상수 선언
  // 공통 변수를 두개 이상의 다른 클래스에서 참조해서 사용할 때
  // Contents.변수명으로 사용할 수 있음
  
  /** 페이지당 출력할 레코드 갯수 */
  public static int RECORD_PER_PAGE = 50;
  
  /** 블럭당 페이지 수, 하나의 블럭은 1개 이상의 페이지로 구성됨 */
  public static int PAGE_PER_BLOCK = 10;
  
}