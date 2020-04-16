package dev.mvc.calc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller // GET, POST ó��
public class CalcCont2 {
  public CalcCont2() {
    System.out.println("--> CalcCont2 created..."); // ���� �� ���� ��� ����
  }
  
  //http://localhost:9090/calc/calc/add2.do?no1=100&no2=50
 @RequestMapping(value="/calc/add2.do", method=RequestMethod.GET)
 public ModelAndView add(CalcVO calcVO) {
   // CalcVO calcVO
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/calc/calc_vo");
   
   mav.addObject("msg", "���ϱ�");
   mav.addObject("result", ( calcVO.getNo1() + calcVO.getNo2() ) );
   
   return mav;
 }

}
