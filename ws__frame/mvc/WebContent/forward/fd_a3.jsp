<%@ page contentType="text/html; charset=UTF-8" %> 
 
<% request.setCharacterEncoding("utf-8"); %>
 
<!DOCTYPE html>
<html> 
<head> 
<meta charset="UTF-8"> 
<title>fd_a3.jsp</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
 
<body>
  <DIV style='text-align: center;'>
    <IMG src='./images/spring01.jpg' style='width: 50%;'>
  </DIV> 
  <div style='margin: 0 auto; width:35%;'>
  --> fd_a3.jsp<br><br>
  제목: <%=request.getParameter("title") %><br>
  배우: <%=request.getParameter("actor") %><br>
  연도: <%=request.getParameter("year") %><br>
  </div>
</body>
</html>