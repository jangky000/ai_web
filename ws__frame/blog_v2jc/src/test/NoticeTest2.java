package test;

import java.util.ArrayList;

import nation.web.notice1b.NoticeVO;

public class NoticeTest2 {

  public static void main(String[] args) {
    
    ArrayList<NoticeVO> list = new Notice().list();

    for(NoticeVO vo: list) {
      System.out.println(vo.getTitle() + " " + vo.getContent() + " " + vo.getRname() + " " + vo.getPasswd());
    }
    
    
    
    
  }

}
