package dev.controller;
 
import java.io.IOException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
// http://localhost:9090/mvc/controller3/img.do3
//url�� ��û�� ����, submit�� �������ϴ� form action�� ���, // *.do3�� �� 
@WebServlet(urlPatterns="/controller3/img.do3", loadOnStartup=1)
public class Controller3 extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private Controller3Model model =null;
  
  public Controller3() {
    System.out.println("--> Controller3 created.");
    
    //��ü ����
    model = new Controller3Model();
  }
 
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setAttribute("title", "����Ʈ������ 4����");
    
    RequestDispatcher rd = request.getRequestDispatcher("/controller3/form.jsp"); // WEBINF ������ �ּ�
    rd.forward(request, response);
  }
 
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    //������� ����¿� ����, �˰������� ������� ����
    model.setData(request);
    
    RequestDispatcher rd = request.getRequestDispatcher("/controller3/proc.jsp"); // WEBINF ������ �ּ�
    rd.forward(request, response);
  }
  
}