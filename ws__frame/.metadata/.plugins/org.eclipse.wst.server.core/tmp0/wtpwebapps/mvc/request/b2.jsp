<%@ page contentType="text/html; charset=UTF-8" %>
 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<%
String str = (String) request.getAttribute("str");
request.setAttribute("str", str+"b2.jsp AB<br>");

%>

<jsp:forward page="./b3.jsp"></jsp:forward>
</body>
</html>
</html>