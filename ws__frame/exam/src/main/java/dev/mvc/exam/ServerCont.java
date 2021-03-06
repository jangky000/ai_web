package dev.mvc.exam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ServerCont {
  
  public ServerCont() {
    System.out.println("--> ServerCont created");
  }

  //http://localhost:9090/exam/exam/sum.do?forenum=1&rearnum=2
  @RequestMapping(value = "/exam/sum.do", method = RequestMethod.GET)
  public ModelAndView sum(@RequestParam(value="forenum", defaultValue="0") int forenum, 
                                          @RequestParam(value="rearnum", defaultValue="0") int rearnum ) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("sum", forenum+rearnum);
    mav.setViewName("/exam/sum"); //webapp/exam/sum.jsp
    return mav;
  }
  
  //http://localhost:9090/exam/exam/image.do?imgno=1
  @RequestMapping(value = "/exam/image.do", method = RequestMethod.GET)
  public ModelAndView image(int imgno) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("imgno", imgno);
    mav.setViewName("/exam/image"); //webapp/exam/image.jsp
    return mav;
  }
  
  //http://localhost:9090/exam/exam/redirect.do
  @RequestMapping(value = "/exam/redirect.do", method = RequestMethod.GET)
  public ModelAndView redirect() {
    ModelAndView mav = new ModelAndView();
    mav.addObject("is_redirect", 1);
    mav.setViewName("redirect:/exam/sum.do"); 
    return mav;
  }
}
