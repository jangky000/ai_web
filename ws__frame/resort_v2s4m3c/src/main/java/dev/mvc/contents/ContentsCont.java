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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.attachfile.AttachfileProcInter;
import dev.mvc.attachfile.AttachfileVO;
import dev.mvc.cate.CateProcInter;
import dev.mvc.cate.CateVO;
import dev.mvc.categrp.CategrpProcInter;
import dev.mvc.categrp.CategrpVO;
import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

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
  
  @Autowired
  @Qualifier("dev.mvc.attachfile.AttachfileProc")
  private AttachfileProcInter attachfileProc;
  
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
    
    //file1에서 코드 가져옴
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    String file1 = ""; // main image file1 파일
    String thumb1 = ""; // preview image
    
    String upDir = Tool.getRealPath(request, "/contents/storage/main_images"); // 절대 경로 // webapp/contents/storage/main_images
    // 전송 파일이 없어도 mf 객체가 생성됨.
    MultipartFile mf = contentsVO.getFile1MF();  // 파일 목록
    long size1 = mf.getSize(); // 전송 파일 크기
    if (size1 > 0) { // 파일 크기 체크
      // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
      
      file1 = Upload.saveFileSpring(mf, upDir); // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      // attachfile cont 에서 가져옴
      if (Tool.isImage(file1)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 250, height: 200
        thumb1 = Tool.preview(upDir, file1, 250, 200); 
      }
    }    
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------
    
    contentsVO.setIp(request.getRemoteAddr()); // 접속자 IP
    
    /*
      <insert id="create" parameterType="ContentsVO">
      <!-- 등록 후 contentsno return -->
      <selectKey keyProperty="contentsno" resultType="int" order="BEFORE">
        select contents_seq.nextval from dual
      </selectKey>
      INSERT INTO contents(contentsno, memberno, cateno, title, content, web, ip,
                                       passwd, word, rdate)
      VALUES(#{contentsno}, #{memberno}, #{cateno}, #{title}, #{content}, #{web}, #{ip},
                  #{passwd}, #{word}, sysdate)
      </insert>
    */
    
    // 정상 등록 시 PK가 리턴 됨, 
    contentsVO.setFile1(file1);
    contentsVO.setThumb1(thumb1);
    contentsVO.setSize1(size1);
    int cnt = this.contentsProc.create(contentsVO); // Call By Reference로 contentsVO에 접근
    mav.addObject("cnt", cnt); // request에 저장
    //-----------------------------------------------------------------------------------------------
    //return cnt, contentsno
    //-----------------------------------------------------------------------------------------------
    // Spring과 MyBatis가contentsVO를  공유하고 있음(중요 개념)
    // Spring <---> contentsVO <----> MyBatis
    // MyBatis는 insert 후 PK를 contentsno 필드에 저장해줌
    int contentsno = contentsVO.getContentsno(); // MyBatis에서 리턴된 PK
    mav.addObject("contentsno", contentsno); // request에 저장
    
    
    mav.addObject("cateno", contentsVO.getCateno());
    mav.addObject("url", "create_msg"); // webapp/contents/create_msg.jsp
    
    if (cnt == 1) { // 정상적으로 글이 등록된 경우에만 글 수 증가
      this.cateProc.increaseCnt(contentsVO.getCateno()); // 글 수 증가
    }
    mav.setViewName("redirect:/contents/msg.do");
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
  
/*  
  // http://localhost:9090/resort/contents/list.do
  // 전체 목록
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
 */ 
  
  /**
   * 목록 + 검색
   * http://localhost:9090/resort/contents/list.do
   * http://localhost:9090/resort/contents/list.do?cateno=1&word=스위스
   * @param cateno
   * @param word
   * @return
   */
  @RequestMapping(value = "/contents/list_by_cateno_search.do", method = RequestMethod.GET)
  public ModelAndView list_by_cateno_search(
      @RequestParam(value="cateno", defaultValue="1") int cateno,
      @RequestParam(value="word", defaultValue="") String word
      ) { 
    
    ModelAndView mav = new ModelAndView();
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("cateno", cateno); // #{cateno}
    map.put("word", word);     // #{word}
    
    // 검색 목록
    List<ContentsVO> list = contentsProc.list_by_cateno_search(map);
    mav.addObject("list", list);
    
    // 검색된 레코드 갯수
    int search_count = contentsProc.search_count(map);
    mav.addObject("search_count", search_count);

    CateVO cateVO = cateProc.read(cateno);
    mav.addObject("cateVO", cateVO);

    CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
    mav.addObject("categrpVO", categrpVO); 
    
    mav.addObject("word", word); 
    
    // /contents/list_by_cateno_search.jsp
    mav.setViewName("/contents/list_by_cateno_search");   
    
    return mav;
  }    
  
  // http://localhost:9090/resort/contents/read.do
  /**
   * 조회
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
    
    // 첨부파일 목록
    List<AttachfileVO> attachfile_list = this.attachfileProc.list_by_contentsno(contentsno);
    mav.addObject("attachfile_list", attachfile_list); 
    
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
   * @param passwd 패스워드
   * @return
   */
  @RequestMapping(value="/contents/map_create.do", method=RequestMethod.POST )
  public ModelAndView map_create(int cateno, int contentsno, String map, String passwd) {
    ModelAndView mav = new ModelAndView();

    // System.out.println("map: " + map);
    // System.out.println("contentsno: " + contentsno);
    
    HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
    hashMap.put("map", map);
    hashMap.put("contentsno", contentsno);
    hashMap.put("passwd", passwd);
    
    this.contentsProc.map(hashMap); // 지도 등록
    
    mav.addObject("contentsno", contentsno);
    
    mav.setViewName("redirect:/contents/read.do"); // resort/contents/read.do
    
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
   * @param passwd 컨텐츠 패스워드
   * @return
   */
  @RequestMapping(value="/contents/map_delete.do", method=RequestMethod.POST )
  public ModelAndView map_delete_proc(int cateno, int contentsno, String passwd) {
    ModelAndView mav = new ModelAndView();

    // System.out.println("map: " + map);
    // System.out.println("contentsno: " + contentsno);
    
    HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
    hashMap.put("map", ""); // map 삭제
    hashMap.put("contentsno", contentsno);
    hashMap.put("passwd", passwd);
    
    this.contentsProc.map(hashMap); // 지도 삭제 처리
    
    mav.addObject("contentsno", contentsno);
    
    mav.setViewName("redirect:/contents/read.do"); // resort/contents/read.do
    
    return mav;
  }
  
  
//http://localhost:9090/resort/contents/youtube_create.do?cateno=25&contentsno=28
 /**
  * Youtube 등록 폼
  * @return
  */
 @RequestMapping(value="/contents/youtube_create.do", method=RequestMethod.GET )
 public ModelAndView youtube_create(int cateno, int contentsno) {
   ModelAndView mav = new ModelAndView();
   
   CateVO cateVO = this.cateProc.read(cateno);
   mav.addObject("cateVO", cateVO);
   
   CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
   mav.addObject("categrpVO", categrpVO);
   
   ContentsVO contentsVO = this.contentsProc.read(contentsno);
   mav.addObject("contentsVO", contentsVO);

   mav.setViewName("/contents/youtube_create"); // webapp/contents/youtube_create.jsp
   
   return mav;
 }
 
  //http://localhost:9090/resort/contents/youtube_create.do?cateno=25&contentsno=28
  /**
   * Youtube 등록
   * @param cateno 카테고리 번호
   * @param contentsno 글번호
   * @param youtube 소스
   * @param passwd 패스워드
   * @return
   */
  @RequestMapping(value="/contents/youtube_create.do", method=RequestMethod.POST )
  public ModelAndView youtube_create(int cateno, int contentsno, String youtube, String passwd) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
    hashMap.put("youtube", youtube);
    hashMap.put("contentsno", contentsno);
    hashMap.put("passwd", passwd);
    
    this.contentsProc.youtube(hashMap); // youtube 등록
    
    mav.addObject("contentsno", contentsno);
    
    mav.setViewName("redirect:/contents/read.do"); // resort/contents/read.do
    
    return mav;
  }


//http://localhost:9090/resort/contents/youtube_delete.do?cateno=25&contentsno=28
 /**
  * Youtube 삭제 처리
  * @param cateno 카테고리 번호
  * @param contentsno 글번호
  * @param passwd 컨텐츠 패스워드
  * @return
  */
 @RequestMapping(value="/contents/youtube_delete.do", method=RequestMethod.POST )
 public ModelAndView youtube_delete(int cateno, int contentsno, String passwd) {
   ModelAndView mav = new ModelAndView();

   // System.out.println("youtube: " + youtube);
   // System.out.println("contentsno: " + contentsno);
   
   HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
   hashMap.put("youtube", ""); // youtube 삭제
   hashMap.put("contentsno", contentsno);
   hashMap.put("passwd", passwd);
   
   this.contentsProc.youtube(hashMap); // youtube 삭제 처리
   
   mav.addObject("contentsno", contentsno);
   
   mav.setViewName("redirect:/contents/read.do"); // resort/contents/read.do
   
   return mav;
 }
 
 /**
  * 메시지
  * @param url 이동할 주소
  * @return
  */
 @RequestMapping(value="/contents/msg.do", method=RequestMethod.GET)
 public ModelAndView msg(String url){
   ModelAndView mav = new ModelAndView();
   
   // 등록 처리 메시지: create_msg --> /contents/create_msg.jsp
   // 수정 처리 메시지: update_msg --> /contents/update_msg.jsp
   // 삭제 처리 메시지: delete_msg --> /contents/delete_msg.jsp
   mav.setViewName("/contents/" + url); // forward
   
   return mav; // forward
 }
 
//http://localhost:9090/resort/contents/mp3_create.do?cateno=25&contentsno=28
/**
 * MP3 등록 폼
 * @return
 */
@RequestMapping(value="/contents/mp3_create.do", method=RequestMethod.GET )
public ModelAndView mp3_create(int cateno, int contentsno) {
  ModelAndView mav = new ModelAndView();
  
  CateVO cateVO = this.cateProc.read(cateno);
  mav.addObject("cateVO", cateVO);
  
  CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
  mav.addObject("categrpVO", categrpVO);
  
  ContentsVO contentsVO = this.contentsProc.read(contentsno);
  mav.addObject("contentsVO", contentsVO);

  mav.setViewName("/contents/mp3_create"); // webapp/contents/youtube_create.jsp
  
  return mav;
}

 //http://localhost:9090/resort/contents/mp3_create.do?cateno=25&contentsno=28
 /**
  * MP3 등록
  * @param cateno 카테고리 번호
  * @param contentsno 글번호
  * @param mp3 
  * @param passwd 패스워드
  * @return
  */
 @RequestMapping(value="/contents/mp3_create.do", method=RequestMethod.POST )
 public ModelAndView mp3_create(HttpServletRequest request, ContentsVO contentsVO) {
   ModelAndView mav = new ModelAndView();
   
   // -----------------------------------------------------
   // 파일 전송 코드 시작
   // -----------------------------------------------------
   String mp3 = ""; // mp3 파일
   
   String upDir = Tool.getRealPath(request, "/contents/storage/mp3"); // 절대 경로 // webapp/contents/storage/mp3
   // 전송 파일이 없어도 mf 객체가 생성됨.
   MultipartFile mf = contentsVO.getMp3MF();  // 파일 목록
   long fsize = mf.getSize(); // 전송 파일 크기
   if (fsize > 0) { // 파일 크기 체크
     // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
     
     mp3 = Upload.saveFileSpring(mf, upDir); // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
   
   }    
   // -----------------------------------------------------
   // 파일 전송 코드 종료
   // -----------------------------------------------------
   
   HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
   hashMap.put("mp3", mp3);
   hashMap.put("contentsno", contentsVO.getContentsno());
   hashMap.put("passwd", contentsVO.getPasswd());
   
   this.contentsProc.mp3(hashMap); // mp3 등록
   
   mav.addObject("contentsno", contentsVO.getContentsno());
   
   mav.setViewName("redirect:/contents/read.do"); // resort/contents/read.do
   
   return mav;
 }
 
//http://localhost:9090/resort/contents/mp3_delete.do?cateno=25&contentsno=28
/**
* MP3 삭제 폼
* @return
*/
@RequestMapping(value="/contents/mp3_delete.do", method=RequestMethod.GET )
public ModelAndView mp3_delete(int cateno, int contentsno) {
 ModelAndView mav = new ModelAndView();
 
 CateVO cateVO = this.cateProc.read(cateno);
 mav.addObject("cateVO", cateVO);
 
 CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
 mav.addObject("categrpVO", categrpVO);
 
 ContentsVO contentsVO = this.contentsProc.read(contentsno);
 mav.addObject("contentsVO", contentsVO);

 mav.setViewName("/contents/mp3_delete"); // webapp/contents/mp3_delete.jsp
 
 return mav;
}
 
  //http://localhost:9090/resort/contents/mp3_delete.do?cateno=25&contentsno=28
  /**
   * mp3 삭제 처리
   * @param cateno 카테고리 번호
   * @param contentsno 글번호
   * @param passwd 컨텐츠 패스워드
   * @return
   */
  @RequestMapping(value="/contents/mp3_delete.do", method=RequestMethod.POST )
  public ModelAndView mp3_delete(HttpServletRequest request, int cateno, int contentsno, String passwd) {
    ModelAndView mav = new ModelAndView();
    
    // -----------------------------------------------------
    // 파일 삭제 시작
    // -----------------------------------------------------
    // 삭제할 파일 정보를 읽어옴.
    ContentsVO contentsVO = contentsProc.read(contentsno);
    String upDir = Tool.getRealPath(request, "/contents/storage/mp3"); // 절대 경로
    boolean sw = Tool.deleteFile(upDir, contentsVO.getMp3()); // Folder에서 1건의 파일 삭제
    // -----------------------------------------------------
    // 파일 삭제 코드 종료
    // -----------------------------------------------------
    
    HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
    hashMap.put("mp3", ""); // mp3 삭제
    hashMap.put("contentsno", contentsno);
    hashMap.put("passwd", passwd);
    
    this.contentsProc.mp3(hashMap); // mp3 삭제 처리
    
    mav.addObject("contentsno", contentsno);
    
    mav.setViewName("redirect:/contents/read.do"); // resort/contents/read.do
    
    return mav;
  }
  
//http://localhost:9090/resort/contents/mp4_create.do?cateno=25&contentsno=28
/**
 * MP4 등록 폼
 * @return
 */
@RequestMapping(value="/contents/mp4_create.do", method=RequestMethod.GET )
public ModelAndView mp4_create(int cateno, int contentsno) {
  ModelAndView mav = new ModelAndView();
  
  CateVO cateVO = this.cateProc.read(cateno);
  mav.addObject("cateVO", cateVO);
  
  CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
  mav.addObject("categrpVO", categrpVO);
  
  ContentsVO contentsVO = this.contentsProc.read(contentsno);
  mav.addObject("contentsVO", contentsVO);

  mav.setViewName("/contents/mp4_create"); // webapp/contents/mp4_create.jsp
  
  return mav;
}

 //http://localhost:9090/resort/contents/mp4_create.do?cateno=25&contentsno=28
 /**
  * MP4 등록
  * @param cateno 카테고리 번호
  * @param contentsno 글번호
  * @return
  */
 @RequestMapping(value="/contents/mp4_create.do", method=RequestMethod.POST )
 public ModelAndView mp4_create(HttpServletRequest request, ContentsVO contentsVO) {
   ModelAndView mav = new ModelAndView();
   
   // -----------------------------------------------------
   // 파일 전송 코드 시작
   // -----------------------------------------------------
   String mp4 = ""; // mp4 파일
   
   String upDir = Tool.getRealPath(request, "/contents/storage/mp4"); // 절대 경로 // webapp/contents/storage/mp3
   // 전송 파일이 없어도 mf 객체가 생성됨.
   MultipartFile mf = contentsVO.getMp4MF();  // 파일 목록
   long fsize = mf.getSize(); // 전송 파일 크기
   if (fsize > 0) { // 파일 크기 체크
     // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
     
     mp4 = Upload.saveFileSpring(mf, upDir); // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
   
   }    
   // -----------------------------------------------------
   // 파일 전송 코드 종료
   // -----------------------------------------------------
   
   HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
   hashMap.put("mp4", mp4);
   hashMap.put("contentsno", contentsVO.getContentsno());
   hashMap.put("passwd", contentsVO.getPasswd());
   
   this.contentsProc.mp4(hashMap); // mp4 등록
   
   mav.addObject("contentsno", contentsVO.getContentsno());
   
   mav.setViewName("redirect:/contents/read.do"); // resort/contents/read.do
   
   return mav;
 }
 
//http://localhost:9090/resort/contents/mp4_delete.do?cateno=25&contentsno=28
/**
* MP4 삭제 폼
* @return
*/
@RequestMapping(value="/contents/mp4_delete.do", method=RequestMethod.GET )
public ModelAndView mp4_delete(int cateno, int contentsno) {
 ModelAndView mav = new ModelAndView();
 
 CateVO cateVO = this.cateProc.read(cateno);
 mav.addObject("cateVO", cateVO);
 
 CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
 mav.addObject("categrpVO", categrpVO);
 
 ContentsVO contentsVO = this.contentsProc.read(contentsno);
 mav.addObject("contentsVO", contentsVO);

 mav.setViewName("/contents/mp4_delete"); // webapp/contents/mp4_delete.jsp
 
 return mav;
}
 
  //http://localhost:9090/resort/contents/mp4_delete.do?cateno=25&contentsno=28
  /**
   * mp4 삭제 처리
   * @param cateno 카테고리 번호
   * @param contentsno 글번호
   * @param passwd 컨텐츠 패스워드
   * @return
   */
  @RequestMapping(value="/contents/mp4_delete.do", method=RequestMethod.POST )
  public ModelAndView mp4_delete(HttpServletRequest request, int cateno, int contentsno, String passwd) {
    ModelAndView mav = new ModelAndView();
    
    // -----------------------------------------------------
    // 파일 삭제 시작
    // -----------------------------------------------------
    // 삭제할 파일 정보를 읽어옴.
    ContentsVO contentsVO = contentsProc.read(contentsno);
    String upDir = Tool.getRealPath(request, "/contents/storage/mp4"); // 절대 경로
    boolean sw = Tool.deleteFile(upDir, contentsVO.getMp4()); // Folder에서 1건의 파일 삭제
    // -----------------------------------------------------
    // 파일 삭제 코드 종료
    // -----------------------------------------------------
    
    HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
    hashMap.put("mp4", ""); // mp4 삭제
    hashMap.put("contentsno", contentsno);
    hashMap.put("passwd", passwd);
    
    this.contentsProc.mp4(hashMap); // mp4 삭제 처리
    
    mav.addObject("contentsno", contentsno);
    
    mav.setViewName("redirect:/contents/read.do"); // resort/contents/read.do
    
    return mav;
  }
  
  /**
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9090/resort/contents/list.do
   * http://localhost:9090/resort/contents/list.do?cateno=1&word=스위스&nowPage=1
   * @param cateno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/contents/list.do", method = RequestMethod.GET)
  public ModelAndView list_by_cateno_search_paging(
      @RequestParam(value="cateno", defaultValue="1") int cateno,
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
    System.out.println("--> ContetnsCont, nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("cateno", cateno); // #{cateno}
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage); // 페이지에 출력할 레코드의 범위를 산출하기 위해 사용
    // now page를 proc에서 처리하여 startNum과 endNum을 계산해 냄
    
    // 검색 목록
    List<ContentsVO> list = contentsProc.list_by_cateno_search_paging(map);
    mav.addObject("list", list);
    
    // 검색된 레코드 갯수
    int search_count = contentsProc.search_count(map);
    mav.addObject("search_count", search_count);
  
    // 카테고리 정보 가져오기
    CateVO cateVO = cateProc.read(cateno);
    mav.addObject("cateVO", cateVO);
    
    // 그룹 정보 가져오기
    CategrpVO categrpVO = categrpProc.read(cateVO.getCategrpno());
    mav.addObject("categrpVO", categrpVO);

    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
     * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
     * 
     * @param listFile 목록 파일명 
     * @param cateno 카테고리번호 
     * @param search_count 검색(전체) 레코드수 
     * @param nowPage     현재 페이지
     * @param word 검색어
     * @return 페이징 생성 문자열
     */ 
    String paging = contentsProc.pagingBox("list.do", cateno, search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);
    
    // mav.setViewName("/contents/list_by_cateno_search_paging_img_table1"); // /webapp/contents/list_by_cateno_search_paging.jsp
    // mav.setViewName("/contents/list_by_cateno_search_paging_img_table2");
    mav.setViewName("/contents/list_by_cateno_search_paging_img_grid1");
    return mav;
  }
  
  
}




