package dev.mvc.init;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReadImgCont {
  public ReadImgCont() {
    System.out.println("--> ReadImgCont created..."); // 생성 후 실행 대기 상태
  }
  
  //http://localhost:9090/init/gallery/read_img.do
 @RequestMapping(value="/gallery/read_img.do", method=RequestMethod.GET)
 public ModelAndView read_img() {
   ModelAndView mav = new ModelAndView();
   //mav.setViewName("read_img"); // WEB-INF/views/read_img.jsp
   mav.setViewName("gallery/read_img"); // WEB-INF/views/gallery/read_img.jsp
   
   mav.addObject("img", "img01.jpg");
   return mav;
 }

//http://localhost:9090/init/gallery/read_img2.do
@RequestMapping(value="/gallery/read_img2.do", method=RequestMethod.GET)
public ModelAndView read_img2() {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("gallery/read_img2"); // WEB-INF/views/gallery/read_img2.jsp
  
  mav.addObject("img", "img02.jpg");
  return mav;
}

//http://localhost:9090/init/gallery/read_img4.do
@RequestMapping(value="/gallery/read_img4.do", method=RequestMethod.GET)
public ModelAndView read_img4() {
ModelAndView mav = new ModelAndView();
mav.setViewName("gallery/read_img4"); // webapp/gallery/read_img4.jsp

mav.addObject("img", "img03.jpg");
return mav;
}
 
}
