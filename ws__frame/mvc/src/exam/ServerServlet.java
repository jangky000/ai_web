package exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// http://localhost:9090/mvc/exam1/serverservlet.do?forenum=1&rearnum=2
// 동일한 주소가 있으면 에러
@WebServlet("/exam1/serverservlet.do")
public class ServerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public ServerServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
	  
	  int forenum = Integer.parseInt(request.getParameter("forenum")); 
    int rearnum = Integer.parseInt(request.getParameter("rearnum"));
	  
    out.println("<div style=\"margin: 20px auto; width: 30%; padding:20px; outline: solid 1px gray;\">");
    out.println("[계산 결과]<BR><BR>");
    out.println(forenum + "+" + rearnum + " = " + (forenum + rearnum) + "<BR>");
    out.println("</DIV>");
    
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
	}

}
