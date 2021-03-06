package dev.mvc.categrp;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.ModelAndView;
 
@Controller // 패키지와 컨트롤러 등록시 자동으로 컨트롤러 등록
public class CategrpCont {
  @Autowired
  @Qualifier("dev.mvc.categrp.CategrpProc") // "Proc의 component"(한정자)를 호출해서 사용, CategrpProcInter를 찾기 시작한다.
  private CategrpProcInter categrpProc; // 여기에 DAO->Proc 빈 자동 생성해서 입력
  
  public CategrpCont() {
    System.out.println("    --> CategrpCont created");
  }
  
  //http://localhost:9090/resort/categrp/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/categrp/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/categrp/create"); //webapp/categrp/create.jsp
    
    return mav; // 포워드
  }
  
  //http://localhost:9090/resort/categrp/create.do
  /**
   * 등록 처리
   * @param categrpVO
   * @return
   */
  @RequestMapping(value="/categrp/create.do", method=RequestMethod.POST)
  public ModelAndView create(CategrpVO categrpVO) {
    //request.setAttribute("categrpVO", categrpVO); 자동 실행
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.categrpProc.create(categrpVO);
    mav.addObject("cnt", cnt); // request에 저장, request.setAttribute("cnt", cnt);
    
    // type 1
    // mav.setViewName("/categrp/create_msg"); //webapp/categrp/create_msg.jsp
    // 작성 완료 후 새로고침 시 데이터가 반복(중복)되어 계속 insert가 이루어짐
    // forward 기법
    
    // type2 setViewName("redirect:/") -> '?cnt=1'이 url 뒤에 붙음
    //mav.setViewName("redirect:/categrp/create_msg.jsp");
    // redirect기법, 예외적으로 사용 -> 끝에 JSP까지 붙여줘야 함
    // response.sendRedirect -> request 객체가 사라짐
    
    // 포워드
    // mav.addObject("categrpVO", categrpVO); // 필요 없음, 위에서 전달해줌(포워딩은 몇 번이고 request 객체를 전달한다.)
    mav.setViewName("/categrp/create_msg"); // webapp/categrp/create_msg.jsp
    
    return mav;
  }
  
  //http://localhost:9090/resort/categrp/list.do
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value="/categrp/list.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<CategrpVO> list = null;
    list = this.categrpProc.list_seqno_asc();
    
    mav.addObject("list", list); // request.setAttribute("list", list);
    
    mav.setViewName("/categrp/list"); // webapp/categrp/list.jsp
    return mav;
  }
  
  // http://localhost:9090/resort/categrp/read.do?categrpno=1
  /**
   * 한 건 조회, 수정 폼
   * @param categrpno 조회할 카테고리 번호
   * @return mav
   */
  @RequestMapping(value="/categrp/read_update.do", method=RequestMethod.GET)
  public ModelAndView read_update(int categrpno) { // 파라미터가 들어옴
    // request.setAttribute("categrpno", int categrpno) 작동 안됨
    
    ModelAndView mav = new ModelAndView();
    
    CategrpVO categrpVO = null;
    categrpVO = this.categrpProc.read(categrpno);
    
    mav.addObject("categrpVO", categrpVO);
    
    List<CategrpVO> list = null;
    list = this.categrpProc.list_seqno_asc();
    
    mav.addObject("list", list);
    
    mav.setViewName("/categrp/read_update"); // webapp/categrp/read_update.jsp
    
    return mav; // 포워드
    
  }
  
  //http://localhost:9090/resort/categrp/update.do?categrpno=1
  /**
   * 업데이트 처리
   * @param categrpno
   * @return 수정된 레코드 개수
   */
 @RequestMapping(value="/categrp/update.do", method=RequestMethod.POST)
 public ModelAndView update(CategrpVO categrpVO) { // 파라미터가 들어옴
   // CategrpVO categrpVO   <--   <form> 태그 값으로 자동 생성
   // request.setAttribute("categrpVO", categrpVO)
   ModelAndView mav = new ModelAndView();
   
   int cnt = this.categrpProc.update(categrpVO);
   mav.addObject("cnt", cnt);
   
   mav.setViewName("/categrp/update_msg.jsp"); // webapp/categrp/update_msg.jsp
   
   return mav;
 }
 
  //http://localhost:9090/resort/categrp/read_delete.do?categrpno=1
  /**
   * 한 건 조회, 삭제 폼
   * @param categrpno 조회할 카테고리 번호
   * @return mav
   */
  @RequestMapping(value="/categrp/read_delete.do", method=RequestMethod.GET)
  public ModelAndView read_delete(int categrpno) { // 파라미터가 들어옴
    ModelAndView mav = new ModelAndView();
    
    CategrpVO categrpVO = this.categrpProc.read(categrpno);
    mav.addObject("categrpVO", categrpVO);
    
    List<CategrpVO> list = this.categrpProc.list_seqno_asc();
    mav.addObject("list", list);
    
    mav.setViewName("/categrp/read_delete"); // webapp/categrp/read_delete.jsp
    
    return mav;
    
  }
  
  //http://localhost:9090/resort/categrp/delete.do?categrpno=1
  /**
   * 삭제 처리
   * @param categrpno 검색할 카테고리 번호
   * @return 삭제 처리된 레코드 개수
   */
  @RequestMapping(value="/categrp/delete.do", method=RequestMethod.POST)
  public ModelAndView delete(int categrpno) { // 파라미터가 들어옴
    ModelAndView mav = new ModelAndView();
    
    // 삭제 정보
    CategrpVO categrpVO = this.categrpProc.read(categrpno);
    mav.addObject("categrpVO", categrpVO); // --> 무엇을 삭제하지 못했는지 보여줌
    
    // 삭제 처리
    int cnt = this.categrpProc.delete(categrpno);
    
    mav.addObject("cnt", cnt);
    
    mav.setViewName("/categrp/delete_msg"); // webapp/categrp/delete_msg.jsp
    
    return mav;
  }
  
  // http://localhost:9090/resort/categrp/update_seqno_up.do?categrpno=1
  // http://localhost:9090/resort/categrp/update_seqno_up.do?categrpno=1000
  /**
   * 우선순위 상향, 10 ▷ 1
   * @param categrpno
   * @return 수정된 레코드 개수
   */
 @RequestMapping(value="/categrp/update_seqno_up.do", method=RequestMethod.GET)
 public ModelAndView update_seqno_up(int categrpno) { // 파라미터가 들어옴
   ModelAndView mav = new ModelAndView();
   
   int cnt = this.categrpProc.update_seqno_up(categrpno);// 우선 순위 상향 처리
   mav.addObject("cnt", cnt);
   
   CategrpVO categrpVO = this.categrpProc.read(categrpno);// 카테고리 그룹 정보
   mav.addObject("categrpVO", categrpVO); //request 객체에 저장
   
   mav.setViewName("/categrp/update_seqno_up_msg"); //webapp/categrp/update_seqno_up_msg.jsp
   
   return mav;
 }
 
 //http://localhost:9090/resort/categrp/update_seqno_down.do?categrpno=1
 /**
  * 우선순위 하향, 1 ▷ 10
  * @param categrpno
  * @return 수정된 레코드 개수
  */
  @RequestMapping(value="/categrp/update_seqno_down.do", method=RequestMethod.GET)
  public ModelAndView update_seqno_down(int categrpno) { // 파라미터가 들어옴
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.categrpProc.update_seqno_down(categrpno);
    mav.addObject("cnt", cnt);
    
    CategrpVO categrpVO = this.categrpProc.read(categrpno);
    mav.addObject("categrpVO", categrpVO);
    
    mav.setViewName("/categrp/update_seqno_down_msg");
    
    return mav;
    
  }
 
  //http://localhost:9090/resort/categrp/update_visible.do?categrpno=1
 /**
  * 출력 모드 변경 Y
  * @param categrpno
  * @return 수정된 레코드 개수
  */
  @RequestMapping(value="/categrp/update_visible.do", method=RequestMethod.GET)
  public ModelAndView update_visible(CategrpVO categrpVO) { // 파라미터가 들어옴
    //anchor로 보낸 파라미터도 자동으로 생성됨
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.categrpProc.update_visible(categrpVO);
    
    mav.setViewName("redirect:/categrp/list.do");
    
    return mav;
    
  }
  
}
