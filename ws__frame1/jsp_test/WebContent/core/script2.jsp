<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 조회</title>
<style type="text/css">
  *{font-family: 맑은 고딕; font-size: 26px;}
</style>
</head>
<body>
<% // 스크립틀릿
String name = "아로미";
int kor = 90;
int eng = 70;
int mat = 80;
int tot = kor + eng + mat;
int avg = tot / 3;
 
out.println("성적 조회: " + name);
out.println("<ol>");
out.println(" <li>국어: " + kor + "</li>");
out.println(" <li>영어: " + eng + "</li>");
out.println(" <li>수학: " + mat + "</li>");
out.println("</ol>");
out.println("총점: " + tot + "<br>");
out.println("평균: " + avg + "<br>");
%>
</body>
</html>