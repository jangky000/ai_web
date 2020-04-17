package dev.form;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// �Ķ���ʹ� �⺻������ ��� ��Ʈ������ ó����
@WebServlet(
    urlPatterns = { "/form/param2.do" },
    initParams = {
                          @WebInitParam(name="su1", value="100"),
                          @WebInitParam(name="su2", value="2")
                        }
    )
public class Param2 extends HttpServlet {
  private static final long serialVersionUID = 1L;
  
  private int su1 = 0;
  private int su2 = 0;
  
  public Param2() {
  }

  @Override
  public void init(ServletConfig config) throws ServletException {
    System.out.println("init() ȣ���");
    this.su1 = Integer.parseInt(config.getInitParameter("su1"));
    this.su2 = Integer.parseInt(config.getInitParameter("su2"));
  }
  
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");
    PrintWriter out = response.getWriter();
    
    out.println("<DIV style='width: 50%; margin: 30px auto; font-size: 26px;'>");
    out.println("[��� ���]<BR><BR>");
    out.println("+: " + (this.su1 + this.su2) + "<BR>");
    out.println("-: " + (this.su1 - this.su2) + "<BR>");
    out.println("x: " + (this.su1 * this.su2) + "<BR>");
    out.println("��: " + (this.su1 / this.su2) + "<BR>");
    out.println("</DIV>");

  }

}