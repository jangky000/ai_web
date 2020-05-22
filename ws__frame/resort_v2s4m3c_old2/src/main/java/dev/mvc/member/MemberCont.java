package dev.mvc.member;
 
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

 
@Controller
public class MemberCont {
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  public MemberCont(){
    System.out.println("--> MemberCont created.");
  }
  
  //http://localhost:9090/resort/member/create.do
   /**
    * 등록 폼
    * @return
    */
   @RequestMapping(value="/member/create.do", method=RequestMethod.GET )
   public ModelAndView create() {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/member/create"); // webapp/member/create.jsp
     return mav;
   }
   
   /*
    * 메소드에서 리턴되는 값은 View 를 통해서 출력되지 않고 
    * HTTP Response의 Body에 직접 쓰임.
   */
   
   // http://localhost:9090/resort/member/checkID.do?id=user1
   /**
    * 아이디 중복 체크, json 출력
    * <xmp>@ResponseBody, produces="text/plain;charset=UTF-8"</xmp>
    * @return json.toString()
    */
   @ResponseBody
   @RequestMapping(value="/member/checkID.do", method=RequestMethod.GET, 
                               produces="text/plain;charset=UTF-8" ) // 한글 깨짐 방지
   public String checkID(String id) {
     int cnt = this.memberProc.checkID(id);
     JSONObject json = new JSONObject();
     json.put("cnt", cnt);
     
     return json.toString();
   }
   
  // http://localhost:9090/resort/member/create.do
  /**
   * 등록 처리
   * @param memberVO
   * @return
   */
  @RequestMapping(value="/member/create.do", method=RequestMethod.POST )
  public ModelAndView create(MemberVO memberVO) {
    ModelAndView mav = new ModelAndView();
    int cnt = memberProc.create(memberVO);
    mav.addObject("cnt", cnt); // redirect parameter 적용
    
    mav.addObject("url", "create_msg"); // 파일명: create_msg.jsp, redirect parameter 적용
    mav.setViewName("redirect:/member/msg.do"); // jsp파일명을 해당 주소로 파라미터 전달
    
    return mav;
  }
  

 //http://localhost:9090/resort/member/list.do
 /**
  * 전체 목록
  * @return
  */
  @RequestMapping(value="/member/list.do", method=RequestMethod.GET)
 public ModelAndView list() {
   ModelAndView mav = new ModelAndView();
   
   List<MemberVO> list = this.memberProc.list();
   mav.addObject("list", list); // request.setAttribute("list", list);

   mav.setViewName("/member/list"); // /webapp/member/list.jsp
   return mav;
 }
  
  // http://localhost:9090/resort/member/read.do?memberno=1
  /**
   * 회원 조회, 수정 폼
   * @param memberno
   * @return
   */
  @RequestMapping(value = "/member/read.do", 
                                          method = RequestMethod.GET)
  public ModelAndView read(int memberno) {
    ModelAndView mav = new ModelAndView();

    MemberVO memberVO = memberProc.read(memberno);
    mav.addObject("memberVO", memberVO);

    mav.setViewName("/member/read");

    return mav;
  }
  
  //http://localhost:9090/resort/member/update.do
   /**
   * 회원 정보 수정 처리
   * @param ra
   * @param request
   * @param memberVO
   * @return
   */
  @RequestMapping(value="/member/update.do", method=RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra, HttpServletRequest request, MemberVO memberVO){
    ModelAndView mav = new ModelAndView();

    int cnt = memberProc.update(memberVO);
    mav.addObject("cnt", cnt);
    mav.addObject("memberno", memberVO.getMemberno());

    mav.addObject("url", "update_msg"); // 파일명: update_msg.jsp, redirect parameter 적용
    mav.setViewName("redirect:/member/msg.do"); // jsp파일명을 해당 주소로 파라미터 전달

    return mav;
  }
  
  //http://localhost:9090/resort/member/delete.do?memberno=1
  /**
  * 회원 삭제 폼
  * @param memberno
  * @return
  */
  @RequestMapping(value="/member/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(int memberno){
    ModelAndView mav = new ModelAndView();

    MemberVO memberVO = memberProc.read(memberno);
    mav.addObject("memberVO", memberVO);

    mav.setViewName("/member/delete");

    return mav;
  }

  //http://localhost:9090/resort/member/delete.do
  /**
  * 회원 삭제 처리
  * @param memberno
  * @param mname
  * @return
  */
  @RequestMapping(value="/member/delete.do", method=RequestMethod.POST)
  public ModelAndView delete(int memberno, String mname){
    ModelAndView mav = new ModelAndView();
    
    // MemberVO memberVO = memberProc.read(memberno);
    // mav.addObject("mname", memberVO.getMname());
    mav.addObject("mname", mname);
    
    int cnt = memberProc.delete(memberno);
    mav.addObject("cnt", cnt);

    mav.addObject("url", "delete_msg"); // 파일명: delete_msg.jsp, redirect parameter 적용
    mav.setViewName("redirect:/member/msg.do"); // jsp파일명을 해당 주소로 파라미터 전달

    return mav;
  }
  
  /**
   * 메시지
   * @param url
   * @return
   */
  @RequestMapping(value="/member/msg.do", method=RequestMethod.GET)
  public ModelAndView delete_msg(String url){
    ModelAndView mav = new ModelAndView();
    
    // 등록 처리 메시지: create_msg -> /member/create_msg.jsp
    // 수정 처리 메시지: update_msg -> /member/update_msg.jsp
    // 삭제 처리 메시지: delete_msg -> /member/delete_msg.jsp
    mav.setViewName("/member/" + url); // forward
    // cnt도 계속 get 방식 파라미터로 포워딩됨
    
    return mav; // forward
  }

  /**
   * 패스워드를 변경합니다.
   * @param memberno
   * @return
   */
  @RequestMapping(value="/member/passwd_update.do", method=RequestMethod.GET)
  public ModelAndView passwd_update(int memberno){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/passwd_update");
    return mav;
  }
  

  /**
   * 패스워드 변경
   * @param ra
   * @param memberno pk
   * @param current_passwd 현재 패스워드
   * @param new_passwd 새 패스워드 
   * @return
   */
  @RequestMapping(value="/member/passwd_update.do", method=RequestMethod.POST)
  public ModelAndView passwd_update(RedirectAttributes ra, int memberno, String current_passwd, String new_passwd){
    ModelAndView mav = new ModelAndView();
    
    // 현재 패스워드 검사
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("memberno", memberno);
    map.put("passwd", current_passwd);
    
    int cnt = memberProc.passwd_check(map);
    int update_cnt = 0; // 변경된 패스워드 수
    
    if (cnt == 1) { // 현재 패스워드가 일치하는 경우
      map.put("passwd", new_passwd);
      update_cnt = memberProc.passwd_update(map); // 패스워드 변경
      mav.addObject("update_cnt", update_cnt); // ra.addAttribute("update_count", update_count);
    }
    mav.addObject("cnt", cnt);
    mav.addObject("url", "passwd_update_msg");
    
    mav.setViewName("redirect:/member/msg.do"); 
    return mav;
  }
}