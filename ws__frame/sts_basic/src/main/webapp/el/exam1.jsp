<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 30px;}
</style>
</head>
<body>
<DIV class='container'>
<DIV class='content'>
 스크립틀릿 출력<br>
 <% 
 int su1 = Integer.parseInt(request.getParameter("su1"));
 int su2 = Integer.parseInt(request.getParameter("su2"));
 int su3 = Integer.parseInt(request.getParameter("su3"));
 %>
 수1: <%=su1 + 50 %><br>
 수2: <%=su2 + 50 %><br>
 수3: <%=su3 + 50 %><br>
 <br> 
 EL 출력<br>
 수1: ${param.su1+50}<br>
 수2: ${param.su2+50}<br>
 수3: ${param.su3+50}<br>
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html>