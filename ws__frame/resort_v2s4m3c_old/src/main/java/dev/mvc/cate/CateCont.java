package dev.mvc.cate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.categrp.CategrpProcInter;

@Controller
public class CateCont {
  // 부모 테이블
  @Autowired
  @Qualifier("dev.mvc.categrp.CategrpProc")
  private CategrpProcInter categrpProc;
  
  //자식 테이블
  @Autowired
  @Qualifier("dev.mvc.cate.CateProc")
  private CateProcInter cateProc;
  
  public CateCont() {
    System.out.println("   --> CateCont created");
  }
  
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/cate/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    
//    List<CategrpVO> list = this.categrpProc.list_categrpno_asc();
//    mav.addObject("list", list);
    
    mav.setViewName("/cate/create"); // webapp/cate/create.jsp
    
    return mav;
  }
  
  /**
   * 등록처리
   * @param cateVO
   * @return
   */
  @RequestMapping(value="/cate/create.do", method=RequestMethod.POST)
  public ModelAndView create(CateVO cateVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.cateProc.create(cateVO);
    mav.addObject("cnt", cnt); // GET 방식으로 보내짐
    
    if(cnt == 1) {
      mav.setViewName("/cate/create_msg");
    } else {
      mav.setViewName("/cate/create_msg"); // webapp/cate/create_msg.jsp
    }
    
    return mav;
  }
  
//http://localhost:9090/resort/cate/list.do
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value="/cate/list.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<CateVO> list = null;
    list = this.cateProc.list_seqno_asc();
    
    mav.addObject("list", list); // request.setAttribute("list", list);
    
    mav.setViewName("/cate/list"); // webapp/cate/list.jsp
    return mav;
  }
  
//http://localhost:9090/resort/cate/read_update.do?cateno=1
 /**
  * 한 건 조회, 수정 폼
  * @param cateno 조회할 카테고리 번호
  * @return mav
  */
 @RequestMapping(value="/cate/read_update.do", method=RequestMethod.GET)
 public ModelAndView read_update(int cateno) { // 파라미터가 들어옴
   
   ModelAndView mav = new ModelAndView();
   
   CateVO cateVO = null;
   cateVO = this.cateProc.read(cateno);
   
   mav.addObject("cateVO", cateVO);
   
   List<CateVO> list = null;
   list = this.cateProc.list_seqno_asc();
   
   mav.addObject("list", list);
   
   mav.setViewName("/cate/read_update"); // webapp/cate/read_update.jsp
   
   return mav; // 포워드
   
 }
 
 //http://localhost:9090/resort/cate/update.do?categrpno=1
 /**
  * 업데이트 처리
  * @param cateno
  * @return 수정된 레코드 개수
  */
@RequestMapping(value="/cate/update.do", method=RequestMethod.POST)
public ModelAndView update(CateVO cateVO) { // 파라미터가 들어옴
  ModelAndView mav = new ModelAndView();
  
  int cnt = this.cateProc.update(cateVO);
  mav.addObject("cnt", cnt);
  
  mav.setViewName("/cate/update_msg"); // webapp/cate/update_msg.jsp
  
  return mav;
}

//http://localhost:9090/resort/cate/read_delete.do?cateno=1
/**
 * 한 건 조회, 삭제 폼
 * @param cateno 조회할 카테고리 번호
 * @return mav
 */
@RequestMapping(value="/cate/read_delete.do", method=RequestMethod.GET)
public ModelAndView read_delete(int cateno) { // 파라미터가 들어옴
  ModelAndView mav = new ModelAndView();
  
  CateVO cateVO = this.cateProc.read(cateno);
  mav.addObject("cateVO", cateVO);
  
  List<CateVO> list = this.cateProc.list_seqno_asc();
  mav.addObject("list", list);
  
  mav.setViewName("/cate/read_delete"); // webapp/categrp/read_delete.jsp
  
  return mav;
  
}

//http://localhost:9090/resort/cate/delete.do?cateno=1
/**
 * 삭제 처리
 * @param cateno 검색할 카테고리 번호
 * @return 삭제 처리된 레코드 개수
 */
@RequestMapping(value="/cate/delete.do", method=RequestMethod.POST)
public ModelAndView delete(int cateno) { // 파라미터가 들어옴
  ModelAndView mav = new ModelAndView();
  
  // 삭제 정보
  CateVO cateVO = this.cateProc.read(cateno);
  mav.addObject("cateVO", cateVO); // --> 무엇을 삭제하지 못했는지 보여줌
  
  // 삭제 처리
  int cnt = this.cateProc.delete(cateno);
  
  mav.addObject("cnt", cnt);
  
  mav.setViewName("/cate/delete_msg"); // webapp/cate/delete_msg.jsp
  
  return mav;
}

// http://localhost:9090/resort/cate/update_seqno_up.do?cateno=1
// http://localhost:9090/resort/cate/update_seqno_up.do?cateno=1000
/**
 * 우선순위 상향, 10 ▷ 1
 * @param cateno
 * @return 수정된 레코드 개수
 */
@RequestMapping(value="/cate/update_seqno_up.do", method=RequestMethod.GET)
public ModelAndView update_seqno_up(int cateno) { // 파라미터가 들어옴
 ModelAndView mav = new ModelAndView();
 
 int cnt = this.cateProc.update_seqno_up(cateno);// 우선 순위 상향 처리
 mav.addObject("cnt", cnt);
 
 CateVO cateVO = this.cateProc.read(cateno);// 카테고리 그룹 정보
 mav.addObject("cateVO", cateVO); //request 객체에 저장
 
 mav.setViewName("/cate/update_seqno_up_msg"); //webapp/cate/update_seqno_up_msg.jsp
 
 return mav;
}

//http://localhost:9090/resort/cate/update_seqno_down.do?cateno=1
/**
* 우선순위 하향, 1 ▷ 10
* @param cateno
* @return 수정된 레코드 개수
*/
@RequestMapping(value="/cate/update_seqno_down.do", method=RequestMethod.GET)
public ModelAndView update_seqno_down(int cateno) { // 파라미터가 들어옴
  ModelAndView mav = new ModelAndView();
  
  int cnt = this.cateProc.update_seqno_down(cateno);
  mav.addObject("cnt", cnt);
  
  CateVO cateVO = this.cateProc.read(cateno);
  mav.addObject("cateVO", cateVO);
  
  mav.setViewName("/cate/update_seqno_down_msg");
  
  return mav;
  
}

//http://localhost:9090/resort/cate/update_visible.do?cateno=1
/**
* 출력 모드 변경 Y
* @param cateno
* @return 수정된 레코드 개수
*/
@RequestMapping(value="/cate/update_visible.do", method=RequestMethod.GET)
public ModelAndView update_visible(CateVO cateVO) { // 파라미터가 들어옴
  //anchor로 보낸 파라미터도 자동으로 생성됨
  ModelAndView mav = new ModelAndView();
  
  cateVO.setVisible(cateVO.getVisible().toUpperCase().equals("Y")?"N":"Y");
  
  int cnt = this.cateProc.update_visible(cateVO);
  
  mav.setViewName("redirect:/cate/list.do");
  
  return mav;
  
}
  
}
