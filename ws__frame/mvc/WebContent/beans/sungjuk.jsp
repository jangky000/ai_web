<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "beans.SungjukVO" %>
 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
%>

<%
SungjukVO sungjuk = new SungjukVO("왕눈이", 90, 85, 80);
int tot = 0;
int avg = 0;
%>
 
<%
/* sungjuk.setName("왕눈이");
sungjuk.setJava(90);
sungjuk.setJsp(85);
sungjuk.setSpring(80); */

tot = sungjuk.getJava() + sungjuk.getJsp() + sungjuk.getSpring();
avg = (int)(tot / 3);
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
 
<body>
<DIV class='container'>
<DIV class='content'>
 
<% 
 
%>
 
신입 직원 성명: <%=sungjuk.getName() %><br> 
--------------------------------<br>
JAVA: <%=sungjuk.getJava() %><br>
JSP: <%=sungjuk.getJsp() %><br>
SPRING: <%=sungjuk.getSpring() %><br>    
총점: <%=tot %><br>
평균: <%=avg %><br>
 
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
 
</html>