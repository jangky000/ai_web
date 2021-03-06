package dev.form;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// http://localhost:9090/mvc/form/calc.do
// 동일한 주소가 있으면 에러
@WebServlet("/form/calc.do")
public class Calc extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Calc() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  response.sendRedirect(request.getContextPath()+"/form/calc.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  request.setCharacterEncoding("utf-8");
	  response.setContentType("text/html;charset=utf-8");
	  PrintWriter out = response.getWriter();
	  
	  int su1 = Integer.parseInt(request.getParameter("su1")); 
	  int su2 = Integer.parseInt(request.getParameter("su2"));
	  
	  out.println("<DIV style='width: 50%; margin: 30px auto;'>");
    out.println("[계산 결과]<BR><BR>");
    out.println("+: " + (su1 + su2) + "<BR>");
    out.println("-: " + (su1 - su2) + "<BR>");
    out.println("*: " + (su1 * su2) + "<BR>");
    out.println("/: " + (su1 / su2) + "<BR>");
    out.println("</DIV>");
	  
	  
	}

}
