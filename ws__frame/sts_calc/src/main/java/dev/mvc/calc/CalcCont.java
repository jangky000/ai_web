package dev.mvc.calc;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller // GET, POST 처리
public class CalcCont {
  public CalcCont() {
    System.out.println("--> CalcCont created..."); // 생성 후 실행 대기 상태
  }
  
  // http://localhost:9090/calc/calc/add.do?no1=100&no2=50
  // 메소드별로 url을 매핑할 수 있다.
  @RequestMapping(value="/calc/add.do", method=RequestMethod.GET)
  public ModelAndView add(int no1, int no2) {
    //int no1 = Integer.parseInt(request.getParameter("no1"));
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/calc/calc2"); //   -->  /WEB-INF/views/calc/calc1.jsp
    /*
     * setViewName은 다음 두줄과 연결  --> prefix + setViewName + suffix
     *  <beans:property name="prefix" value="/WEB-INF/views/" /><!-- JSP 폴더 -->
     *  <beans:property name="suffix" value=".jsp" />
    */
    
    //request.setAttribute("msg", "더하기")와 동일 
    // -> 그래서 getAttribute와 ${}로 가져와 사용 가능
    mav.addObject("msg", "더하기");
    mav.addObject("result", no1+no2);
    
    return mav; // forward, request 객체를 그대로 전달
  }
  
  //http://localhost:9090/calc/calc/sub.do?no1=100&no2=50
  @RequestMapping(value="/calc/sub.do", method=RequestMethod.GET)
  public ModelAndView sub(int no1, int no2) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/calc/calc2");
    
    mav.addObject("msg", "빼기");
    mav.addObject("result", no1-no2); 
    
    return mav;
  }
  
  //http://localhost:9090/calc/calc/mul.do?no1=100&no2=50
  @RequestMapping(value="/calc/mul.do", method=RequestMethod.GET)
  public ModelAndView mul(int no1, int no2) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/calc/calc2");
    mav.addObject("msg", "곱하기");
    mav.addObject("result", no1*no2); 
    return mav;
  }
  
//http://localhost:9090/calc/calc/div.do?no1=100&no2=50
  @RequestMapping(value="/calc/div.do", method=RequestMethod.GET)
  public ModelAndView div(int no1, int no2) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/calc/calc2");
    mav.addObject("msg", "나누기");
    mav.addObject("result", (int)no1/no2);
    return mav;
  }
  
//http://localhost:9090/calc/calc/mod.do?no1=100&no2=50
  @RequestMapping(value="/calc/mod.do", method=RequestMethod.GET)
  public ModelAndView mod(int no1, int no2) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/calc/calc2");
    mav.addObject("msg", "나머지");
    mav.addObject("result", no1%no2);
    return mav;
  }

}
