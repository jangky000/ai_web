package dev.mvc.member;
 
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
 
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
   
   // http://localhost:9090/resort/member/checkID.do?id=user1
   /**
    * ���̵� �ߺ� üũ, json ���
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
   
}