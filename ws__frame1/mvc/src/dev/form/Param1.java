package dev.form;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Param1 extends HttpServlet {
  private static final long serialVersionUID = 1L;
  
  private String id = "";
  private String grade = "";
  
  //config 객체는 Param 서블릿 선언문에 접근
  @Override
  public void init(ServletConfig config) throws ServletException {
    System.out.println("init() 호출됨");
    this.id = config.getInitParameter("id");
    this.grade = config.getInitParameter("grade");
  }
  
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    System.out.println("doGet() 호출됨");
    
    response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");
    PrintWriter out =  response.getWriter();
    out.println("<H1>");
    out.println("  서블릿 초기값 설정<br>");
    out.println("  ID: " + this.id + "<br>");
    out.println("  등급: " + this.grade + "<br>");
    out.println("</H1>");
    
  }

}
