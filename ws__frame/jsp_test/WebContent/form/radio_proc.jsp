<%@ page contentType="text/html; charset=UTF-8" %>

<% 
//한글이 깨지지 않게 항상 표기
request.setCharacterEncoding("utf-8"); 
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>축제</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
  축제 예약<br>
  ----------------------------------------<br>
  축제: <%=request.getParameter("festival") %><br>
  참가인원: <%=request.getParameter("count") %> 명<br>
  <%
  String mobile = request.getParameter("mobile");
  if(mobile == null){
 %>
 <span style="color:#FF0000;">통신사를 선택해주세요</span>
 <br>
 <%
  }else{
  %>
  연락처: <span style="color:#0000FF"><%= mobile %></span><br>
  <%
  }
  %>
  번호: <%=request.getParameter("mobileno") %><br>
  <br>
  <A href='./festival_form.jsp'>예약 계속</A>
</body>
</html>