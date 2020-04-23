package dev.mvc.categrp;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    
    return mav;
  }
  
  //http://localhost:9090/resort/categrp/create.do
  /**
   * 등록 처리
   * @param categrpVO
   * @return
   */
  @RequestMapping(value="/categrp/create.do", method=RequestMethod.POST)
  public ModelAndView create(CategrpVO categrpVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.categrpProc.create(categrpVO);
    mav.addObject("cnt", cnt); // request에 저장
    
    // type 1
    // mav.setViewName("/categrp/create_msg"); //webapp/categrp/create_msg.jsp
    // 작성 완료 후 새로고침 시 데이터가 반복(중복)되어 계속 insert가 이루어짐
    // forward 기법
    
    // type2 setViewName("redirect:/") -> '?cnt=1'이 url 뒤에 붙음
    mav.setViewName("redirect:/categrp/create_msg.jsp");
    // redirect기법, 예외적으로 사용 -> 끝에 JSP까지 붙여줘야 함
    // response.sendRedirect -> request 객체가 사라짐
    
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
    list = this.categrpProc.list_categrpno_asc();
    
    mav.addObject("list", list);
    
    mav.setViewName("/categrp/list"); // webapp/categrp/list.jsp
    return mav;
  }
  
  // http://localhost:9090/ojt/categrp/read.do?categrpno=1
  /**
   * 한 건 조회, 수정 폼
   * @param categrpno 조회할 카테고리 번호
   * @return mav
   */
  @RequestMapping(value="/categrp/read_update.do", method=RequestMethod.GET)
  public ModelAndView read_update(int categrpno) { // 파라미터가 들어옴
    ModelAndView mav = new ModelAndView();
    
    CategrpVO categrpVO = null;
    categrpVO = this.categrpProc.read(categrpno);
    
    mav.addObject("categrpVO", categrpVO);
    
    List<CategrpVO> list = null;
    list = this.categrpProc.list_categrpno_asc();
    
    mav.addObject("list", list);
    
    mav.setViewName("/categrp/read_update"); // webapp/categrp/read_update.jsp
    
    return mav;
    
  }
  
 //http://localhost:9090/ojt/categrp/update.do?categrpno=1
  /**
   * 업데이트 처리
   * @param categrpno
   * @return 수정된 레코드 개수
   */
 @RequestMapping(value="/categrp/update.do", method=RequestMethod.POST)
 public ModelAndView update(CategrpVO categrpVO) { // 파라미터가 들어옴
   ModelAndView mav = new ModelAndView();
   
   int cnt = this.categrpProc.update(categrpVO);
   
   mav.addObject("cnt", cnt);
   
   //mav.setViewName("/categrp/update");
   mav.setViewName("redirect:/categrp/update_msg.jsp"); // webapp/categrp/update_msg.jsp
   // redirect기법으로 처리
   
   return mav;
   
 }
}
