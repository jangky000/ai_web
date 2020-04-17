package dev.mvc.calc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller // GET, POST ó��
public class CalcCont3 {
  public CalcCont3() {
    System.out.println("--> CalcCont3 created..."); // ���� �� ���� ��� ����
  }
  
  //http://localhost:9090/calc/adder/add3.do
 @RequestMapping(value="/adder/add3.do", method=RequestMethod.GET)
 public ModelAndView add() {
   // CalcVO calcVO
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/adder/tot_form"); // WEB-INF/views/adder/tot_form.jsp
   // WEB-INF/spring/appServlet/servlet-context.xml
   // <beans:property name="prefix" value="/WEB-INF/views/" /><!-- JSP ���� -->
   // <beans:property name="suffix" value=".jsp" />
   
   return mav;
 }
 
//http://localhost:9090/calc/calc/add3.do
@RequestMapping(value="/adder/add3.do", method=RequestMethod.POST)
public ModelAndView add(CalcVO calcVO) { // �޼ҵ� �����ε�
  // CalcVO calcVO�� request���� �ڵ����� ����� -> ������ EL���� ${calcVO.no1}�� ����ϰ� �Ǹ�, �������� ��ó�� ����� �𸣴� ������ ����
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/adder/tot_proc"); 
  
  int no1 = calcVO.getNo1();
  int no2 = calcVO.getNo2();
  
  mav.addObject("msg", "���ϱ�");
  //mav.addObject("no1", no1);
  //mav.addObject("no2", no2);
  mav.addObject("result", ( no1 + no2 ) );
  
  return mav;
}

}