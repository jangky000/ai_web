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
<!-- 자바소스 자체가 포함됨 -->
<%@ include file="./file_sub.jsp" %>
<%
/*- Duplicate local variable 
   book*/
// String book = "나는 누구인가";

String book2 = "나는 누구인가";
%>
<h2>추천도서 2: <%= book2 %></h2>
<!-- 선 긋기 -->
<hr>
<div style="color: #0000ff;">
3월 독서 커뮤니티 추천: <%= book %><br>
나는 나를 얼마나 알고 있는가?<br>

</div>
</body>
</html>