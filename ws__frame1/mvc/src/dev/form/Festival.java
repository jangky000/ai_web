package dev.form;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// http://localhost:9090/mvc/form/festival.do
@WebServlet("/form/festival.do")
public class Festival extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Festival() {
        super();
    }

  // festival.jsp 출력, html에 자바코드를 섞지 않게 함으로 JSP를 곧바로 보여주지 않아 보안에 유리하다
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("Context path(프로젝트 별명): " + request.getContextPath() ); // Context path: /mvc
		// System.out.println("절대 경로: " + request.getContextPath() ); // 위와 같은 말
		// System.out.println("프로젝트명: " + request.getContextPath() ); // 위와 같은 말
		
	  //주소 이동 시 서블릿에서는 절대 경로를 이용해야 함
	  response.sendRedirect(request.getContextPath()+"/form/festival.jsp");
	  
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");
    PrintWriter out = response.getWriter();
 
    out.println("<div style='width:50%; margin: 30px auto; font-size:26px;'>");
    out.println("[축제 참가 접수 내역]<BR><BR>");
    out.println("접수일: " + new Date().toLocaleString() + "<BR>"); //java.util
    out.println("이름: " + request.getParameter("title") + "<BR>");
    out.println("기간: " + request.getParameter("period") + "<BR>");
    out.println("지역: " + request.getParameter("area") + "<BR><BR>");
    out.println("<button type='button' onclick='history.back()'>HOME</button>");
    out.println("</div>");
	}

}
