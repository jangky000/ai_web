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
String img = (String) request.getAttribute("img");
request.setAttribute("img", img + "<img src='./images/xmas03.jpg' style='width: 40%;'><br>");

out.println(request.getAttribute("img"));
%>

</body>
</html>
</html>