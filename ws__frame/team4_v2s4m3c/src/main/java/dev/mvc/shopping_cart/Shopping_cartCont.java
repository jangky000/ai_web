package dev.mvc.shopping_cart;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Shopping_cartCont {
  
  @Autowired
  @Qualifier("dev.mvc.porder.Shopping_cartProc")
  private Shopping_cartProcInter shopping_cartProc;

  public Shopping_cartCont() {
    System.out.println("--> Shopping_cartCont created.");
  }
  
  //http://localhost:9090/team4/shopping_cart/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/shopping_cart/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/shopping_cart/create"); // webapp/shopping_cart/create.jsp
    return mav;
  }
  
 //http://localhost:9090/team4/shopping_cart/create.do
 /**
  * 등록 처리
  * @param porderVO
  * @return
  */
 @RequestMapping(value="/shopping_cart/create.do", method=RequestMethod.POST )
 public ModelAndView create(Shopping_cartVO shopping_cartVO) {
   ModelAndView mav = new ModelAndView();
   
   int cnt = this.shopping_cartProc.create(shopping_cartVO);
   
   mav.addObject("cnt", cnt); // redirect parameter 적용
   
   //mav.addObject("url", "create_msg"); // 파일명: create_msg.jsp, redirect parameter 적용
   //mav.setViewName("redirect:/shopping_cart/msg.do"); // jsp파일명을 해당 주소로 파라미터 전달
   mav.setViewName("redirect:/shopping_cart/list.do");
   return mav;
 }
 
//http://localhost:9090/team4/shopping_cart/list.do
 /**
  * 주문 리스트
  * @return
  */
 @RequestMapping(value="/shopping_cart/list.do", method=RequestMethod.GET)
 public ModelAndView list(){
   ModelAndView mav = new ModelAndView();
   
   List<Shopping_cartVO> list = this.shopping_cartProc.list();    
   mav.addObject("list", list);
   mav.setViewName("/shopping_cart/list"); // webapp/shopping_cart/list.jsp
   
   return mav; // forward
 }
 
  //http://localhost:9090/team4/shopping_cart/quantity_down.do?shopping_cartno=1
  /**
   * 장바구니 수량 하향--
   * @param shopping_cartno 장바구니 번호
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/shopping_cart/quantity_down.do", method=RequestMethod.GET,
                              produces="text/plain;charset=UTF-8") // 한글 깨짐 방지
  public String quantity_down(int shopping_cartno) {
    
    int cnt = this.shopping_cartProc.quantity_down(shopping_cartno);  // 수량 하향 처리
    
    Shopping_cartVO shopping_cartVO = this.shopping_cartProc.read(shopping_cartno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("quantity", shopping_cartVO.getQuantity());
    
    return json.toString();
  }
  
  //http://localhost:9090/team4/shopping_cart/quantity_up.do?shopping_cartno=1
  /**
   * 장바구니 수량 상향++
   * @param shopping_cartno 장바구니 번호
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/shopping_cart/quantity_up.do", method=RequestMethod.GET, 
                              produces="text/plain;charset=UTF-8")
  public String quantity_up(int shopping_cartno) {
    
    int cnt = this.shopping_cartProc.quantity_up(shopping_cartno);  // 수량 하향 처리
    
    Shopping_cartVO shopping_cartVO = this.shopping_cartProc.read(shopping_cartno);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("quantity", shopping_cartVO.getQuantity());
    
    return json.toString();
  }  
 
//http://localhost:9090/team4/shopping_cart/delete.do
 /**
  * 장바구니 상품 삭제 처리, GET 방식, 세션 확인해서 삭제하기
  * @param memberVO
  * @return
  */
 @RequestMapping(value="/shopping_cart/delete.do", method=RequestMethod.GET)
 public ModelAndView delete(int shopping_cartno){
   ModelAndView mav = new ModelAndView();
   
   int cnt= this.shopping_cartProc.delete(shopping_cartno);
   mav.addObject("cnt", cnt);
   mav.setViewName("redirect:/shopping_cart/list.do");
   
   return mav;
 }
 
 //http://localhost:9090/team4/shopping_cart/msg.do?
 /**
  * 메시지
  * @param url
  * @return
  */
 @RequestMapping(value="/shopping_cart/msg.do", method=RequestMethod.GET)
 public ModelAndView delete_msg(String url){
   ModelAndView mav = new ModelAndView();
   
   // 등록 처리 메시지: create_msg -> /shopping_cart/create_msg.jsp
   // 수정 처리 메시지: update_msg -> /shopping_cart/update_msg.jsp
   // 삭제 처리 메시지: delete_msg -> /shopping_cart/delete_msg.jsp
   mav.setViewName("/shopping_cart/" + url); // forward
   // cnt도 계속 get 방식 파라미터로 포워딩됨
   
   return mav; // forward
 }

 
}
