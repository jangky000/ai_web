<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
</head> 
 
<body>
<DIV style='text-align: center;'>
  <H1>MVC(JSP Model 2) Controller 3 </H1>
  <!-- './img.do3'주소를 명령어로 사용, form.jsp로 돌아갈 수 있게 하는 기능 -->
  <H2><A href='./img.do3'>이미지 List</A></H2> <!-- = /mvc/controller3/img.do3 --> 
  <H2><%=request.getAttribute("title") %></H2>
  <%
  String img= (String)request.getAttribute("fname");
  if(!img.equals("none")){
    %>
    <img alt="" src="/mvc/controller3/images/<%= request.getAttribute("fname")%>"  style="width: 80%;">
    <%
  }
  %>
</DIV>
</body>
 
</html> 
 