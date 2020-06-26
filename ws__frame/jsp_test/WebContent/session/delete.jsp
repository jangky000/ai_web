<%@ page contentType="text/html; charset=UTF-8" %>
 
<%
// session.removeAttribute("id"); // id session 변수만 삭제
session.invalidate();

response.sendRedirect("./session.jsp");
%>