<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.util.Date" %>
 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
%>
 
<%
// 생성하고 다시 보냄 -> 리다이렉트를 해도 사라지지 않음
session.setAttribute("id", "user1@mail.com");
session.setAttribute("passwd", "123");
session.setAttribute("date", new Date());

response.sendRedirect("./session.jsp");
%>