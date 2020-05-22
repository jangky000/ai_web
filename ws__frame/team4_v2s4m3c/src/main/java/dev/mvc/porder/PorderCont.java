package dev.mvc.porder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class PorderCont {
  
  @Autowired
  @Qualifier("dev.mvc.porder.PorderProc")
  private PorderProcInter PorderProc;

  public PorderCont() {
    System.out.println("--> PorderCont created.");
  }
  
  //http://localhost:9090/team4/porder/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/porder/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/porder/create"); // webapp/porder/create.jsp
    return mav;
  }
  
 //http://localhost:9090/team4/porder/create.do
 /**
  * 등록 처리
  * @param porderVO
  * @return
  */
 @RequestMapping(value="/porder/create.do", method=RequestMethod.POST )
 public ModelAndView create(PorderVO porderVO) {
   ModelAndView mav = new ModelAndView();
   
   int cnt = this.PorderProc.create(porderVO);
   
   mav.addObject("cnt", cnt); // redirect parameter 적용
   
   mav.addObject("url", "create_msg"); // 파일명: create_msg.jsp, redirect parameter 적용
   mav.setViewName("redirect:/porder/msg.do"); // jsp파일명을 해당 주소로 파라미터 전달
   
   return mav;
 }
 
 //http://localhost:9090/team4/porder/msg.do?
 /**
  * 메시지
  * @param url
  * @return
  */
 @RequestMapping(value="/porder/msg.do", method=RequestMethod.GET)
 public ModelAndView delete_msg(String url){
   ModelAndView mav = new ModelAndView();
   
   // 등록 처리 메시지: create_msg -> /porder/create_msg.jsp
   // 수정 처리 메시지: update_msg -> /porder/update_msg.jsp
   // 삭제 처리 메시지: delete_msg -> /porder/delete_msg.jsp
   mav.setViewName("/porder/" + url); // forward
   // cnt도 계속 get 방식 파라미터로 포워딩됨
   
   return mav; // forward
 }
 
}
