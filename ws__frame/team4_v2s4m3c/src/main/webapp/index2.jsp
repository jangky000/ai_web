<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" /> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SKINFIT</title>
</head>
<body>

홈 화면
<ul>
  <li><a href="${root}/shopping_cart/list.jsp">장바구니 리스트</a></li>
  <li><a href="${root}/porder/create.do">주문 등록</a></li>
  <li><a href="${root}/porder/list.do">주문 목록</a></li>
  <li><a href="${root}/porder/update.do">주문 수정</a></li>
  <li><a href="${root}/porder/delete.do">주문 삭제</a></li>
</ul>

</body>
</html>