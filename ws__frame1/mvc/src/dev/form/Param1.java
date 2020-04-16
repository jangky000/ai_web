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
  
  //config ��ü�� Param ���� ���𹮿� ����
  @Override
  public void init(ServletConfig config) throws ServletException {
    System.out.println("init() ȣ���");
    this.id = config.getInitParameter("id");
    this.grade = config.getInitParameter("grade");
  }
  
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    System.out.println("doGet() ȣ���");
    
    response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");
    PrintWriter out =  response.getWriter();
    out.println("<H1>");
    out.println("  ���� �ʱⰪ ����<br>");
    out.println("  ID: " + this.id + "<br>");
    out.println("  ���: " + this.grade + "<br>");
    out.println("</H1>");
    
  }

}
