package dev.form;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/form/festival_req.do")
public class FestivalReq extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FestivalReq() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  //주소 이동 시 서블릿에서는 절대 경로를 이용해야 함(프로젝트명 포함)
	  request.setAttribute("title", "연꽃 축제");
    request.setAttribute("where", "충남 부여");
    request.setAttribute("when", "7월 20일~7월 27일");
    
    // sendRedirect()를 하면 request에 저장된 자료가 사라진다.
	  // response.sendRedirect(request.getContextPath()+"/form/festival_req.jsp");
	  
    //forward 방식, jsp 파일의 url주소를 노출하지 않고 처리 가능하다.
    // <jsp:forward page="./form/festival_req.jsp"></jsp:forward>
    String view = "/form/festival_req.jsp";
	  RequestDispatcher dispatcher = request.getRequestDispatcher(view);
	  dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");
    PrintWriter out = response.getWriter();

    out.println("<DIV style='width: 50%; margin: 30px auto; font-size: 26px;'>");
    out.println("[축제 참가 접수 내역]<BR><BR>");
    out.println("접수일: " + new Date().toLocaleString() + "<BR>");
    out.println("이름: " + request.getParameter("title") + "<BR>");
    out.println("지역: " + request.getParameter("where") + "<BR>");
    out.println("기간: " + request.getParameter("when") + "<BR>");
    out.println("</DIV>");
	}

}
