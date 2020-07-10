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
      border-collapse: collapse;
    }
    table tr{
     
    }
    table th{
      font-size: 16px;
    }
    table td{
      font-size: 16px;
      border: 1px solid white;
    }

  </style>
  
</head>

<body onload="showImage()">
  <!-- jsp:include -> jsp가 처리되어 처리 결과가 HTML로 변경되어 메인 페이지에 포함 -->
  <!-- root를 사용하기 위해 cset을 다시 선언해야 한다. -->
  <jsp:include page="/menu/top.jsp" flush='false' />
  
  <!-- 주문목록/배송조회 리스트 시작 -->
  <div style="width: 90%; margin: 20px auto;">
    <div>
      <h2 style="display: inline;">주문목록/배송조회</h2>
      <span style="float: right;"> 마이페이지 ＞ <strong style="background-color: #ffffff;">주문목록/배송조회</strong></span>
    </div>
    
    <%
      int memno = 1;
      request.setAttribute("memno", memno);
    %>
        
    <!-- 주문목록/배송조회 정보 시작 -->
    <div style="margin: 60px auto; width:100%; border: 1px solid black;">
      <div style="margin: 20px auto; width: 95%; border-bottom: 1px solid gray">
        <h3>전체</h3>
      </div>
      <div style="margin: 20px auto; width: 95%;">
        <c:forEach var="porderJoinVO" items="${list }">
          <c:set var="porderno" value="${porderVO.porderno }" />
          <!--  -->
        </c:forEach>
        <!-- porder 박스 시작 -->
        <table style="width: 100%;">
          <thead>
            <tr>
              <td colspan = 5 style="background-color: white;">주문일: 주문번호: 총주문금액: 주문상세보기</td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>image</td>
              <td>상품이름, 종류 등, 개당 가격</td>
              <td>판매자</td>
              <td>구매 수량</td>
              <td>주문 취소 버튼</td>
            </tr>
          </tbody>
        </table>
        <!-- porder 박스 종료 -->
      </div>
    </div>
    <!-- 주문목록/배송조회 정보 종료 -->
    
  </div>
  <!-- 주문목록/배송조회 리스트 종료 -->
   
   <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>