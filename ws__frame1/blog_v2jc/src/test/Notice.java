package test;

import java.util.ArrayList;

import nation.web.notice1b.NoticeVO;

public class Notice {
  public ArrayList<NoticeVO> list(){
    ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
    
    NoticeVO noticeVO = new NoticeVO("������", "�н�", "�մ���", "1234");
    list.add(noticeVO);
    
    // ���� ��ü ������ �����ϴ��� ���Ӱ� �޸𸮰� �Ҵ�ǹǷ� �ٸ� ��ü 
    noticeVO = new NoticeVO("ȭ����", "����", "�Ʒι�", "1234");
    list.add(noticeVO);
    
    noticeVO = new NoticeVO("������", "��å", "������", "1234");
    list.add(noticeVO);
    
    return list;
  }
}