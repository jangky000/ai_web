package dev.mvc.attachfile;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cate.CateProcInter;
import dev.mvc.cate.CateVO;
import dev.mvc.contents.ContentsProcInter;
import dev.mvc.contents.ContentsVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class AttachfileCont {
  
  @Autowired
  @Qualifier("dev.mvc.attachfile.AttachfileProc")
  private AttachfileProcInter attachfileProc;
  
  public AttachfileCont(){
    System.out.println("--> AttachfileCont created.");
  }
  
  // http://localhost:9090/resort/attachfile/create.do
  /**
   * 등록폼
   * @param 
   * @return
   */
  @RequestMapping(value="/attachfile/create.do", method=RequestMethod.GET)
  public ModelAndView create(int cateno) {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/attachfile/create"); // webapp/attachfile/create.jsp
    return mav;
  }
  
 //http://localhost:9090/resort/attachfile/create.do
 /**
  * 파일 등록 처리
  * @param request
  * @param attachfileVO
  * @param cateno 게시판 카테고리 번호
  * @return
  */
  @RequestMapping(value = "/attachfile/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request,
                                           AttachfileVO attachfileVO,
                                           int cateno) {
    // System.out.println("--> categrpno: " + categrpno);
    
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    int contentsno = attachfileVO.getContentsno(); // 부모글 번호
    String fname = ""; // 원본 파일명
    String fupname = ""; // 업로드된 파일명
    long fsize = 0;  // 파일 사이즈
    String thumb = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수
    
    String upDir = Tool.getRealPath(request, "/attachfile/storage"); // 절대 경로를 가져옴
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = attachfileVO.getFnamesMF(); // 파일 목록 (자바는 파일 객체가 따로 있다. )
    int count = fnamesMF.size(); // 전송 파일 개수
    if (count > 0) { // 전송할 파일이 있다면
      for (MultipartFile multipartFile:fnamesMF) { // 파일 추출
        fsize = multipartFile.getSize();  // 파일 크기
        if (fsize > 0) { // 파일 크기 체크
          fname = multipartFile.getOriginalFilename(); // 원본 파일명 ex) spring.jpg
          
          // 파일 저장 후 업로드된 파일명이 리턴됨 ex) spring.jpg, spring_1.jpg, spring_2.jpg ...
          // 솔루션 업체에서 tool 등을 제작, 경력이 쌓이면 솔루션으로 이직 많이 한다.. 
          fupname = Upload.saveFileSpring(multipartFile, upDir); // 파일 저장(업로드할 파일,업로드할 디렉터리)
          
          if (Tool.isImage(fname)) { // 이미지인지 검사
            // thumb 이미지 생성 후 파일명 리턴, width:120, height: 80
            thumb = Tool.preview(upDir, fupname, 120, 80); // 생성, updir에 저장
          }
        }
        AttachfileVO vo = new AttachfileVO();
        vo.setContentsno(contentsno);
        vo.setFname(fname);
        vo.setFupname(fupname);
        vo.setThumb(thumb);
        vo.setFsize(fsize);
        
        upload_count = upload_count + attachfileProc.create(vo); // 파일 1건 등록 정도 dbms 저장
      }
    }    
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------
    
    // ra.addAttribute("upload_count", upload_count);
    // ra.addAttribute("cateno", cateno);
    // ra.addAttribute("contentsno", attachfileVO.getContentsno());
    
    mav.addObject("upload_count", upload_count);
    mav.addObject("cateno", cateno);
    mav.addObject("contentsno", contentsno);
    
    //mav.setViewName("/attachfile/create_msg"); // webapp/attachfile.create_msg.jsp // 포워드를 사용하면 안됨
    mav.setViewName("redirect:/attachfile/create_msg.jsp");
    
    return mav;
  }
  
//http://localhost:9090/resort/attachfile/list.do
 /**
  * 전체 목록
  * @return
  */
 @RequestMapping(value="/attachfile/list.do", method=RequestMethod.GET )
 public ModelAndView list() {
   ModelAndView mav = new ModelAndView();
   
   List<AttachfileVO> list = this.attachfileProc.list();
   mav.addObject("list", list); // request.setAttribute("list", list);

   mav.setViewName("/attachfile/list"); // webapp/attachfile/list.jsp
   return mav;
 }
 
 /**
  * 첨부 파일 1건 삭제 처리
  * 
  * @return
  */
 @RequestMapping(value = "/attachfile/delete.do", 
                            method = RequestMethod.GET)
 public ModelAndView delete_proc(HttpServletRequest request,
                                               int attachfileno) {
   ModelAndView mav = new ModelAndView();

   // 삭제할 파일 정보를 읽어옴.
   AttachfileVO attachfileVO = attachfileProc.read(attachfileno);
   
   String upDir = Tool.getRealPath(request, "/attachfile/storage"); // 절대 경로
   Tool.deleteFile(upDir, attachfileVO.getFupname()); // Folder에서 1건의 파일 삭제
   Tool.deleteFile(upDir, attachfileVO.getThumb()); // 1건의 Thumb 파일 삭제
   
   // DBMS에서 1건의 파일 삭제
   attachfileProc.delete(attachfileno);
       
   List<AttachfileVO> list = attachfileProc.list();
   mav.addObject("list", list);
   
   mav.setViewName("redirect:/attachfile/list.do"); 

   return mav;
 }
}