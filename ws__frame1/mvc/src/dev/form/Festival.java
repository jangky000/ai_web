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

  // festival.jsp ���, html�� �ڹ��ڵ带 ���� �ʰ� ������ JSP�� ��ٷ� �������� �ʾ� ���ȿ� �����ϴ�
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("Context path(������Ʈ ����): " + request.getContextPath() ); // Context path: /mvc
		// System.out.println("���� ���: " + request.getContextPath() ); // ���� ���� ��
		// System.out.println("������Ʈ��: " + request.getContextPath() ); // ���� ���� ��
		
	  //�ּ� �̵� �� ������������ ���� ��θ� �̿��ؾ� ��
	  response.sendRedirect(request.getContextPath()+"/form/festival.jsp");
	  
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");
    PrintWriter out = response.getWriter();
 
    out.println("<div style='width:50%; margin: 30px auto; font-size:26px;'>");
    out.println("[���� ���� ���� ����]<BR><BR>");
    out.println("������: " + new Date().toLocaleString() + "<BR>"); //java.util
    out.println("�̸�: " + request.getParameter("title") + "<BR>");
    out.println("�Ⱓ: " + request.getParameter("period") + "<BR>");
    out.println("����: " + request.getParameter("area") + "<BR><BR>");
    out.println("<button type='button' onclick='history.back()'>HOME</button>");
    out.println("</div>");
	}

}