<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>calc.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
<DIV class='container'>
<DIV class='content'>
  <H1>Scriptlet calc1.jsp</H1>
  <%=request.getAttribute("msg") %> 계산기<br>
  수1: <%=request.getParameter("no1") %><br>
  수2: <%=request.getParameter("no2") %><br>
  결과: <%=request.getAttribute("result") %><br><br>
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html>