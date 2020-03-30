<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 32px;}
</style>
</head>
<body>
<%
System.out.println("요청 처리됨.");
out.println("<DL>");
out.println("<DT>인공지능 영화</DT>");
out.println("<DD>AI 2001</DD>");
out.println("<DD>트랜센던스 2014</DD>");
out.println("<DD>엑스마키나 2015</DD>");
out.println("<DD>이미테이션게임 2015</DD>");
out.println("</DL>");
 
out.print("<DL>");
out.print("<DT>영어 학습 영화</DT>");
out.print("<DD>맘마미아</DD>");
out.print("<DD>러브 액츄얼리</DD>");
out.print("<DD>악마는 프라다를 입는다.</DD>");
out.print("<DD>김씨네 편의점(캐나다)</DD>");
out.print("</DL>");
%>
</body>
</html>