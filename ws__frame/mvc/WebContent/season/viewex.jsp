<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>

<DIV style='text-align: center; margin: 30px;'>
  <H1 style="font-size: 30px;">Controller 2 Ex</H1>
  <H2 style="font-size: 25px;"><%= request.getAttribute("title")%></H2>
  <A href='/mvc/controller2/img1.do2ex'>Happy</A> | 
  <A href='/mvc/controller2/img2.do2ex'>Home</A> |
  <A href='/mvc/controller2/img3.do2ex'>Relax</A> |
  <A href='/mvc/controller2/img4.do2ex'>Smile</A> 
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