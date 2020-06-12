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
  <link rel="stylesheet" type="text/css" href="${root }/css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="${root }/javascript/script.js"></script>
  
  <style type="text/css">
    table {
    }
    table tr{
    }
    table th{
    }
    table td{
    }

  </style>
  
</head>

<body onload="showImage()">
  <!-- jsp:include -> jsp가 처리되어 처리 결과가 HTML로 변경되어 메인 페이지에 포함 -->
  <!-- root를 사용하기 위해 cset을 다시 선언해야 한다. -->
  <jsp:include page="/menu/top.jsp" flush='false' />
  
  <!-- 주문/결제 리스트 시작 -->
  <div style="width: 90%; margin: 20px auto;">
    <div>
      <h2 style="display: inline;">주문/결제</h2>
      <span style="float: right;">1. 장바구니 ＞ 2. 주문/결제 ＞ <strong style="background-color: #ffffff;">3. 주문 완료</strong></span>
    </div>
    
    <%
      int memno = 1;
      request.setAttribute("memno", memno);
    %>
        
    <!-- 주문 정보 시작 -->
    <div style="margin: 60px auto; width:100%; border: 1px solid black;">
      <div style="margin: 20px auto; width: 95%; border-bottom: 1px solid gray"><h3>주문 결과</h3></div>
      
      <div style="margin: 20px auto; width: 95%;">
        <c:choose>
          <c:when test="${param.cnt ==1 }">
            주문이 완료되었습니다. 감사합니다.
            주문 날짜, 주문번호
            
            받는 사람 정보(디비에서 읽어오기)
            결제 정보(디비에서 읽어오기)
            
            <button type="button" onclick="location.href='./../'">쇼핑하기</button>
            <button type="button" onclick="location.href='./list.do'">주문확인(주문목록)</button>
          </c:when>
          <c:otherwise>
            주문 실패 cuz 상품이 없어서
            문의하기
            장바구니로 다시 이동
          </c:otherwise>
        </c:choose>
      </div>
        
    </div>
    <!-- 주문 정보 종료 -->
    
  </div>
  <!-- 주문/결제 리스트 종료 -->
   
   <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>