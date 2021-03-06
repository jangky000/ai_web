package dev.form;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Study1 extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out =  response.getWriter();
    out.println("<h2>GET</h2>");
    out.println("<div style='font-size: 26px; color:#ff0000; text-decoration:bold;'>");
    out.println("  step: "+request.getParameter("step")+"<br>");
    out.println("  next: "+request.getParameter("next"));
    out.println("</div>");
    
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out =  response.getWriter();
    out.println("<h2>POST</h2>");
    out.println("<div style='font-size: 26px; color:#0000ff; text-decoration:bold;'>");
    out.println("  step: "+request.getParameter("step")+"<br>");
    out.println("  next: "+request.getParameter("next"));
    out.println("</div>");
  }

}
