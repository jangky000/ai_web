package nation.web.notice1d;

import java.util.ArrayList;

public class NoticeProc {
  NoticeDAO noticeDAO = null;
  
  // 기본 생성자
  public NoticeProc() {
    noticeDAO = new NoticeDAO();
  }
  
  /**
   * 등록
   * @param noticeVO
   * @return 등록된 레코드 개수
   */
  //call by reference로 한번에 여러 정보를 받음
  public int create(NoticeVO noticeVO) {
    int count = 0;
    count = this.noticeDAO.create(noticeVO);
    return count;
  }

  /**
   * 목록
   * @return VO 목록(ArrayList<NoticeVO>)
   */
  // 목록은 ArrayList를 사용하여 개발
  public ArrayList<NoticeVO> list(){
    ArrayList<NoticeVO> list = null;
    list = this.noticeDAO.list();
    return list;
  }
  
  /**
   * 페이지 목록, 페이징
   * 1 페이지: startNum = 1, endNum = 10
   * 2 페이지: startNum = 11, endNum = 20
   * 3 페이지: startNum = 21, endNum = 30
   * @param nowPage 1부터 시작, 현재 페이지
   * @param recordPerPage 페이지당 레코드 출력 수
   * @return VO 목록(ArrayList<NoticeVO>)
   */
  // 페이징 알고리즘을 여기서 구현해야 함
  public ArrayList<NoticeVO> list(int nowPage, int recordPerPage){
    ArrayList<NoticeVO> list = null;
    int startNum = (nowPage-1)*recordPerPage+1;
    int endNum = nowPage*recordPerPage;
    list = noticeDAO.list(startNum, endNum);
    return list;
  }
  
  /**
   * 1건의 레코드 조회
   * @param noticeno 레코드 번호 PK
   * @return 1건의 레코드(NoticeVO)
   */
  public NoticeVO read(int noticeno) {
    NoticeVO noticeVO = null;
    noticeVO = this.noticeDAO.read(noticeno);
    return noticeVO;
  }
  
  /**
   * 패스워드 검사
   * @param noticeno PK
   * @param passwd 패스워드
   * @return true 패스워드 일치
   */
  public boolean passwdCheck(int noticeno, String passwd) {
    boolean sw = false;
    sw = this.noticeDAO.passwdCheck(noticeno, passwd);
    return sw;
  }
  
  /**
   * 수정
   * @param noticeVO 수정할 내용
   * @return 수정된 레코드 개수 0 or 1
   */
  public int update( NoticeVO noticeVO ) {
    int count = 0;
    count = this.noticeDAO.update(noticeVO);
    return count;
  }
  
  /**
   * 삭제
   * @param noticeno 삭제할 PK
   * @return 삭제된 레코드 개수
   */
  public int delete(int noticeno) {
    int count = 0;
    count = this.noticeDAO.delete(noticeno);
    return count;
  }
  
  /** 
   * 목록용 파일을 설정하며 SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param listFile            목록 파일명 예) list.jsp
   * @param nowPage        현재 페이지
   * @param recordPerPage 페이지당 레코드 수
   * @return 페이징 생성 문자열
   */ 
  public String pagingBox(String listFile, int nowPage, int recordPerPage){
    int recordCount = this.noticeDAO.count(); // 레코드의 총 개수
    int pagePerBlock = 10; // 블럭당 페이지 수, 레코드 < 페이지 < 블럭 
    
    // 현재 450개의 레코드 존재한다고 가정, 1개의 레코드만 있어도 1페이지로 처리
    // totalPage = 451 / 10 -> 45.1 -> 46개의 페이지
    int totalPage = (int)(Math.ceil((double)recordCount/recordPerPage)); // 전체 페이지
    
    // 페이지수 46 / 10 -> 4.6 -> 5개의 그룹, 1개의 페이지만 있어도 1개의 그룹으로 처리
    int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock)); // 전체 그룹 
    
    // 현재 5 페이지   / 10 -> 0.5 -> 1 그룹
    // 현재 15 페이지 / 10 -> 1.5 -> 2 그룹
    // 현재 25 페이지 / 10 -> 2.5 -> 3 그룹
    int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));  // 현재 그룹 
    
    // 1 group: ((1 - 1) * 10) + 1 -> start Page: 1
    //              (1 * 10)              -> end Page: 10
    
    // 2 group: ((2 - 1) * 10) + 1 -> start Page: 11
    //              (2 * 10)              -> end Page: 20
 
    // 3 group: ((3 - 1) * 10) + 1 -> start Page: 21
    //              (2 * 10)              -> end Page: 30
    
    int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작  
    int endPage = (nowGrp * pagePerBlock);              // 특정 그룹의 페이지 목록 종료   
     
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
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: #668db4;"); 
    str.append("    color: #FFFFFF;"); 
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
//    str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
 
    int _nowPage = (nowGrp-1) * pagePerBlock; // 10개 이전 페이지로 이동 
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='./"+listFile+"?nowPage="+_nowPage+"&recordPerPage="+recordPerPage+"'>이전</A></span>"); 
    } 
 
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ // 마지막 페이지를 초과했는지 체크하여 for문 종료 
        break; 
      } 
  
      if (nowPage == i){ // 현재 페이지는 CSS를 강조함. 
        str.append("<span class='span_box_2'>"+i+"</span>"); 
      }else{                   // 다른 페이지는 기본 CSS를 적용함.
        str.append("<span class='span_box_1'><A href='./"+listFile+"?nowPage="+i+"&recordPerPage="+recordPerPage+"'>"+i+"</A></span>");   
      } 
    } 
     
    _nowPage = (nowGrp * pagePerBlock)+1; // 10개 다음 페이지로 이동 
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='./"+listFile+"?nowPage="+_nowPage+"&recordPerPage="+recordPerPage+"'>다음</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  } 
  
  /** 
   * 목록용 파일을 설정하며 텍스트기반 페이징 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param listFile 목록 파일명
   * @param nowPage     현재 페이지
   * @param recordPerPage 페이지당 레코드 수
   * @return 페이징 생성 문자열
   */ 
  public String pagingText(String listFile, int nowPage, int recordPerPage){ 
    int recordCount = this.noticeDAO.count(); // 검색 갯수
    int pagePerBlock = 10; // 블럭당 페이지 수, 블럭: 페이지들의 집합 
    int totalPage = (int)(Math.ceil((double)recordCount/recordPerPage)); // 전체 페이지  
    int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));   // 전체 그룹 
    int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // 현재 그룹 
    int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작  
    int endPage = (nowGrp * pagePerBlock);              // 특정 그룹의 페이지 목록 종료   
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:underline; background-color: #ffffff; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none; font-size: 1em;}"); 
    str.append("</style>"); 
 
    str.append("<DIV id='paging'>"); 
//    str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
 
    int _nowPage = (nowGrp-1) * pagePerBlock; // 10개 이전 페이지로 이동 
    if (nowGrp >= 2){ 
      str.append("[<A href='./"+listFile+"?nowPage="+_nowPage+"&recordPerPage="+recordPerPage+"'>이전</A>]"); 
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
     
    _nowPage = (nowGrp * pagePerBlock)+1; // 10개 다음 페이지로 이동 
    if (nowGrp < totalGrp){ 
      str.append(" [<A href='./"+listFile+"?nowPage="+_nowPage+"&recordPerPage="+recordPerPage+"'>다음</A>] "); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  } 
  
  /**
   * 전체 레코드 수
   * @return 레코드 수
   */
  public int count() {
    return this.noticeDAO.count();
  }
  
}
