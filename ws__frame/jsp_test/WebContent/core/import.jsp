<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DecimalFormat" %>
 
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
  <SPAN style='color: #FF0000'>R #FF0000</SPAN><br>
  <SPAN style='color: #00FF00'>G #00FF00</SPAN><br>
  <SPAN style='color: #0000FF'>B #0000FF</SPAN><br>
  <SPAN style='color: #0000FF'>#0000FF</SPAN><br>
  <SPAN style='color: #FFFF00'>#FFFF00</SPAN><br>
  <SPAN style='color: #00FFFF'>#00FFFF</SPAN><br>
 
  <SPAN style='color: #00FF00'>G #00FF00</SPAN><br>
  <SPAN style='color: #00CC00'>G #00CC00</SPAN><br>
  <SPAN style='color: #00AA00'>G #00AA00</SPAN><br>
  <SPAN style='color: #008800'>G #008800</SPAN><br>
  <SPAN style='color: #005500'>G #005500</SPAN><br>
  <br>

  <%
    // 2017년 매출액: ￦ 1,000,000,000 원
    DecimalFormat df = new DecimalFormat("￦ ##,###,###,### 원");
    String str = df.format(1000000000);
    Date date = new Date();
  %>

  2017년 매출액: <%=str%><br>
  처리 시간: <%=date.toLocaleString()%>

</body>
</html>
 