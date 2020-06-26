package dev.mvc.coupon_issue;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Coupon_issueCont {
  
  @Autowired
  @Qualifier("dev.mvc.coupon_issue.Coupon_issueProc")
  private Coupon_issueProcInter coupon_issueProc;
  
  
  public Coupon_issueCont() {
    System.out.println("--> Coupon_issueCont created.");
  }
  
  //http://localhost:9090/team4/coupon_issue/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/coupon_issue/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/coupon_issue/create"); // webapp/coupon_issue/create.jsp
    return mav;
  }
  
 //http://localhost:9090/team4/coupon_issue/create.do
 /**
  * 등록 처리
  * @param couponVO
  * @return
  */
 @RequestMapping(value="/coupon_issue/create.do", method=RequestMethod.POST )
 public ModelAndView create(Coupon_issueVO coupon_issueVO) {
   ModelAndView mav = new ModelAndView();
   
   int cnt = this.coupon_issueProc.create(coupon_issueVO);

   mav.setViewName("redirect:/coupon_issue/list.jsp"); // jsp파일명을 해당 주소로 파라미터 전달
   return mav;
 }

 /**
  * 주문 리스트
  * @return
  */
 @RequestMapping(value="/coupon_issue/list.do", method=RequestMethod.GET)
 public ModelAndView list(){
   ModelAndView mav = new ModelAndView();
   
   List<Coupon_issueVO> list = this.coupon_issueProc.list();    
   mav.addObject("list", list);
   mav.setViewName("/coupon_issue/list"); // webapp/coupon_issue/list.jsp
   
   return mav; // forward
 }
 
 
}
