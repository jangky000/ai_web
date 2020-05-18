package dev.mvc.categrp;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.ModelAndView;
 
@Controller // ��Ű���� ��Ʈ�ѷ� ��Ͻ� �ڵ����� ��Ʈ�ѷ� ���
public class CategrpCont {
  @Autowired
  @Qualifier("dev.mvc.categrp.CategrpProc") // "Proc�� component"(������)�� ȣ���ؼ� ���, CategrpProcInter�� ã�� �����Ѵ�.
  private CategrpProcInter categrpProc; // ���⿡ DAO->Proc �� �ڵ� �����ؼ� �Է�
  
  public CategrpCont() {
    System.out.println("    --> CategrpCont created");
  }
  
  //http://localhost:9090/resort/categrp/create.do
  /**
   * ��� ��
   * @return
   */
  @RequestMapping(value="/categrp/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/categrp/create"); //webapp/categrp/create.jsp
    
    return mav; // ������
  }
  
  //http://localhost:9090/resort/categrp/create.do
  /**
   * ��� ó��
   * @param categrpVO
   * @return
   */
  @RequestMapping(value="/categrp/create.do", method=RequestMethod.POST)
  public ModelAndView create(CategrpVO categrpVO) {
    //request.setAttribute("categrpVO", categrpVO); �ڵ� ����
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.categrpProc.create(categrpVO);
    mav.addObject("cnt", cnt); // request�� ����, request.setAttribute("cnt", cnt);
    
    // type 1
    // mav.setViewName("/categrp/create_msg"); //webapp/categrp/create_msg.jsp
    // �ۼ� �Ϸ� �� ���ΰ�ħ �� �����Ͱ� �ݺ�(�ߺ�)�Ǿ� ��� insert�� �̷����
    // forward ���
    
    // type2 setViewName("redirect:/") -> '?cnt=1'�� url �ڿ� ����
    //mav.setViewName("redirect:/categrp/create_msg.jsp");
    // redirect���, ���������� ��� -> ���� JSP���� �ٿ���� ��
    // response.sendRedirect -> request ��ü�� �����
    
    // ������
    // mav.addObject("categrpVO", categrpVO); // �ʿ� ����, ������ ��������(�������� �� ���̰� request ��ü�� �����Ѵ�.)
    mav.setViewName("/categrp/create_msg"); // webapp/categrp/create_msg.jsp
    
    return mav;
  }
  
  //http://localhost:9090/resort/categrp/list.do
  /**
   * ��ü ���
   * @return
   */
  @RequestMapping(value="/categrp/list.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<CategrpVO> list = null;
    list = this.categrpProc.list_seqno_asc();
    
    mav.addObject("list", list); // request.setAttribute("list", list);
    
    mav.setViewName("/categrp/list"); // webapp/categrp/list.jsp
    return mav;
  }
  
  // http://localhost:9090/resort/categrp/read.do?categrpno=1
  /**
   * �� �� ��ȸ, ���� ��
   * @param categrpno ��ȸ�� ī�װ��� ��ȣ
   * @return mav
   */
  @RequestMapping(value="/categrp/read_update.do", method=RequestMethod.GET)
  public ModelAndView read_update(int categrpno) { // �Ķ���Ͱ� ����
    // request.setAttribute("categrpno", int categrpno) �۵� �ȵ�
    
    ModelAndView mav = new ModelAndView();
    
    CategrpVO categrpVO = null;
    categrpVO = this.categrpProc.read(categrpno);
    
    mav.addObject("categrpVO", categrpVO);
    
    List<CategrpVO> list = null;
    list = this.categrpProc.list_seqno_asc();
    
    mav.addObject("list", list);
    
    mav.setViewName("/categrp/read_update"); // webapp/categrp/read_update.jsp
    
    return mav; // ������
    
  }
  
  //http://localhost:9090/resort/categrp/update.do?categrpno=1
  /**
   * ������Ʈ ó��
   * @param categrpno
   * @return ������ ���ڵ� ����
   */
 @RequestMapping(value="/categrp/update.do", method=RequestMethod.POST)
 public ModelAndView update(CategrpVO categrpVO) { // �Ķ���Ͱ� ����
   // CategrpVO categrpVO   <--   <form> �±� ������ �ڵ� ����
   // request.setAttribute("categrpVO", categrpVO)
   ModelAndView mav = new ModelAndView();
   
   int cnt = this.categrpProc.update(categrpVO);
   mav.addObject("cnt", cnt);
   
   mav.setViewName("/categrp/update_msg.jsp"); // webapp/categrp/update_msg.jsp
   
   return mav;
 }
 
  //http://localhost:9090/resort/categrp/read_delete.do?categrpno=1
  /**
   * �� �� ��ȸ, ���� ��
   * @param categrpno ��ȸ�� ī�װ��� ��ȣ
   * @return mav
   */
  @RequestMapping(value="/categrp/read_delete.do", method=RequestMethod.GET)
  public ModelAndView read_delete(int categrpno) { // �Ķ���Ͱ� ����
    ModelAndView mav = new ModelAndView();
    
    CategrpVO categrpVO = this.categrpProc.read(categrpno);
    mav.addObject("categrpVO", categrpVO);
    
    List<CategrpVO> list = this.categrpProc.list_seqno_asc();
    mav.addObject("list", list);
    
    mav.setViewName("/categrp/read_delete"); // webapp/categrp/read_delete.jsp
    
    return mav;
    
  }
  
  //http://localhost:9090/resort/categrp/delete.do?categrpno=1
  /**
   * ���� ó��
   * @param categrpno �˻��� ī�װ��� ��ȣ
   * @return ���� ó���� ���ڵ� ����
   */
  @RequestMapping(value="/categrp/delete.do", method=RequestMethod.POST)
  public ModelAndView delete(int categrpno) { // �Ķ���Ͱ� ����
    ModelAndView mav = new ModelAndView();
    
    // ���� ����
    CategrpVO categrpVO = this.categrpProc.read(categrpno);
    mav.addObject("categrpVO", categrpVO); // --> ������ �������� ���ߴ��� ������
    
    // ���� ó��
    int cnt = this.categrpProc.delete(categrpno);
    
    mav.addObject("cnt", cnt);
    
    mav.setViewName("/categrp/delete_msg"); // webapp/categrp/delete_msg.jsp
    
    return mav;
  }
  
  // http://localhost:9090/resort/categrp/update_seqno_up.do?categrpno=1
  // http://localhost:9090/resort/categrp/update_seqno_up.do?categrpno=1000
  /**
   * �켱���� ����, 10 �� 1
   * @param categrpno
   * @return ������ ���ڵ� ����
   */
 @RequestMapping(value="/categrp/update_seqno_up.do", method=RequestMethod.GET)
 public ModelAndView update_seqno_up(int categrpno) { // �Ķ���Ͱ� ����
   ModelAndView mav = new ModelAndView();
   
   int cnt = this.categrpProc.update_seqno_up(categrpno);// �켱 ���� ���� ó��
   mav.addObject("cnt", cnt);
   
   CategrpVO categrpVO = this.categrpProc.read(categrpno);// ī�װ��� �׷� ����
   mav.addObject("categrpVO", categrpVO); //request ��ü�� ����
   
   mav.setViewName("/categrp/update_seqno_up_msg"); //webapp/categrp/update_seqno_up_msg.jsp
   
   return mav;
 }
 
 //http://localhost:9090/resort/categrp/update_seqno_down.do?categrpno=1
 /**
  * �켱���� ����, 1 �� 10
  * @param categrpno
  * @return ������ ���ڵ� ����
  */
  @RequestMapping(value="/categrp/update_seqno_down.do", method=RequestMethod.GET)
  public ModelAndView update_seqno_down(int categrpno) { // �Ķ���Ͱ� ����
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.categrpProc.update_seqno_down(categrpno);
    mav.addObject("cnt", cnt);
    
    CategrpVO categrpVO = this.categrpProc.read(categrpno);
    mav.addObject("categrpVO", categrpVO);
    
    mav.setViewName("/categrp/update_seqno_down_msg");
    
    return mav;
    
  }
 
  //http://localhost:9090/resort/categrp/update_visible.do?categrpno=1
 /**
  * ��� ��� ���� Y
  * @param categrpno
  * @return ������ ���ڵ� ����
  */
  @RequestMapping(value="/categrp/update_visible.do", method=RequestMethod.GET)
  public ModelAndView update_visible(CategrpVO categrpVO) { // �Ķ���Ͱ� ����
    //anchor�� ���� �Ķ���͵� �ڵ����� ������
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.categrpProc.update_visible(categrpVO);
    
    mav.setViewName("redirect:/categrp/list.do");
    
    return mav;
    
  }
  
}