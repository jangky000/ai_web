package dev.mvc.calc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller // GET, POST 처리
public class CalcCont3 {
  public CalcCont3() {
    System.out.println("--> CalcCont3 created..."); // 생성 후 실행 대기 상태
  }
  
  //http://localhost:9090/calc/adder/add3.do
 @RequestMapping(value="/adder/add3.do", method=RequestMethod.GET)
 public ModelAndView add() {
   // CalcVO calcVO
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/adder/tot_form"); // WEB-INF/views/adder/tot_form.jsp
   // WEB-INF/spring/appServlet/servlet-context.xml
   // <beans:property name="prefix" value="/WEB-INF/views/" /><!-- JSP 폴더 -->
   // <beans:property name="suffix" value=".jsp" />
   
   return mav;
 }
 
//http://localhost:9090/calc/calc/add3.do
@RequestMapping(value="/adder/add3.do", method=RequestMethod.POST)
public ModelAndView add(CalcVO calcVO) { // 메소드 오버로딩
  // CalcVO calcVO가 request에도 자동으로 저장됨 -> 하지만 EL에서 ${calcVO.no1}로 사용하게 되면, 데이터의 출처가 어딘지 모르는 문제가 있음
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/adder/tot_proc"); 
  
  int no1 = calcVO.getNo1();
  int no2 = calcVO.getNo2();
  
  mav.addObject("msg", "더하기");
  //mav.addObject("no1", no1);
  //mav.addObject("no2", no2);
  mav.addObject("result", ( no1 + no2 ) );
  
  return mav;
}

}
