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
    * ��� ��
    * @return
    */
   @RequestMapping(value="/member/create.do", method=RequestMethod.GET )
   public ModelAndView create() {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/member/create"); // webapp/member/create.jsp
     return mav;
   }
   
   /*
    * �޼ҵ忡�� ���ϵǴ� ���� View �� ���ؼ� ��µ��� �ʰ� 
    * HTTP Response�� Body�� ���� ����.
   */
   
   // http://localhost:9090/resort/member/checkID.do?id=user1
   /**
    * ���̵� �ߺ� üũ, json ���
    * <xmp>@ResponseBody, produces="text/plain;charset=UTF-8"</xmp>
    * @return json.toString()
    */
   @ResponseBody
   @RequestMapping(value="/member/checkID.do", method=RequestMethod.GET, 
                               produces="text/plain;charset=UTF-8" ) // �ѱ� ���� ����
   public String checkID(String id) {
     int cnt = this.memberProc.checkID(id);
     JSONObject json = new JSONObject();
     json.put("cnt", cnt);
     
     return json.toString();
   }
   
  // http://localhost:9090/resort/member/create.do
  /**
   * ��� ó��
   * @param memberVO
   * @return
   */
  @RequestMapping(value="/member/create.do", method=RequestMethod.POST )
  public ModelAndView create(MemberVO memberVO) {
    ModelAndView mav = new ModelAndView();
    int cnt = memberProc.create(memberVO);
    mav.addObject("cnt", cnt); // redirect parameter ����
    
    mav.addObject("url", "create_msg"); // ���ϸ�: create_msg.jsp, redirect parameter ����
    mav.setViewName("redirect:/member/msg.do"); // jsp���ϸ��� �ش� �ּҷ� �Ķ���� ����
    
    return mav;
  }
  

 //http://localhost:9090/resort/member/list.do
 /**
  * ��ü ���
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
   * ȸ�� ��ȸ, ���� ��
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
   * ȸ�� ���� ���� ó��
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

    mav.addObject("url", "update_msg"); // ���ϸ�: update_msg.jsp, redirect parameter ����
    mav.setViewName("redirect:/member/msg.do"); // jsp���ϸ��� �ش� �ּҷ� �Ķ���� ����

    return mav;
  }
  
  //http://localhost:9090/resort/member/delete.do?memberno=1
  /**
  * ȸ�� ���� ��
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
  * ȸ�� ���� ó��
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

    mav.addObject("url", "delete_msg"); // ���ϸ�: delete_msg.jsp, redirect parameter ����
    mav.setViewName("redirect:/member/msg.do"); // jsp���ϸ��� �ش� �ּҷ� �Ķ���� ����

    return mav;
  }
  
  /**
   * �޽���
   * @param url
   * @return
   */
  @RequestMapping(value="/member/msg.do", method=RequestMethod.GET)
  public ModelAndView delete_msg(String url){
    ModelAndView mav = new ModelAndView();
    
    // ��� ó�� �޽���: create_msg -> /member/create_msg.jsp
    // ���� ó�� �޽���: update_msg -> /member/update_msg.jsp
    // ���� ó�� �޽���: delete_msg -> /member/delete_msg.jsp
    mav.setViewName("/member/" + url); // forward
    // cnt�� ��� get ��� �Ķ���ͷ� ��������
    
    return mav; // forward
  }

  /**
   * �н����带 �����մϴ�.
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
   * �н����� ����
   * @param ra
   * @param memberno pk
   * @param current_passwd ���� �н�����
   * @param new_passwd �� �н����� 
   * @return
   */
  @RequestMapping(value="/member/passwd_update.do", method=RequestMethod.POST)
  public ModelAndView passwd_update(RedirectAttributes ra, int memberno, String current_passwd, String new_passwd){
    ModelAndView mav = new ModelAndView();
    
    // ���� �н����� �˻�
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("memberno", memberno);
    map.put("passwd", current_passwd);
    
    int cnt = memberProc.passwd_check(map);
    int update_cnt = 0; // ����� �н����� ��
    
    if (cnt == 1) { // ���� �н����尡 ��ġ�ϴ� ���
      map.put("passwd", new_passwd);
      update_cnt = memberProc.passwd_update(map); // �н����� ����
      mav.addObject("update_cnt", update_cnt); // ra.addAttribute("update_count", update_count);
    }
    mav.addObject("cnt", cnt);
    mav.addObject("url", "passwd_update_msg");
    
    mav.setViewName("redirect:/member/msg.do"); 
    return mav;
  }
}