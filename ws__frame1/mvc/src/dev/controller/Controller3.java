package dev.controller;
 
import java.io.IOException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
// http://localhost:9090/mvc/controller3/img.do3
//url에 요청을 지정, submit을 보내야하는 form action의 대상, // *.do3와 비교 
@WebServlet(urlPatterns="/controller3/img.do3", loadOnStartup=1)
public class Controller3 extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private Controller3Model model =null;
  
  public Controller3() {
    System.out.println("--> Controller3 created.");
    
    //객체 생성
    model = new Controller3Model();
  }
 
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setAttribute("title", "오스트리아의 4계절");
    
    RequestDispatcher rd = request.getRequestDispatcher("/controller3/form.jsp"); // WEBINF 이후의 주소
    rd.forward(request, response);
  }
 
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    //사용자의 입출력에 집중, 알고리즘을 사용하지 않음
    model.setData(request);
    
    RequestDispatcher rd = request.getRequestDispatcher("/controller3/proc.jsp"); // WEBINF 이후의 주소
    rd.forward(request, response);
  }
  
}