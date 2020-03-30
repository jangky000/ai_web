<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="java.util.Date" %>
<%@ page import=" java.text.SimpleDateFormat" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
  *{ font-family: 맑은 고딕; font-size: 26px; }
</style>
</head>
<body>
<%
  DecimalFormat df = new DecimalFormat("#,###,### 원");
  int pay = Integer.parseInt(request.getParameter("pay"));
  int su = Integer.parseInt(request.getParameter("su"));
  int tot = pay + su;
  int tax = (int)(tot*0.1);
  String date_str = new Date().toLocaleString();
  String date_str2 = new SimpleDateFormat("yyyy-MM").format(new Date());
  
%> 
<H2>급여 처리</H2>
<DIV>
  본봉: <%=df.format(pay) %><BR>
  수당: <%=df.format(su) %><BR>
  총액: <%=df.format(tot) %><BR>
  세금(10%): <%=df.format(tax) %><BR>
  실수령액: <%=df.format(tot-tax) %><BR>
  처리 날짜: <%=date_str %><br>
  처리 날짜2: <%=date_str2 %> 
</DIV>
 
</body>
</html>