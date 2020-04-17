package dev.form;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ������Ʈ���� ǥ������ ����
@WebServlet("/form/getpost.do")
public class GetPost extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public GetPost() {
    super();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");
    PrintWriter out =  response.getWriter();
    
    out.println("<DIV style='text-align: center; font-size: 26px;'>");
    out.println("  doGet() ȣ���<BR>");
    out.println("  <br><br>");
    out.println("  <button type='button' onclick='history.back();' style=\"font-size: 26px;\">HOME</button>");
    out.println("</DIV>");
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");
    PrintWriter out =  response.getWriter();
    
    out.println("<DIV style='text-align: center; font-size: 26px;' >");
    out.println("  doPost() ȣ���<BR>");
    out.println("  <br><br>");
    out.println("  <button type='button' onclick='history.back();' style='font-size: 26px;'>HOME</button>");
    out.println("</DIV>");
  }

}