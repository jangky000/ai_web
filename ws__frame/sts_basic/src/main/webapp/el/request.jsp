<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head> 
 
<body>
 
<DIV class='content'>
  Context Path: <%=request.getContextPath() %> <!-- Context Path: /test(마지막 패키지명) pom.xml의 artifactId이름 -->
  <br><br>
  <%
  request.setAttribute("name", "Spring 개발자");
  %>
  1. 스크립틀릿: <%= request.getAttribute("name") %><br>
  2. EL(requestScope): ${requestScope.name }<br>
  3. EL: ${name }
</DIV>
 
</body>
 
</html> 