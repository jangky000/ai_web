<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>

<!-- 한글 깨짐 -->
<% request.setCharacterEncoding("utf-8"); %>
 
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
 
 <%
 String price1 = request.getParameter("price1");
 String price2 = request.getParameter("price2");
 String price3 = request.getParameter("price3");
 %>
 
 price1: <%= price1 %><br>
 price2: <%= price2 %><br>
 price3: <%= price3 %><br>
 <%-- ctrl + shift + /: jsp 주석 --%>
 <%-- ","가 있으면 형변환 불가능 --%>
 <%-- Integer.parseInt(price3) -> java exception 발생 --%>
 
 <%
 price3 = price3.replace(",", "");
 %>
 price3: <%= price3 %><br>
 <%
 int price4 = Integer.parseInt(price3) + 100000;
 %>
 price4: <%= price4 %><br>
 
 <%
 DecimalFormat df = new DecimalFormat("#,###,###");
 int gdp = Integer.parseInt(request.getParameter("gdp").replace(",", "")) + 3000;
 %>
 
 gdp: ＄<%= df.format(gdp) %><br>
 
</body>
</html>