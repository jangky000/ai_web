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
   * �����
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
  * ���� ��� ó��
  * @param request
  * @param attachfileVO
  * @param cateno �Խ��� ī�װ��� ��ȣ
  * @return
  */
  @RequestMapping(value = "/attachfile/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request,
                                           AttachfileVO attachfileVO,
                                           int cateno) {
    // System.out.println("--> categrpno: " + categrpno);
    
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    int contentsno = attachfileVO.getContentsno(); // �θ�� ��ȣ
    String fname = ""; // ���� ���ϸ�
    String fupname = ""; // ���ε�� ���ϸ�
    long fsize = 0;  // ���� ������
    String thumb = ""; // Preview �̹���
    int upload_count = 0; // ����ó���� ���ڵ� ����
    
    String upDir = Tool.getRealPath(request, "/attachfile/storage"); // ���� ��θ� ������
    // ���� ������ ����� fnamesMF ��ü�� ������.
    List<MultipartFile> fnamesMF = attachfileVO.getFnamesMF(); // ���� ��� (�ڹٴ� ���� ��ü�� ���� �ִ�. )
    int count = fnamesMF.size(); // ���� ���� ����
    if (count > 0) { // ������ ������ �ִٸ�
      for (MultipartFile multipartFile:fnamesMF) { // ���� ����
        fsize = multipartFile.getSize();  // ���� ũ��
        if (fsize > 0) { // ���� ũ�� üũ
          fname = multipartFile.getOriginalFilename(); // ���� ���ϸ� ex) spring.jpg
          
          // ���� ���� �� ���ε�� ���ϸ��� ���ϵ� ex) spring.jpg, spring_1.jpg, spring_2.jpg ...
          // �ַ�� ��ü���� tool ���� ����, ����� ���̸� �ַ������ ���� ���� �Ѵ�.. 
          fupname = Upload.saveFileSpring(multipartFile, upDir); // ���� ����(���ε��� ����,���ε��� ���͸�)
          
          if (Tool.isImage(fname)) { // �̹������� �˻�
            // thumb �̹��� ���� �� ���ϸ� ����, width:120, height: 80
            thumb = Tool.preview(upDir, fupname, 120, 80); // ����, updir�� ����
          }
        }
        AttachfileVO vo = new AttachfileVO();
        vo.setContentsno(contentsno);
        vo.setFname(fname);
        vo.setFupname(fupname);
        vo.setThumb(thumb);
        vo.setFsize(fsize);
        
        upload_count = upload_count + attachfileProc.create(vo); // ���� 1�� ��� ���� dbms ����
      }
    }    
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    
    // ra.addAttribute("upload_count", upload_count);
    // ra.addAttribute("cateno", cateno);
    // ra.addAttribute("contentsno", attachfileVO.getContentsno());
    
    mav.addObject("upload_count", upload_count);
    mav.addObject("cateno", cateno);
    mav.addObject("contentsno", contentsno);
    
    //mav.setViewName("/attachfile/create_msg"); // webapp/attachfile.create_msg.jsp // �����带 ����ϸ� �ȵ�
    mav.setViewName("redirect:/attachfile/create_msg.jsp");
    
    return mav;
  }
  
//http://localhost:9090/resort/attachfile/list.do
 /**
  * ��ü ���
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
  * ÷�� ���� 1�� ���� ó��
  * 
  * @return
  */
 @RequestMapping(value = "/attachfile/delete.do", 
                            method = RequestMethod.GET)
 public ModelAndView delete_proc(HttpServletRequest request,
                                               int attachfileno) {
   ModelAndView mav = new ModelAndView();

   // ������ ���� ������ �о��.
   AttachfileVO attachfileVO = attachfileProc.read(attachfileno);
   
   String upDir = Tool.getRealPath(request, "/attachfile/storage"); // ���� ���
   Tool.deleteFile(upDir, attachfileVO.getFupname()); // Folder���� 1���� ���� ����
   Tool.deleteFile(upDir, attachfileVO.getThumb()); // 1���� Thumb ���� ����
   
   // DBMS���� 1���� ���� ����
   attachfileProc.delete(attachfileno);
       
   List<AttachfileVO> list = attachfileProc.list();
   mav.addObject("list", list);
   
   mav.setViewName("redirect:/attachfile/list.do"); 

   return mav;
 }
}