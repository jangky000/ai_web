<%@ page contentType="text/html; charset=UTF-8" %>
 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <!--  <%out.println("왕눈이 급여: " + (2500000 + 200000) + " 원");%> : 매우 위험, Browser에 출력 -->
  <%-- <%out.println("아로미 급여: " + (3000000 + 200000) + " 원");%> : 권장, Browser에 출력 --%>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>