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
%>

성적 조회: <% out.println(name); %>
<ol>
 <li>국어: <% out.println(kor); %></li>
 <li>영어: <% out.println(eng); %></li>
 <li>수학: <% out.println(mat); %></li>
</ol>
총점: <% out.println(tot); %><br>
평균: <% out.println(avg); %><br>

</body>
</html>