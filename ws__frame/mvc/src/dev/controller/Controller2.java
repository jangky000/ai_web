package dev.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "*.do2", loadOnStartup = 1)
public class Controller2 extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public Controller2() {
    super();
    System.out.println("--> Controller2 created.");

  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    //http://127.0.0.1:9090/mvc/controller2/img1.do2ex
    String uri = request.getRequestURI(); // uri = /mvc/controller2/img1.do2ex
    
    if(uri.equals("/mvc/controller2/spring.do2")) {
      request.setAttribute("title", "��");
      request.setAttribute("fname", "spring10.jpg");
    } else if(uri.equals("/mvc/controller2/summer.do2")) {
      request.setAttribute("title", "����");
      request.setAttribute("fname", "summer10.jpg");
    } else if(uri.equals("/mvc/controller2/fall.do2")) {
      request.setAttribute("title", "����");
      request.setAttribute("fname", "fall03.jpg");
    } else if(uri.equals("/mvc/controller2/winter.do2")) {
      request.setAttribute("title", "�ܿ�");
      request.setAttribute("fname", "winter04.jpg");
    } else {
      request.setAttribute("title", "�̹����� ��ϵ��� �ʾҽ��ϴ�.");
      request.setAttribute("fname", "none");
    }
    
    String view = "/season/view.jsp"; // webcontent ����
    
    RequestDispatcher dispatcher = request.getRequestDispatcher(view);
    dispatcher.forward(request, response);
    
  }


}