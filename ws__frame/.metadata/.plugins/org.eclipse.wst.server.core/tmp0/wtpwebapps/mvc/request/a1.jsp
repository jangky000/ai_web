<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>a1.jsp</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<DIV class='content'>
 
 
 <% 
 int cnt = 1;
 request.setAttribute("cnt", cnt); //키(문자열), 값(객체)의 형태
 cnt = (Integer)request.getAttribute("cnt");
 
out.println("a1.jsp cnt: " + cnt + "<br>");
System.out.println("a1.jsp cnt: " + cnt );
 %>
 
 
 <%-- forward: request 객체를 전달 --%> 
 <jsp:forward page="./a2.jsp"></jsp:forward>
 <%
 //실행되지 않음
  System.out.println("jsp forward 이후 a1.jsp 페이지: " + cnt);
 %>
</DIV> <!-- content END -->
</DIV> <!-- container END -->
 
</body>
</html>