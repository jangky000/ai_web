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
<DIV class='container'>
  <DIV class='content'>
    객실: <%=request.getParameter("rname") %><br>
    평수: <%=request.getParameter("py") %><br>
    인원: <%=request.getParameter("cnt") %><br>
  </DIV>
</DIV>
</body>
</html>