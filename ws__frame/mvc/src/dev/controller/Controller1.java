package dev.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// loadOnStartup ��Ĺ�� ������ �� �ڵ����� ����, 
// ��Ĺ ���� �޸�(RAM)�� �����ϴ� ���α׷��� ����, ��׶��� ���μ����� ����� ����
// �ӵ��� JSP���� ������
@WebServlet(urlPatterns = "*.do1", loadOnStartup = 1)
public class Controller1 extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public Controller1() {
    super();
    System.out.println("--> Controller1 created.");
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");
    PrintWriter out =  response.getWriter();
    
   System.out.println("Controller1 doGet()");
    out.println("<h1>Hello MVC</h1>");
    out.println("<h1>URL: "+ request.getRequestURL() +"</h1>");
    out.println("<h1>URI: "+ request.getRequestURI() +"</h1>");
  }

}
