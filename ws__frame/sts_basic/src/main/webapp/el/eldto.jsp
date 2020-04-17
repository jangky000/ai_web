<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="sts.basic.test.ELDTO" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>eldto.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 30px;}
</style>
</head>
<body>
<DIV class='container'>
<DIV class='content'>
 
  
  스크립틀릿 출력<br>
  <%
  ELDTO dto = new ELDTO();
  request.setAttribute("vo", dto); // request에 객체를 통째로 저장
  ELDTO eldto = (ELDTO)request.getAttribute("vo");
  %>
  <% System.out.println("--> Scriptlet"); %>
  영화명: <%=eldto.getMovie() %><br>
  주   연: <%=eldto.getName() %><br> 
  <br>
  <% System.out.println("--> EL"); %>
  EL 출력<BR>
  영화명: ${vo.movie }<br>
  주   연: ${vo.name }<br> 
  
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html>