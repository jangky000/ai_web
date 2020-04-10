<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%= request.getAttribute("title")%></title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>

<DIV style='text-align: center; margin: 30px;'>
  <H1 style="font-size: 30px;">Controller 2</H1>
  <H2 style="font-size: 25px;"><%= request.getAttribute("title")%></H2>
  <A href='/mvc/controller2/spring.do2'>Spring</A> | 
  <A href='/mvc/controller2/summer.do2'>Summer</A> |
  <A href='/mvc/controller2/fall.do2'>Fall</A> |
  <A href='/mvc/controller2/winter.do2'>Winter</A> 
  <br><br>
  <%
  String img= (String)request.getAttribute("fname");
  if(!img.equals("none")){
    %>
    <img alt="" src="/mvc/season/images/<%= request.getAttribute("fname")%>"  style="width: 50%;">
    <%
  }
  %>
  
</DIV>

</body>
</html>
</html>