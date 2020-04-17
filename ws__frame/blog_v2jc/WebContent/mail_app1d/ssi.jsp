<%@ page contentType="text/html; charset=UTF-8" %>
 
<!-- import는 ssi에서 모아서 선언, 안 쓰는 경우에는 메모리를 사용하지 않는다고 함 -->
<%@ page import = "java.util.ArrayList" %>

<%@ page import="nation.web.mail_app1c.MailDAO" %>
<%@ page import="nation.web.mail_app1c.MailVO" %>
 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath(); 
%>

<%
String application_title = "메일 앱 ver 1.0c"; 
%>

<%
MailDAO mailDAO = new MailDAO();
%>