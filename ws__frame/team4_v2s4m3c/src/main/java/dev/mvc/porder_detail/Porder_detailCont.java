package dev.mvc.porder_detail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class Porder_detailCont {
  
  @Autowired
  @Qualifier("dev.mvc.porder_detail.Porder_detailProc")
  private Porder_detailProcInter porder_detailProc;

  public Porder_detailCont() {
    System.out.println("--> Porder_detailCont created.");
  }
  
  // 필요 없음
  //http://localhost:9090/team4/porder_detail/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/porder_detail/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/porder_detail/create"); // webapp/porder/create.jsp
    return mav;
  }
  
  
  // 필요 없음
  //http://localhost:9090/team4/porder/payment.do
  /**
   * 등록 폼, 장바구니 리스트에서 넘어옴
   * @return
   */
  @RequestMapping(value="/porder_detail/create.do", method=RequestMethod.POST )
  public ModelAndView payment(String[] shopping_cartno, Porder_detailVO porder_detailVO) {
    ModelAndView mav = new ModelAndView();
    // 디비에 접근하긴 해야할 듯, 조인도 필요할 듯, 계산도 다시해야 할 듯
    mav.addObject("shopping_cartlist", shopping_cartno);
    mav.addObject("porder_detailVO", porder_detailVO);
    mav.setViewName("/porder_detail/create"); // webapp/porder/create.jsp
    return mav;
  }
  
  //http://localhost:9090/team4/porder_detail/list.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/porder_detail/list.do", method=RequestMethod.GET )
  public ModelAndView list(@RequestParam(value="porderno", defaultValue="0") int porderno) {
    ModelAndView mav = new ModelAndView();
    
    if(porderno == 0) {
      List<Porder_detailVO> list = this.porder_detailProc.list();
      mav.addObject("list", list);
    }else {
      List<Porder_detailVO> list = this.porder_detailProc.list_by_porderno(porderno);
      mav.addObject("list", list);
    }
    
    mav.setViewName("/porder_detail/list"); // webapp/porder_detail/list.jsp
    return mav;
  }
 
}
