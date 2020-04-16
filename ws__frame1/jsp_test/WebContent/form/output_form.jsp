<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>폼 데이터의 출력</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
 
<form name='frm' action='./output_proc.jsp' method='GET'>
  <%
  String msg = "가을";
  int price =1500000;
  String password = "1234";
  String btn = "업로드";
  int gdp = 32000; // 달러
  %>
  <!-- 수정 시 사용 -->
  <input type="text" name="title" value="<%=msg %>" style="width: 30%;">
  <br><br>
  <!--  -->
  <textarea rows="3" cols="30" name="content"><%= msg %></textarea>
  <br><br>
  <input type="number" name="price1" value="<%= price %>" style="width: 30%;">원
  <button type="button" onclick="alert('HTML 실습중');"><%= btn %></button>
  <br><br>
  <%
  DecimalFormat df = new DecimalFormat("#,###,###");
  %>
  <!-- Error: df.format의 값이 나오지 않음 -> df.format()의 리턴타입이 text이기 때문에 number에서 출력되지 않음 -->
  <input type="number" name="price2" value="<%= df.format(price) %>" style="width: 40%;"> 원
  <br><br>
  <input type="text" name="price3" value="<%= df.format(price) %>" style="width: 40%;"> 원
  <br><br>
  <input type="text" name="gdp" value="<%= df.format(gdp) %>" style="width: 40%"> 달러
  <br><br>
  <button type="submit" >등록</button>
  
  
</form>
 
</body>
</html>