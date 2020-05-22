package dev.mvc.contents;

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

import dev.mvc.cate.CateProcInter;
import dev.mvc.cate.CateVO;
import dev.mvc.categrp.CategrpProcInter;
import dev.mvc.categrp.CategrpVO;
import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;

@Controller
public class ContentsCont {
  @Autowired
  @Qualifier("dev.mvc.categrp.CategrpProc")
  private CategrpProcInter categrpProc;
  
  @Autowired
  @Qualifier("dev.mvc.cate.CateProc")
  private CateProcInter cateProc;
  
  @Autowired
  @Qualifier("dev.mvc.contents.ContentsProc")
  private ContentsProcInter contentsProc;

  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  public ContentsCont() {
    System.out.println("--> ContentsCont created.");
  }
  
  // http://localhost:9090/resort/contents/create.do
  /**
   * 등록 폼
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
   * 등록 처리
   * @param cateVO
   * @return
   */
  @RequestMapping(value="/contents/create.do", method=RequestMethod.POST )
  public ModelAndView create(HttpServletRequest request, ContentsVO contentsVO) {
    ModelAndView mav = new ModelAndView();
    
    contentsVO.setIp(request.getRemoteAddr()); // 접속자 IP
    int cnt = this.contentsProc.create(contentsVO);
    mav.addObject("cnt", cnt); // request에 저장
    // request.setAttribute("cnt", cnt); // request에 저장
    
    mav.addObject("cateno", contentsVO.getCateno());
    
    if (cnt == 1) {
      this.cateProc.increaseCnt(contentsVO.getCateno()); // 글수 증가
      // mav.setViewName("/contents/create_msg"); // webapp/contents/create_msg.jsp
      mav.setViewName("redirect:/contents/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/contents/create_msg"); // webapp/contents/create_msg.jsp
    }
    
    return mav;
  }
  
  // http://localhost:9090/resort/contents/list_all.do
  /**
   * 전체 목록
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
  
  // http://localhost:9090/resort/contents/list.do
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value="/contents/list.do", method=RequestMethod.GET )
  public ModelAndView list(int cateno) {
    ModelAndView mav = new ModelAndView();
    
    CateVO cateVO = this.cateProc.read(cateno);
    mav.addObject("cateVO", cateVO); 
    
    CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
    mav.addObject("categrpVO", categrpVO); 
    
    List<ContentsVO> list = this.contentsProc.list(cateno);
    mav.addObject("list", list); 

    mav.setViewName("/contents/list"); // /webapp/contents/list.jsp
    return mav;
  }  
  
  // http://localhost:9090/resort/contents/read.do
  /**
   * 전체 목록
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
  
  // http://localhost:9090/resort/contents/update.do
  /**
   * 수정 폼
   * @return
   */
  @RequestMapping(value="/contents/update.do", method=RequestMethod.GET )
  public ModelAndView update(int contentsno) {
    ModelAndView mav = new ModelAndView();
    
    ContentsVO contentsVO = this.contentsProc.update(contentsno);
    mav.addObject("contentsVO", contentsVO); // request.setAttribute("contentsVO", contentsVO);
    
    mav.setViewName("/contents/update"); // webapp/contents/update.jsp
    
    return mav;
  }
  
  // http://localhost:9090/resort/contents/update.do
  /**
   * 수정 처리
   * @param contentsVO
   * @return
   */
  @RequestMapping(value="/contents/update.do", method=RequestMethod.POST )
  public ModelAndView update(ContentsVO contentsVO) {
    ModelAndView mav = new ModelAndView();
    
    CateVO cateVO = this.cateProc.read(contentsVO.getCateno());
    // mav.addObject("cateVO", cateVO); // 전달안됨.
    mav.addObject("cate_name", cateVO.getName());
    mav.addObject("cateno", cateVO.getCateno());

    CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
    // mav.addObject("categrpVO", categrpVO); // 전달안됨.
    mav.addObject("categrp_name", categrpVO.getName());
    
    mav.addObject("contentsno", contentsVO.getContentsno());
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("contentsno", contentsVO.getContentsno());
    hashMap.put("passwd", contentsVO.getPasswd());
    
    int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    passwd_cnt = this.contentsProc.passwd_check(hashMap);
    
    if (passwd_cnt == 1) { // 패스워드 일치
      cnt = this.contentsProc.update(contentsVO);
    }

    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("passwd_cnt", passwd_cnt); // request에 저장
        
    if (passwd_cnt == 1 && cnt == 1) {
      mav.setViewName("redirect:/contents/update_msg.jsp"); // webapp/contents/update_msg.jsp
      // mav.setViewName("/contents/update_msg"); // webapp/contents/update_msg.jsp
      // mav.setViewName("redirect:/contents/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/contents/update_msg"); // webapp/contents/update_msg.jsp
    }
    
    return mav;
  }
  
  // http://localhost:9090/resort/contents/delete.do
  /**
   * 삭제 폼
   * @return
   */
  @RequestMapping(value="/contents/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int contentsno) {
    ModelAndView mav = new ModelAndView();
    
    ContentsVO contentsVO = this.contentsProc.update(contentsno);
    mav.addObject("contentsVO", contentsVO); // request.setAttribute("contentsVO", contentsVO);
    
    mav.setViewName("/contents/delete"); // webapp/contents/delete.jsp
    
    return mav;
  }
  
  // http://localhost:9090/resort/contents/delete.do
  /**
   * 삭제 처리
   * @param contentsVO
   * @return
   */
  @RequestMapping(value="/contents/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(int contentsno, String passwd) {
    ModelAndView mav = new ModelAndView();

    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("contentsno", contentsno);
    hashMap.put("passwd", passwd);
    
    int passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 삭제된 레코드 갯수 
    
    passwd_cnt = this.contentsProc.passwd_check(hashMap);
    
    ContentsVO contentsVO = this.contentsProc.read(contentsno); 
    String title = contentsVO.getTitle(); // 제목
    mav.addObject("title", title);
    
    if (passwd_cnt == 1) { // 패스워드 일치
      cnt = this.contentsProc.delete(contentsno);
    }

    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("passwd_cnt", passwd_cnt); // request에 저장
        
    if (passwd_cnt == 1 && cnt == 1) {
      this.cateProc.decreaseCnt(contentsVO.getCateno());  // 글수 감소
      mav.setViewName("/contents/delete_msg"); // webapp/contents/delete_msg.jsp
      // mav.setViewName("redirect:/contents/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/contents/delete_msg"); // webapp/contents/delete_msg.jsp
    }
    
    return mav;
  }
  
  // http://localhost:9090/resort/contents/list_by_memberno.do
  /**
   * 회원별 글 전체 목록
   * @return
   */
  @RequestMapping(value="/contents/list_by_memberno.do", method=RequestMethod.GET )
  public ModelAndView list_by_memberno(int memberno) {
    ModelAndView mav = new ModelAndView();
    
    // Type 1
    MemberVO memberVO = this.memberProc.read(memberno);
    List<Cate_Contents_VO> list = this.contentsProc.cate_contents_memberno_list(memberno);
    mav.addObject("memberVO", memberVO); 
    mav.addObject("list", list); 
    
    // Type 2
//    Cate_Contents_Member_VO vo = new Cate_Contents_Member_VO();
//    vo.setMemberVO(memberVO);
//    vo.setCate_contents_memberno_list(list);
//    mav.addObject("vo", vo);

    mav.setViewName("/contents/list_by_memberno"); // /webapp/contents/list_by_memberno.jsp
    return mav;
  }  
  
  // http://localhost:9090/resort/contents/map_create.do?cateno=25&contentsno=28
  /**
   * 지도 등록 폼
   * @return
   */
  @RequestMapping(value="/contents/map_create.do", method=RequestMethod.GET )
  public ModelAndView map_create(int cateno, int contentsno) {
    ModelAndView mav = new ModelAndView();
    
    CateVO cateVO = this.cateProc.read(cateno);
    mav.addObject("cateVO", cateVO);
    
    CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
    mav.addObject("categrpVO", categrpVO);
    
    ContentsVO contentsVO = this.contentsProc.read(contentsno);
    mav.addObject("contentsVO", contentsVO);

    mav.setViewName("/contents/map_create"); // webapp/contents/map_create.jsp
    
    return mav;
  }
  
  // http://localhost:9090/resort/contents/passwd.do?contentsno=28&passwd=123
  /**
   * 글의 패스워드 체크, JSON 출력
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/contents/passwd.do", method=RequestMethod.GET ,
                              produces = "text/plain;charset=UTF-8" )
  public String passwd(int contentsno, String passwd) {
    HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
    hashMap.put("contentsno", contentsno);
    hashMap.put("passwd", passwd);
    
    int cnt = this.contentsProc.passwd_check(hashMap);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString(); 
  }
  
  // http://localhost:9090/resort/contents/map_create.do?cateno=25&contentsno=28
  /**
   * 지도 등록
   * @param cateno 카테고리 번호
   * @param contentsno 글번호
   * @param map 지도 스크립트
   * @return
   */
  @RequestMapping(value="/contents/map_create.do", method=RequestMethod.POST )
  public ModelAndView map_create(int cateno, int contentsno, String map) {
    ModelAndView mav = new ModelAndView();

    // System.out.println("map: " + map);
    // System.out.println("contentsno: " + contentsno);
    
    HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
    hashMap.put("map", map);
    hashMap.put("contentsno", contentsno);
    
    this.contentsProc.map(hashMap); // 지도 등록
    
    mav.addObject("contentsno", contentsno);
    
    mav.setViewName("redirect:/contents/read.do"); // webapp/contents/list.jsp
    
    return mav;
  }
  
  // http://localhost:9090/resort/contents/map_delete.do?cateno=25&contentsno=28
  /**
   * 지도 삭제 폼
   * @return
   */
  @RequestMapping(value="/contents/map_delete.do", method=RequestMethod.GET )
  public ModelAndView map_delete(int cateno, int contentsno) {
    ModelAndView mav = new ModelAndView();
    
    CateVO cateVO = this.cateProc.read(cateno);
    mav.addObject("cateVO", cateVO);
    
    CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
    mav.addObject("categrpVO", categrpVO);
    
    ContentsVO contentsVO = this.contentsProc.read(contentsno);
    mav.addObject("contentsVO", contentsVO);

    mav.setViewName("/contents/map_delete"); // webapp/contents/map_delete.jsp
    
    return mav;
  }

  // http://localhost:9090/resort/contents/map_delete.do?cateno=25&contentsno=28
  /**
   * 지도 삭제 처리
   * @param cateno 카테고리 번호
   * @param contentsno 글번호
   * @param map 지도 스크립트
   * @return
   */
  @RequestMapping(value="/contents/map_delete.do", method=RequestMethod.POST )
  public ModelAndView map_delete_proc(int cateno, int contentsno) {
    ModelAndView mav = new ModelAndView();

    // System.out.println("map: " + map);
    // System.out.println("contentsno: " + contentsno);
    
    HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
    hashMap.put("map", ""); // map 삭제
    hashMap.put("contentsno", contentsno);
    
    this.contentsProc.map(hashMap); // 지도 삭제 처리
    
    mav.addObject("contentsno", contentsno);
    
    mav.setViewName("redirect:/contents/read.do"); // webapp/contents/list.jsp
    
    return mav;
  }
  
}




