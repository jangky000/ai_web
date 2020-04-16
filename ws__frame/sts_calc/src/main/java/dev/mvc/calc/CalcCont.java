package dev.mvc.calc;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller // GET, POST ó��
public class CalcCont {
  public CalcCont() {
    System.out.println("--> CalcCont created..."); // ���� �� ���� ��� ����
  }
  
  // http://localhost:9090/calc/calc/add.do?no1=100&no2=50
  // �޼ҵ庰�� url�� ������ �� �ִ�.
  @RequestMapping(value="/calc/add.do", method=RequestMethod.GET)
  public ModelAndView add(int no1, int no2) {
    //int no1 = Integer.parseInt(request.getParameter("no1"));
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/calc/calc2"); //   -->  /WEB-INF/views/calc/calc1.jsp
    /*
     * setViewName�� ���� ���ٰ� ����  --> prefix + setViewName + suffix
     *  <beans:property name="prefix" value="/WEB-INF/views/" /><!-- JSP ���� -->
     *  <beans:property name="suffix" value=".jsp" />
    */
    
    //request.setAttribute("msg", "���ϱ�")�� ���� 
    // -> �׷��� getAttribute�� ${}�� ������ ��� ����
    mav.addObject("msg", "���ϱ�");
    mav.addObject("result", no1+no2);
    
    return mav; // forward, request ��ü�� �״�� ����
  }
  
  //http://localhost:9090/calc/calc/sub.do?no1=100&no2=50
  @RequestMapping(value="/calc/sub.do", method=RequestMethod.GET)
  public ModelAndView sub(int no1, int no2) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/calc/calc2");
    
    mav.addObject("msg", "����");
    mav.addObject("result", no1-no2); 
    
    return mav;
  }
  
  //http://localhost:9090/calc/calc/mul.do?no1=100&no2=50
  @RequestMapping(value="/calc/mul.do", method=RequestMethod.GET)
  public ModelAndView mul(int no1, int no2) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/calc/calc2");
    mav.addObject("msg", "���ϱ�");
    mav.addObject("result", no1*no2); 
    return mav;
  }
  
//http://localhost:9090/calc/calc/div.do?no1=100&no2=50
  @RequestMapping(value="/calc/div.do", method=RequestMethod.GET)
  public ModelAndView div(int no1, int no2) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/calc/calc2");
    mav.addObject("msg", "������");
    mav.addObject("result", (int)no1/no2);
    return mav;
  }
  
//http://localhost:9090/calc/calc/mod.do?no1=100&no2=50
  @RequestMapping(value="/calc/mod.do", method=RequestMethod.GET)
  public ModelAndView mod(int no1, int no2) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/calc/calc2");
    mav.addObject("msg", "������");
    mav.addObject("result", no1%no2);
    return mav;
  }

}
