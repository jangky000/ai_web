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
	  //�ּ� �̵� �� ������������ ���� ��θ� �̿��ؾ� ��(������Ʈ�� ����)
	  request.setAttribute("title", "���� ����");
    request.setAttribute("where", "�泲 �ο�");
    request.setAttribute("when", "7�� 20��~7�� 27��");
    
    // sendRedirect()�� �ϸ� request�� ����� �ڷᰡ �������.
	  // response.sendRedirect(request.getContextPath()+"/form/festival_req.jsp");
	  
    //forward ���, jsp ������ url�ּҸ� �������� �ʰ� ó�� �����ϴ�.
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
    out.println("[���� ���� ���� ����]<BR><BR>");
    out.println("������: " + new Date().toLocaleString() + "<BR>");
    out.println("�̸�: " + request.getParameter("title") + "<BR>");
    out.println("����: " + request.getParameter("where") + "<BR>");
    out.println("�Ⱓ: " + request.getParameter("when") + "<BR>");
    out.println("</DIV>");
	}

}