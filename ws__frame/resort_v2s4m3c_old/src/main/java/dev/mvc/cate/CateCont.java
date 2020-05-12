package dev.mvc.cate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.categrp.CategrpProcInter;

@Controller
public class CateCont {
  // �θ� ���̺�
  @Autowired
  @Qualifier("dev.mvc.categrp.CategrpProc")
  private CategrpProcInter categrpProc;
  
  //�ڽ� ���̺�
  @Autowired
  @Qualifier("dev.mvc.cate.CateProc")
  private CateProcInter cateProc;
  
  public CateCont() {
    System.out.println("   --> CateCont created");
  }
  
  /**
   * ��� ��
   * @return
   */
  @RequestMapping(value="/cate/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    
//    List<CategrpVO> list = this.categrpProc.list_categrpno_asc();
//    mav.addObject("list", list);
    
    mav.setViewName("/cate/create"); // webapp/cate/create.jsp
    
    return mav;
  }
  
  /**
   * ���ó��
   * @param cateVO
   * @return
   */
  @RequestMapping(value="/cate/create.do", method=RequestMethod.POST)
  public ModelAndView create(CateVO cateVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.cateProc.create(cateVO);
    mav.addObject("cnt", cnt); // GET ������� ������
    
    if(cnt == 1) {
      mav.setViewName("/cate/create_msg");
    } else {
      mav.setViewName("/cate/create_msg"); // webapp/cate/create_msg.jsp
    }
    
    return mav;
  }
  
//http://localhost:9090/resort/cate/list.do
  /**
   * ��ü ���
   * @return
   */
  @RequestMapping(value="/cate/list.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<CateVO> list = null;
    list = this.cateProc.list_seqno_asc();
    
    mav.addObject("list", list); // request.setAttribute("list", list);
    
    mav.setViewName("/cate/list"); // webapp/cate/list.jsp
    return mav;
  }
  
//http://localhost:9090/resort/cate/read_update.do?cateno=1
 /**
  * �� �� ��ȸ, ���� ��
  * @param cateno ��ȸ�� ī�װ� ��ȣ
  * @return mav
  */
 @RequestMapping(value="/cate/read_update.do", method=RequestMethod.GET)
 public ModelAndView read_update(int cateno) { // �Ķ���Ͱ� ����
   
   ModelAndView mav = new ModelAndView();
   
   CateVO cateVO = null;
   cateVO = this.cateProc.read(cateno);
   
   mav.addObject("cateVO", cateVO);
   
   List<CateVO> list = null;
   list = this.cateProc.list_seqno_asc();
   
   mav.addObject("list", list);
   
   mav.setViewName("/cate/read_update"); // webapp/cate/read_update.jsp
   
   return mav; // ������
   
 }
 
 //http://localhost:9090/resort/cate/update.do?categrpno=1
 /**
  * ������Ʈ ó��
  * @param cateno
  * @return ������ ���ڵ� ����
  */
@RequestMapping(value="/cate/update.do", method=RequestMethod.POST)
public ModelAndView update(CateVO cateVO) { // �Ķ���Ͱ� ����
  ModelAndView mav = new ModelAndView();
  
  int cnt = this.cateProc.update(cateVO);
  mav.addObject("cnt", cnt);
  
  mav.setViewName("/cate/update_msg"); // webapp/cate/update_msg.jsp
  
  return mav;
}

//http://localhost:9090/resort/cate/read_delete.do?cateno=1
/**
 * �� �� ��ȸ, ���� ��
 * @param cateno ��ȸ�� ī�װ� ��ȣ
 * @return mav
 */
@RequestMapping(value="/cate/read_delete.do", method=RequestMethod.GET)
public ModelAndView read_delete(int cateno) { // �Ķ���Ͱ� ����
  ModelAndView mav = new ModelAndView();
  
  CateVO cateVO = this.cateProc.read(cateno);
  mav.addObject("cateVO", cateVO);
  
  List<CateVO> list = this.cateProc.list_seqno_asc();
  mav.addObject("list", list);
  
  mav.setViewName("/cate/read_delete"); // webapp/categrp/read_delete.jsp
  
  return mav;
  
}

//http://localhost:9090/resort/cate/delete.do?cateno=1
/**
 * ���� ó��
 * @param cateno �˻��� ī�װ� ��ȣ
 * @return ���� ó���� ���ڵ� ����
 */
@RequestMapping(value="/cate/delete.do", method=RequestMethod.POST)
public ModelAndView delete(int cateno) { // �Ķ���Ͱ� ����
  ModelAndView mav = new ModelAndView();
  
  // ���� ����
  CateVO cateVO = this.cateProc.read(cateno);
  mav.addObject("cateVO", cateVO); // --> ������ �������� ���ߴ��� ������
  
  // ���� ó��
  int cnt = this.cateProc.delete(cateno);
  
  mav.addObject("cnt", cnt);
  
  mav.setViewName("/cate/delete_msg"); // webapp/cate/delete_msg.jsp
  
  return mav;
}

// http://localhost:9090/resort/cate/update_seqno_up.do?cateno=1
// http://localhost:9090/resort/cate/update_seqno_up.do?cateno=1000
/**
 * �켱���� ����, 10 �� 1
 * @param cateno
 * @return ������ ���ڵ� ����
 */
@RequestMapping(value="/cate/update_seqno_up.do", method=RequestMethod.GET)
public ModelAndView update_seqno_up(int cateno) { // �Ķ���Ͱ� ����
 ModelAndView mav = new ModelAndView();
 
 int cnt = this.cateProc.update_seqno_up(cateno);// �켱 ���� ���� ó��
 mav.addObject("cnt", cnt);
 
 CateVO cateVO = this.cateProc.read(cateno);// ī�װ� �׷� ����
 mav.addObject("cateVO", cateVO); //request ��ü�� ����
 
 mav.setViewName("/cate/update_seqno_up_msg"); //webapp/cate/update_seqno_up_msg.jsp
 
 return mav;
}

//http://localhost:9090/resort/cate/update_seqno_down.do?cateno=1
/**
* �켱���� ����, 1 �� 10
* @param cateno
* @return ������ ���ڵ� ����
*/
@RequestMapping(value="/cate/update_seqno_down.do", method=RequestMethod.GET)
public ModelAndView update_seqno_down(int cateno) { // �Ķ���Ͱ� ����
  ModelAndView mav = new ModelAndView();
  
  int cnt = this.cateProc.update_seqno_down(cateno);
  mav.addObject("cnt", cnt);
  
  CateVO cateVO = this.cateProc.read(cateno);
  mav.addObject("cateVO", cateVO);
  
  mav.setViewName("/cate/update_seqno_down_msg");
  
  return mav;
  
}

//http://localhost:9090/resort/cate/update_visible.do?cateno=1
/**
* ��� ��� ���� Y
* @param cateno
* @return ������ ���ڵ� ����
*/
@RequestMapping(value="/cate/update_visible.do", method=RequestMethod.GET)
public ModelAndView update_visible(CateVO cateVO) { // �Ķ���Ͱ� ����
  //anchor�� ���� �Ķ���͵� �ڵ����� ������
  ModelAndView mav = new ModelAndView();
  
  cateVO.setVisible(cateVO.getVisible().toUpperCase().equals("Y")?"N":"Y");
  
  int cnt = this.cateProc.update_visible(cateVO);
  
  mav.setViewName("redirect:/cate/list.do");
  
  return mav;
  
}
  
}
