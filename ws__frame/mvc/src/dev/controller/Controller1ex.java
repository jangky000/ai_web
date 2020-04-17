package dev.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// loadOnStartup 1번이 여러 개면 순차적으로 실행된다.
@WebServlet(urlPatterns = "*.do1ex", loadOnStartup = 1)
public class Controller1ex extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Controller1ex() {
        super();
        System.out.println("--> Controller1ex created.");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");
    PrintWriter out = response.getWriter();
    
    // 이미지 저장 위치: /WebContent/form/images/spring01.jpg
    // 이미지 위치 절대 경로: /mvc/form/images/spring01.jpg
    String uri = request.getRequestURI();
    out.println("<h1>URI: "+ uri +"</h1>");

    if(uri.equals("/mvc/controller1/img1.do1ex")) {
      out.println("<img src='/mvc/form/images/spring01.jpg' style='width: 50%;'>");
    } else if(uri.equals("/mvc/controller1/img2.do1ex")) {
      out.println("<img src='/mvc/form/images/spring03.jpg' style='width: 50%;'>");
    } else if(uri.equals("/mvc/controller1/img3.do1ex")) {
      out.println("<img src='/mvc/form/images/spring14.jpg' style='width: 50%;'>");
    } else {
      out.println("해당하는 이미지가 없습니다");
    }
    
	}

}
