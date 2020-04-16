package dev.form;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// asyncSupported = true, 서블릿 접속자 비동기화 처리
@WebServlet(asyncSupported = true, urlPatterns = { "/form/study2.annotation" })
public class Study2 extends HttpServlet {
  // 버전 관리, 생략 가능
	private static final long serialVersionUID = 1L;
       
    public Study2() { // 기본 생성자, super();를 지워도 자동으로 부모클래스의 생성자를 만든다
        // super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out =  response.getWriter();
    out.println("<h2>GET</h2>");
    out.println("<div style='font-size: 26px; color:#00aa00; text-decoration:bold;'>");
    out.println("  step: "+request.getParameter("step")+"<br>");
    out.println("  next: "+request.getParameter("next"));
    out.println("</div>");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response); // POST로 요청이 들어와도 GET 방식으로 요청을 보냄
	}

}
