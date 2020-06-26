package dev.mvc.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CouponCont {
  
  @Autowired
  @Qualifier("dev.mvc.coupon.CouponProc")
  private CouponProcInter couponProc;
  
  
  public CouponCont() {
    System.out.println("--> CouponCont created.");
  }
  
  //http://localhost:9090/team4/coupon/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/coupon/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/coupon/create"); // webapp/coupon/create.jsp
    return mav;
  }
  
 //http://localhost:9090/team4/coupon/create.do
 /**
  * 등록 처리
  * @param couponVO
  * @return
  */
 @RequestMapping(value="/coupon/create.do", method=RequestMethod.POST )
 public ModelAndView create(CouponVO couponVO) {
   ModelAndView mav = new ModelAndView();
   
   int cnt = this.couponProc.create(couponVO);

   mav.setViewName("redirect:/coupon/list.jsp"); // jsp파일명을 해당 주소로 파라미터 전달
   return mav;
 }

 /**
  * 주문 리스트
  * @return
  */
 @RequestMapping(value="/coupon/list.do", method=RequestMethod.GET)
 public ModelAndView list(){
   ModelAndView mav = new ModelAndView();
   
   List<CouponVO> list = this.couponProc.list();    
   mav.addObject("list", list);
   mav.setViewName("/coupon/list"); // webapp/coupon/list.jsp
   
   return mav; // forward
 }
 
 
}
