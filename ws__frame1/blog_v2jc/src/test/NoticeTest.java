package test;

import java.util.ArrayList;

import nation.web.notice1b.NoticeVO;

public class NoticeTest {

  public static void main(String[] args) {
    ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
    
    NoticeVO noticeVO = new NoticeVO("������", "�н�", "�մ���", "1234");
    list.add(noticeVO);
    
    // ���� ��ü ������ �����ϴ��� ���Ӱ� �޸𸮰� �Ҵ�ǹǷ� �ٸ� ��ü 
    noticeVO = new NoticeVO("ȭ����", "����", "�Ʒι�", "1234");
    list.add(noticeVO);
    
    noticeVO = new NoticeVO("������", "��å", "������", "1234");
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