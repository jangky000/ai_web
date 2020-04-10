package dev.form;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletTest1 extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    System.out.println("GET");
    response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");
    PrintWriter out =  response.getWriter();
    out.println("<h2>문자열 출력</h2>");
    out.println("<div style='font-size: 26px; color:#ff0000; text-decoration:bold;'>");
    out.println("  JAVA: "+request.getParameter("java")+"<br>");
    out.println("  JSP: "+request.getParameter("jsp"));
    out.println("</div>");
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    System.out.println("POST");
  }

}
