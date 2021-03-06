package test;

import java.util.ArrayList;

import nation.web.notice1b.NoticeVO;

public class NoticeTest {

  public static void main(String[] args) {
    ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
    
    NoticeVO noticeVO = new NoticeVO("월요일", "학습", "왕눈이", "1234");
    list.add(noticeVO);
    
    // 같은 객체 변수를 재사용하더라도 새롭게 메모리가 할당되므로 다른 객체 
    noticeVO = new NoticeVO("화요일", "복습", "아로미", "1234");
    list.add(noticeVO);
    
    noticeVO = new NoticeVO("수요일", "산책", "투투투", "1234");
    list.add(noticeVO);
    
    for(int i = 0; i<list.size(); i++) { // 0, 1, 2
      NoticeVO vo = list.get(i); // call by reference
      System.out.println(vo.getTitle() + " " + vo.getContent() + " " + vo.getRname() + " " + vo.getPasswd());
    }
    
    System.out.println("---------------------------------------------------------------");
    for(NoticeVO vo: list) {
      System.out.println(vo.getTitle() + " " + vo.getContent() + " " + vo.getRname() + " " + vo.getPasswd());
    }
    
    
  }

}
