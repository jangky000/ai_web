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
request.setAttribute("img", "<img src='./images/xmas01.jpg' style='width: 40%;'><br>");
%>

<jsp:forward page="./c2.jsp"></jsp:forward>

</body>
</html>
</html>