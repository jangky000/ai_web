package nation.web.notice1d;

import java.util.ArrayList;

public class NoticeProc {
  NoticeDAO noticeDAO = null;
  
  // �⺻ ������
  public NoticeProc() {
    noticeDAO = new NoticeDAO();
  }
  
  /**
   * ���
   * @param noticeVO
   * @return ��ϵ� ���ڵ� ����
   */
  //call by reference�� �ѹ��� ���� ������ ����
  public int create(NoticeVO noticeVO) {
    int count = 0;
    count = this.noticeDAO.create(noticeVO);
    return count;
  }

  /**
   * ���
   * @return VO ���(ArrayList<NoticeVO>)
   */
  // ����� ArrayList�� ����Ͽ� ����
  public ArrayList<NoticeVO> list(){
    ArrayList<NoticeVO> list = null;
    list = this.noticeDAO.list();
    return list;
  }
  
  /**
   * ������ ���, ����¡
   * 1 ������: startNum = 1, endNum = 10
   * 2 ������: startNum = 11, endNum = 20
   * 3 ������: startNum = 21, endNum = 30
   * @param nowPage 1���� ����, ���� ������
   * @param recordPerPage �������� ���ڵ� ��� ��
   * @return VO ���(ArrayList<NoticeVO>)
   */
  // ����¡ �˰������� ���⼭ �����ؾ� ��
  public ArrayList<NoticeVO> list(int nowPage, int recordPerPage){
    ArrayList<NoticeVO> list = null;
    int startNum = (nowPage-1)*recordPerPage+1;
    int endNum = nowPage*recordPerPage;
    list = noticeDAO.list(startNum, endNum);
    return list;
  }
  
  /**
   * 1���� ���ڵ� ��ȸ
   * @param noticeno ���ڵ� ��ȣ PK
   * @return 1���� ���ڵ�(NoticeVO)
   */
  public NoticeVO read(int noticeno) {
    NoticeVO noticeVO = null;
    noticeVO = this.noticeDAO.read(noticeno);
    return noticeVO;
  }
  
  /**
   * �н����� �˻�
   * @param noticeno PK
   * @param passwd �н�����
   * @return true �н����� ��ġ
   */
  public boolean passwdCheck(int noticeno, String passwd) {
    boolean sw = false;
    sw = this.noticeDAO.passwdCheck(noticeno, passwd);
    return sw;
  }
  
  /**
   * ����
   * @param noticeVO ������ ����
   * @return ������ ���ڵ� ���� 0 or 1
   */
  public int update( NoticeVO noticeVO ) {
    int count = 0;
    count = this.noticeDAO.update(noticeVO);
    return count;
  }
  
  /**
   * ����
   * @param noticeno ������ PK
   * @return ������ ���ڵ� ����
   */
  public int delete(int noticeno) {
    int count = 0;
    count = this.noticeDAO.delete(noticeno);
    return count;
  }
  
  /** 
   * ��Ͽ� ������ �����ϸ� SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param listFile            ��� ���ϸ� ��) list.jsp
   * @param nowPage        ���� ������
   * @param recordPerPage �������� ���ڵ� ��
   * @return ����¡ ���� ���ڿ�
   */ 
  public String pagingBox(String listFile, int nowPage, int recordPerPage){
    int recordCount = this.noticeDAO.count(); // ���ڵ��� �� ����
    int pagePerBlock = 10; // ������ ������ ��, ���ڵ� < ������ < ���� 
    
    // ���� 450���� ���ڵ� �����Ѵٰ� ����, 1���� ���ڵ常 �־ 1�������� ó��
    // totalPage = 451 / 10 -> 45.1 -> 46���� ������
    int totalPage = (int)(Math.ceil((double)recordCount/recordPerPage)); // ��ü ������
    
    // �������� 46 / 10 -> 4.6 -> 5���� �׷�, 1���� �������� �־ 1���� �׷����� ó��
    int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock)); // ��ü �׷� 
    
    // ���� 5 ������   / 10 -> 0.5 -> 1 �׷�
    // ���� 15 ������ / 10 -> 1.5 -> 2 �׷�
    // ���� 25 ������ / 10 -> 2.5 -> 3 �׷�
    int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));  // ���� �׷� 
    
    // 1 group: ((1 - 1) * 10) + 1 -> start Page: 1
    //              (1 * 10)              -> end Page: 10
    
    // 2 group: ((2 - 1) * 10) + 1 -> start Page: 11
    //              (2 * 10)              -> end Page: 20
 
    // 3 group: ((3 - 1) * 10) + 1 -> start Page: 21
    //              (2 * 10)              -> end Page: 30
    
    int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * pagePerBlock);              // Ư�� �׷��� ������ ��� ����   
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
    str.append("    text-align: center;");    
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: #668db4;"); 
    str.append("    color: #FFFFFF;"); 
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
//    str.append("���� ������: " + nowPage + " / " + totalPage + "  "); 
 
    int _nowPage = (nowGrp-1) * pagePerBlock; // 10�� ���� �������� �̵� 
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='./"+listFile+"?nowPage="+_nowPage+"&recordPerPage="+recordPerPage+"'>����</A></span>"); 
    } 
 
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ // ������ �������� �ʰ��ߴ��� üũ�Ͽ� for�� ���� 
        break; 
      } 
  
      if (nowPage == i){ // ���� �������� CSS�� ������. 
        str.append("<span class='span_box_2'>"+i+"</span>"); 
      }else{                   // �ٸ� �������� �⺻ CSS�� ������.
        str.append("<span class='span_box_1'><A href='./"+listFile+"?nowPage="+i+"&recordPerPage="+recordPerPage+"'>"+i+"</A></span>");   
      } 
    } 
     
    _nowPage = (nowGrp * pagePerBlock)+1; // 10�� ���� �������� �̵� 
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='./"+listFile+"?nowPage="+_nowPage+"&recordPerPage="+recordPerPage+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  } 
  
  /** 
   * ��Ͽ� ������ �����ϸ� �ؽ�Ʈ��� ����¡ ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param listFile ��� ���ϸ�
   * @param nowPage     ���� ������
   * @param recordPerPage �������� ���ڵ� ��
   * @return ����¡ ���� ���ڿ�
   */ 
  public String pagingText(String listFile, int nowPage, int recordPerPage){ 
    int recordCount = this.noticeDAO.count(); // �˻� ����
    int pagePerBlock = 10; // ������ ������ ��, ����: ���������� ���� 
    int totalPage = (int)(Math.ceil((double)recordCount/recordPerPage)); // ��ü ������  
    int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));   // ��ü �׷� 
    int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // ���� �׷� 
    int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * pagePerBlock);              // Ư�� �׷��� ������ ��� ����   
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:underline; background-color: #ffffff; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none; font-size: 1em;}"); 
    str.append("</style>"); 
 
    str.append("<DIV id='paging'>"); 
//    str.append("���� ������: " + nowPage + " / " + totalPage + "  "); 
 
    int _nowPage = (nowGrp-1) * pagePerBlock; // 10�� ���� �������� �̵� 
    if (nowGrp >= 2){ 
      str.append("[<A href='./"+listFile+"?nowPage="+_nowPage+"&recordPerPage="+recordPerPage+"'>����</A>]"); 
    } 
 
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ 
        break; 
      } 
  
      if (nowPage == i){ 
        str.append(" <span style='font-size: 1.2em; font-weight: bold; background-color: #EEEEFF; padding-left: 2px; padding-right: 2px;'>"+i+"</span> "); 
      }else{ 
        str.append(" <A href='./"+listFile+"?nowPage="+i+"&recordPerPage="+recordPerPage+"'>"+i+"</A> ");   
      } 
    } 
     
    _nowPage = (nowGrp * pagePerBlock)+1; // 10�� ���� �������� �̵� 
    if (nowGrp < totalGrp){ 
      str.append(" [<A href='./"+listFile+"?nowPage="+_nowPage+"&recordPerPage="+recordPerPage+"'>����</A>] "); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  } 
  
  /**
   * ��ü ���ڵ� ��
   * @return ���ڵ� ��
   */
  public int count() {
    return this.noticeDAO.count();
  }
  
}