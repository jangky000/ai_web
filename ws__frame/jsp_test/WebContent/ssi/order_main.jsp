<%@ page contentType="text/html; charset=UTF-8" %>

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
<!-- 자바소스 자체가 포함됨 -->
<%@ include file="./order_sub.jsp" %>

<%
item = "빼빼로";
price = 1000;
count = 5;
ship_fee = 3000;
total_price = price*count + ship_fee;
%>
상품: <%=item %><br>
가격: <%=price %> <br>
수량: <%=count %><br>
배송비: <%=ship_fee %><br>
주문 금액: <%=total_price %><br>

</div>
</body>
</html>