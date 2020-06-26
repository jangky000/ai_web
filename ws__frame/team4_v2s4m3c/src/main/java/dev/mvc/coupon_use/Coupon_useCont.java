package dev.mvc.coupon_use;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Coupon_useCont {
  
  @Autowired
  @Qualifier("dev.mvc.coupon_use.Coupon_useProc")
  private Coupon_useProcInter coupon_useProc;
  
  
  public Coupon_useCont() {
    System.out.println("--> Coupon_useCont created.");
  }
  
  //http://localhost:9090/team4/coupon_use/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/coupon_use/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/coupon_use/create"); // webapp/coupon_use/create.jsp
    return mav;
  }
  
 //http://localhost:9090/team4/coupon_use/create.do
 /**
  * 등록 처리
  * @param couponVO
  * @return
  */
 @RequestMapping(value="/coupon_use/create.do", method=RequestMethod.POST )
 public ModelAndView create(Coupon_useVO coupon_useVO) {
   ModelAndView mav = new ModelAndView();
   
   int cnt = this.coupon_useProc.create(coupon_useVO);

   mav.setViewName("redirect:/coupon_use/list.jsp"); // jsp파일명을 해당 주소로 파라미터 전달
   return mav;
 }

 /**
  * 주문 리스트
  * @return
  */
 @RequestMapping(value="/coupon_use/list.do", method=RequestMethod.GET)
 public ModelAndView list(){
   ModelAndView mav = new ModelAndView();
   
   List<Coupon_useVO> list = this.coupon_useProc.list();    
   mav.addObject("list", list);
   mav.setViewName("/coupon_use/list"); // webapp/coupon_use/list.jsp
   
   return mav; // forward
 }
 
 
}
