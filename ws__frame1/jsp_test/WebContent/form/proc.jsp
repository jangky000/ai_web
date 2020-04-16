<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DecimalFormat" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>뉴스 등록 처리</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
  <%
 String title = request.getParameter("title");
 String content = request.getParameter("content");
 String passwd = request.getParameter("passwd");
 long donate = Long.parseLong(request.getParameter("donate"));
 
 DecimalFormat df = new DecimalFormat("￦ #,###,### 원");
 
 //SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 String date = sdf.format(new Date());
  %>
  <H1>주요 뉴스</H1>
  <ul>
      <li>제목: <%=title %></li>
      <li>내용: <%=content %></li>
      <li>패스워드: <%=passwd %></li>
      <li>기부금: <%= df.format(donate) %></li>
      <li>등록일: <%=date %></li>
  </ul>

</body>
</html>