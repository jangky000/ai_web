<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<DIV class='content'>
 
<%
// 낮은 자바 버전에서 오류가 날 수 있다.
//int cnt = (int)request.getAttribute("cnt");

//객체 형 변환, 낮은 자바 버전과 호환
int cnt = (Integer)request.getAttribute("cnt");
cnt += 1;

out.println("a3.jsp cnt: " + cnt + "<br>");
System.out.println("a3.jsp cnt: " + cnt );
%>

 
</DIV> <!-- content END -->
</DIV> <!-- container END -->
 
</body>
</html>