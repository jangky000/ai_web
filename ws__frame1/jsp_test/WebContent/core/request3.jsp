<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
 
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
DecimalFormat df = new DecimalFormat("￦ #,###,### 원");
int mon = Integer.parseInt(request.getParameter("mon"));
int period = Integer.parseInt(request.getParameter("period"));
int won = mon * period;
int ija = (int)(won * 0.01);
int tot = won + ija;
%>
 
<H2>적금 온라인 계산기</H2>
<DIV>
  월 입금액: <%=df.format(mon) %><BR>
  적금 기간: <%=period %> 개월<BR>
  납입 원금: <%=df.format(won) %><BR>
  이자(1 %): <%=df.format(ija) %><BR>
  총수령액: <%=df.format(tot) %><BR>
</DIV>
 
</body>
</html>