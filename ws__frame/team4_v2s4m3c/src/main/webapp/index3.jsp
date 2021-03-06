<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" /> 

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>♥SKINFIT♥</title>
  
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="./css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="./javascript/script.js"></script>
</head>

<body onload="showImage()">
<!-- jsp:include -> jsp가 처리되어 처리 결과가 HTML로 변경되어 메인 페이지에 포함 -->
<!-- root를 사용하기 위해 cset을 다시 선언해야 한다. -->
<jsp:include page="/menu/top.jsp" flush='false' />

    <!--컨텐츠 들어가는 부분: 여기에 각자 작업해서 업로드 하면 될듯-->
    <img id="introImg" border="0">
    <div style="outline: 1px solid white; width: 80%; margin: 0 auto; text-align: center;">
      홈 화면
      <ul style="list-style: none; padding: 0;">
        <li style="list-style: none;"><a href="${root}/shopping_cart/list.jsp">장바구니 리스트</a></li>
        <li style="list-style: none;"><a href="${root}/porder/create.do">주문 등록</a></li>
        <li style="list-style: none;"><a href="${root}/porder/list.do">주문 목록</a></li>
        <li style="list-style: none;"><a href="${root}/porder/update.do">주문 수정</a></li>
        <li style="list-style: none;"><a href="${root}/porder/delete.do">주문 삭제</a></li>
      </ul>
   </div>
   <!--컨텐츠 들어가는 부분: 여기에 각자 작업해서 여기까지-->


 <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>