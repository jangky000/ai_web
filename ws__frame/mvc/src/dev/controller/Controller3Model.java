package dev.controller;
 
import javax.servlet.http.HttpServletRequest;
 
class Controller3Model{
  public Controller3Model () {
    System.out.println("--> Controller3Model created.");
  }
  
  public void setData(HttpServletRequest request) { // call by reference
    //<input type='radio' name='code' value='img1'> ��, 
    // form.jsp -> controller3.java -> proc.jsp �� request ��ü�� ������� �ʰ� ���� ��
    String code = request.getParameter("code");
    
    if(code.equals("img1")) {
      request.setAttribute("title", "��");
      request.setAttribute("fname", "spring10.jpg");
    } else if(code.equals("img2")) {
      request.setAttribute("title", "����");
      request.setAttribute("fname", "summer10.jpg");
    } else if(code.equals("img3")) {
      request.setAttribute("title", "����");
      request.setAttribute("fname", "fall03.jpg");
    } else if(code.equals("img4")) {
      request.setAttribute("title", "�ܿ�");
      request.setAttribute("fname", "winter04.jpg");
    } else {
      request.setAttribute("title", "�̹����� ��ϵ��� �ʾҽ��ϴ�.");
      request.setAttribute("fname", "none");
    }
    
    
  }
}
 