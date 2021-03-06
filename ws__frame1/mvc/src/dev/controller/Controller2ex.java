package dev.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "*.do2ex", loadOnStartup = 1)
public class Controller2ex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Controller2ex() {
        super();
        System.out.println("--> Controller2ex created.");
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  String uri = request.getRequestURI();
	  
	  if(uri.equals("/mvc/controller2/img1.do2ex")) {
      request.setAttribute("title", "Happy");
      request.setAttribute("fname", "happy.jpg");
    } else if(uri.equals("/mvc/controller2/img2.do2ex")) {
      request.setAttribute("title", "Home");
      request.setAttribute("fname", "home.jpg");
    } else if(uri.equals("/mvc/controller2/img3.do2ex")) {
      request.setAttribute("title", "Relax");
      request.setAttribute("fname", "relax.jpg");
    } else if(uri.equals("/mvc/controller2/img4.do2ex")) {
      request.setAttribute("title", "Smile");
      request.setAttribute("fname", "smile.jpg");
    } else {
      request.setAttribute("title", "이미지가 등록되지 않았습니다.");
      request.setAttribute("fname", "none");
    }
	  
	  String view = "/season/viewex.jsp";
	  RequestDispatcher rd = request.getRequestDispatcher(view);
	  rd.forward(request, response);
	}



}
