<%@ page contentType="text/html; charset=UTF-8" %> 
 
<% request.setCharacterEncoding("utf-8"); %>
 
<!DOCTYPE html>
<html> 
<head> 
<meta charset="UTF-8"> 
<title>fd_a2.jsp</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
  <DIV style='text-align: center;'>
    <IMG src='./images/spring03.jpg' style='width: 50%;'>
  </DIV> 
  <div style='margin: 0 auto; width:35%;'>
    --> fd_a2.jsp<br><br>
    제목: <%=request.getParameter("title") %><br>
    배우: <%=request.getParameter("actor") %><br>
    연도: <%=request.getParameter("year") %><br>
  </div>
  <%
  System.out.println("--> fd_a2.jsp 실행됨");
  System.out.println(request.getParameter("title"));
  System.out.println(request.getParameter("actor"));
  System.out.println(request.getParameter("year"));
  %>  
  
 <%
 /* 위의 내용이 정상적으로 실행된 후에 redirect */
 /* 페이지 자동 변경 */
 //response.sendRedirect("./fd_a3.jsp");
 %>
 
 <!-- request 객체를 fd_a3.jsp를 보냄 -->
 <jsp:forward page="./fd_a3.jsp"></jsp:forward>
 
 
 
</body>
</html>