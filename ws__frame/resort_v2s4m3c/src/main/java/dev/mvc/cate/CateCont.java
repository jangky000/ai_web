package dev.mvc.cate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.categrp.CategrpProcInter;
import dev.mvc.categrp.CategrpVO;

@Controller
public class CateCont {
  @Autowired
  @Qualifier("dev.mvc.categrp.CategrpProc")
  private CategrpProcInter categrpProc;

  @Autowired
  @Qualifier("dev.mvc.cate.CateProc")
  private CateProcInter cateProc;
  
  public CateCont() {
    System.out.println("--> CateCont created.");
  }
  
  // http://localhost:9090/resort/cate/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/cate/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cate/create"); // webapp/cate/create.jsp
    
    return mav;
  }
  
  // http://localhost:9090/resort/cate/create.do
  /**
   * 등록 처리
   * @param cateVO
   * @return
   */
  @RequestMapping(value="/cate/create.do", method=RequestMethod.POST )
  public ModelAndView create(CateVO cateVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.cateProc.create(cateVO);
    mav.addObject("cnt", cnt); // request에 저장
    
    if (cnt == 1) {
      mav.setViewName("/cate/create_msg"); // webapp/cate/create_msg.jsp
      // mav.setViewName("redirect:/cate/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/cate/create_msg"); // webapp/cate/create_msg.jsp
    }
    
    return mav;
  }
  
  // http://localhost:9090/resort/cate/list.do
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value="/cate/list.do", method=RequestMethod.GET )
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<CateVO> list = this.cateProc.list_seqno_asc();
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/cate/list"); // webapp/cate/list.jsp
    return mav;
  }
  
  // http://localhost:9090/resort/cate/read_update.do
  /**
   * 조회 + 수정폼
   * @param cateno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/cate/read_update.do", method=RequestMethod.GET )
  public ModelAndView read_update(int cateno) {
    // request.setAttribute("cateno", int cateno) 작동 안됨.
    
    ModelAndView mav = new ModelAndView();
    
    CateVO cateVO = this.cateProc.read(cateno);
    mav.addObject("cateVO", cateVO);  // request 객체에 저장
    
    List<CateVO> list = this.cateProc.list_seqno_asc();
    mav.addObject("list", list);  // request 객체에 저장

    mav.setViewName("/cate/read_update"); // webapp/cate/read_update.jsp
    return mav; // forward
  }
  
  // http://localhost:9090/resort/cate/update.do
  /**
   * 수정 처리
   * @param cateVO
   * @return
   */
  @RequestMapping(value="/cate/update.do", method=RequestMethod.POST )
  public ModelAndView update(CateVO cateVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.cateProc.update(cateVO);
    mav.addObject("cnt", cnt); // request에 저장
    
    if (cnt == 1) {
      // mav.setViewName("/cate/update_msg"); // webapp/cate/update_msg.jsp
      mav.setViewName("redirect:/cate/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/cate/update_msg"); // webapp/cate/update_msg.jsp
    }
    
    return mav;
  }
  
  // http://localhost:9090/resort/cate/read_delete.do
  /**
   * 조회 + 삭제폼
   * @param cateno 삭제할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/cate/read_delete.do", method=RequestMethod.GET )
  public ModelAndView read_delete(int cateno) {
    // request.setAttribute("cateno", int cateno) 작동 안됨.
    
    ModelAndView mav = new ModelAndView();
    
    CateVO cateVO = this.cateProc.read(cateno);
    mav.addObject("cateVO", cateVO);  // request 객체에 저장
    
    List<CateVO> list = this.cateProc.list_seqno_asc();
    mav.addObject("list", list);  // request 객체에 저장

    mav.setViewName("/cate/read_delete"); // webapp/cate/read_delete.jsp
    return mav; // forward
  }
  
  // http://localhost:9090/resort/cate/delete.do
  /**
   * 삭제 처리
   * @param cateVO
   * @return
   */
  @RequestMapping(value="/cate/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(int cateno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.cateProc.delete(cateno);
    mav.addObject("cnt", cnt); // request에 저장
    
    if (cnt == 1) {
      // mav.setViewName("/cate/delete_msg"); // webapp/cate/delete_msg.jsp
      mav.setViewName("redirect:/cate/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/cate/delete_msg"); // webapp/cate/delete_msg.jsp
    }
    
    return mav;
  }
  
  // http://localhost:9090/resort/cate/update_seqno_up.do?cateno=1
  /**
   * 우선순위 상향 up 10 ▷ 1
   * @param cateno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/cate/update_seqno_up.do", 
                              method=RequestMethod.GET )
  public ModelAndView update_seqno_up(int cateno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.cateProc.update_seqno_up(cateno);  // 우선 순위 상향 처리

    mav.setViewName("redirect:/cate/list.do"); 
    return mav;
  }  

  // http://localhost:9090/resort/cate/update_seqno_down.do?cateno=1
  /**
   * 우선순위 하향 up 1 ▷ 10
   * @param cateno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/cate/update_seqno_down.do", 
                              method=RequestMethod.GET )
  public ModelAndView update_seqno_down(int cateno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.cateProc.update_seqno_down(cateno);  // 우선 순위 상향 처리

    mav.setViewName("redirect:/cate/list.do"); 
    return mav;
  }  
  
  /**
   * 출력 모드의 변경
   * @param cateVO
   * @return
   */
  @RequestMapping(value="/cate/update_visible.do", 
      method=RequestMethod.GET )
  public ModelAndView update_visible(CateVO cateVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.cateProc.update_visible(cateVO);
    
    if (cnt == 0) {
      mav.setViewName("redirect:/cate/list.do"); // request 객체가 전달이 안됨. 
    } else {
      String name = this.cateProc.read(cateVO.getCateno()).getName();
      mav.addObject("name", name);
      mav.setViewName("/cate/update_visible_msg"); //  /cate/update_visible_msg.jsp
    }
    return mav;
  }  
  
}






