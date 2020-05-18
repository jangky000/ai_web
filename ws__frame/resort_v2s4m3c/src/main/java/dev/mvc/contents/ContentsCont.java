package dev.mvc.contents;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cate.CateProcInter;
import dev.mvc.cate.CateVO;
import dev.mvc.categrp.CategrpProcInter;
import dev.mvc.categrp.CategrpVO;

@Controller
public class ContentsCont {
  //�θ��� �θ� ���̺��� ������ �� �ִ� CategrpProc
  @Autowired
  @Qualifier("dev.mvc.categrp.CategrpProc")
  private CategrpProcInter categrpProc;
  
  // �θ� ���̺��� ������ �� �ִ� cateProc�� �����ͼ� ���
  @Autowired
  @Qualifier("dev.mvc.cate.CateProc")
  private CateProcInter cateProc;
  
  @Autowired
  @Qualifier("dev.mvc.contents.ContentsProc")
  private ContentsProcInter contentsProc;
  
  public ContentsCont() {
    System.out.println("--> ContentsCont created.");
  }
  
  // http://localhost:9090/resort/contents/create.do
  /**
   * ��� ��
   * @return
   */
  @RequestMapping(value="/contents/create.do", method=RequestMethod.GET )
  public ModelAndView create(int cateno) {
    ModelAndView mav = new ModelAndView();

    CateVO cateVO = this.cateProc.read(cateno);
    mav.addObject("cateVO", cateVO);
    
    CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
    mav.addObject("categrpVO", categrpVO);
    
    mav.setViewName("/contents/create"); // webapp/contents/create.jsp
    
    return mav;
  }
  
  // http://localhost:9090/resort/contents/create.do
  /**
   * ��� ó��
   * @param cateVO
   * @return
   */
  @RequestMapping(value="/contents/create.do", method=RequestMethod.POST )
  public ModelAndView create(HttpServletRequest request, ContentsVO contentsVO) {
    ModelAndView mav = new ModelAndView();
    
    contentsVO.setIp(request.getRemoteAddr()); //  ������ IP
    int cnt = this.contentsProc.create(contentsVO);
    mav.addObject("cnt", cnt); // request�� ����
    //request.setAttribute("cnt", cnt); 
    // request�� ����ϸ� setViewName�� ����� ����� �� ��� ������� ���� ��, 
    // request ��ü�� ���� ����ϴ� ���� ������ ����̴�.
    
    if (cnt == 1) {
      int cateno = contentsVO.getCateno();
      this.cateProc.increaseCnt(cateno); // �� �� ����
      mav.addObject("cateno", cateno);
      // mav.setViewName("/contents/create_msg"); // webapp/contents/create_msg.jsp
      mav.setViewName("redirect:/contents/list.do"); // spring ��ȣ��
    } else { 
      mav.setViewName("/contents/create_msg"); // webapp/contents/create_msg.jsp
    }
    
    return mav;
  }
  
  // http://localhost:9090/resort/contents/list_all.do
  /**
   * ��ü ���
   * @return
   */
  @RequestMapping(value="/contents/list_all.do", method=RequestMethod.GET )
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<ContentsVO> list = this.contentsProc.list_all();
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/contents/list_all"); // /webapp/contents/list_all.jsp
    return mav;
  }
  
//http://localhost:9090/resort/contents/list.do
 /**
  * ��ü ���
  * @return
  */
 @RequestMapping(value="/contents/list.do", method=RequestMethod.GET )
 public ModelAndView list(int cateno) {
   ModelAndView mav = new ModelAndView();
   
   // 
   CateVO cateVO = this.cateProc.read(cateno);
   mav.addObject("cateVO", cateVO);
   
   // 
   CategrpVO categrpVO= this.categrpProc.read(cateVO.getCategrpno());
   mav.addObject("categrpVO", categrpVO);
   
   List<ContentsVO> list = this.contentsProc.list(cateno);
   mav.addObject("list", list);

   mav.setViewName("/contents/list"); // /webapp/contents/list.jsp
   return mav;
 }
  
  // http://localhost:9090/resort/contents/read.do
  /**
   * ��ȸ
   * @return
   */
  @RequestMapping(value="/contents/read.do", method=RequestMethod.GET )
  public ModelAndView read(int contentsno) {
    ModelAndView mav = new ModelAndView();
    
    ContentsVO contentsVO = this.contentsProc.read(contentsno);
    mav.addObject("contentsVO", contentsVO); // request.setAttribute("contentsVO", contentsVO);

    CateVO cateVO = this.cateProc.read(contentsVO.getCateno());
    mav.addObject("cateVO", cateVO);
    
    CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
    mav.addObject("categrpVO", categrpVO);
    
    mav.setViewName("/contents/read"); // /webapp/contents/read.jsp
    return mav;
  }
  
  /**
   * ���� ��
   * @param contentsno
   * @return
   */
  //http://localhost:9090/resort/contents/update.do
  @RequestMapping(value="/contents/update.do", method=RequestMethod.GET )
  public ModelAndView update(int contentsno ) {
    ModelAndView mav = new ModelAndView();
    
    ContentsVO contentsVO = this.contentsProc.update(contentsno);
    mav.addObject("contentsVO", contentsVO);
    
    mav.setViewName("/contents/update"); // webapp/contents/update.jsp
    return mav;
  }
  
  /**
   * ���� ó��
   * @param contentsVO
   * @return
   */
  //http://localhost:9090/resort/contents/update.do
  @RequestMapping(value="/contents/update.do", method=RequestMethod.POST )
  public ModelAndView update(ContentsVO contentsVO) {
    ModelAndView mav = new ModelAndView();
    
    CateVO cateVO = this.cateProc.read(contentsVO.getCateno());
    //mav.addObject("cateVO", cateVO); // ���� �ȵ�
    mav.addObject("cate_name", cateVO.getName()); // parameter ������ ���޵ǰ� ��
    mav.addObject("cateno", cateVO.getCateno());
    
    CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
    //mav.addObject("categrpVO", categrpVO);
    mav.addObject("categrp_name", categrpVO.getName()); // parameter ������ ���޵ǰ� ��
    
    mav.addObject("contentsno", contentsVO.getContentsno());
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("contentsno", contentsVO.getContentsno());
    hashMap.put("passwd", contentsVO.getPasswd());
    
    int passwd_cnt = 0;   //  �н����� ��ġ ���ڵ� ����
    int cnt = 0;               // ������ ���ڵ� ���� 
    
    passwd_cnt = this.contentsProc.passwd_check(hashMap);
    
    if(passwd_cnt == 1) { // �н����� ��ġ
      cnt = this.contentsProc.update(contentsVO);
      
    }
    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("passwd_cnt", passwd_cnt);
    
    if (passwd_cnt==1 && cnt == 1) {
      mav.setViewName("redirect:/contents/update_msg.jsp");
      // mav.setViewName("/contents/update_msg"); // webapp/contents/update_msg.jsp
      // mav.setViewName("redirect:/contents/list.do"); // spring ��ȣ��
    } else { 
      mav.setViewName("/contents/update_msg"); // webapp/contents/update_msg.jsp
    }

    return mav;
  }
  
  /**
   * ���� ��
   * @param contentsno
   * @return
   */
  //http://localhost:9090/resort/contents/delete.do
  @RequestMapping(value="/contents/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int contentsno ) {
    ModelAndView mav = new ModelAndView();
    
    ContentsVO contentsVO = this.contentsProc.read(contentsno);
    mav.addObject("contentsVO", contentsVO);
    
    mav.setViewName("/contents/delete"); // webapp/contents/delete.jsp
    return mav;
  }
  
  /**
   * ���� ó��
   * @param contentsVO
   * @return
   */
  //http://localhost:9090/resort/contents/delete.do
  @RequestMapping(value="/contents/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(int contentsno, String passwd) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("contentsno", contentsno);
    hashMap.put("passwd", passwd);

    int passwd_cnt = 0;   //  �н����� ��ġ ���ڵ� ����
    int cnt = 0;               // ������ ���ڵ� ���� 
    
    passwd_cnt = this.contentsProc.passwd_check(hashMap);
    
    // ���� ó���� ���� ���� read �ؾ���
    ContentsVO contentsVO = this.contentsProc.read(contentsno);
    String title=contentsVO.getTitle();
    int cateno = contentsVO.getCateno();
    
    mav.addObject("title", title);

    if(passwd_cnt == 1) { // �н����� ��ġ
      cnt = this.contentsProc.delete(contentsno);
    }
    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("passwd_cnt", passwd_cnt);
    mav.addObject("cateno", cateno);
    
    if (passwd_cnt==1 && cnt == 1) {
      this.cateProc.decreaseCnt(contentsVO.getCateno()); // �� �� ����

      mav.setViewName("/contents/delete_msg"); // webapp/contents/delete_msg.jsp
      // mav.setViewName("redirect:/contents/list.do"); // spring ��ȣ��
    } else {       
      mav.setViewName("/contents/delete_msg"); // webapp/contents/delete_msg.jsp
    }

    return mav;
  }
  
}



