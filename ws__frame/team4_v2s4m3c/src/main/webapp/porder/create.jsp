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
    .table_sty {
      border-collapse: collapse;   
      border-top: 3px solid gray;
      border-bottom: 1px solid gray;
    }
    .table_sty tr{
      border-top: 1px solid gray;
      border-bottom: 1px solid gray;
    }
    .table_sty th{
      border-right: 1px solid gray;
      padding-right: 20px;
    }
    .table_sty td{
      padding-left: 20px;
    }
    
    .table_sty2{
      border-collapse: collapse;
      border: 1px solid gray;
      border-top: 2px solid black;
      border-spacing: 20px;
    }
    
    .table_sty2 tr{
      margin: 20px;
      border-bottom: 1px solid gray;
    }
    .table_sty2 th{

    }
    
    .table_sty2 td{
      padding: 20px;
    }
  </style>
  
</head>

<body onload="showImage()">
  <!-- jsp:include -> jsp가 처리되어 처리 결과가 HTML로 변경되어 메인 페이지에 포함 -->
  <!-- root를 사용하기 위해 cset을 다시 선언해야 한다. -->
  <jsp:include page="/menu/top.jsp" flush='false' />
  
  <!-- 주문/결제창 시작 -->
  <div style="width: 70%; margin: 20px auto;">
    <div>
      <h2 style="display: inline;">주문/결제</h2>
      <span style="float: right;">1. 장바구니 ＞ <strong style="background-color: #ffffff;">2. 주문/결제</strong> ＞ 3. 주문 완료</span>
    </div>
    
    <!-- 구매자 정보 시작 -->
    <div style="margin: 20px auto;">
      <table class="table_sty" style='width: 100%;'>
        <caption style="text-align:left;"><h3>구매자 정보</h3></caption>
        <colgroup>
          <col style="width: 10%;"></col>
          <col style="width: 90%;"></col>
        </colgroup>
        <%-- table 컬럼 --%>
        <tbody>
          <tr>
            <th style='text-align: right;'>이름</th>
            <td style='text-align: left;'>왕눈이</td>
          </tr>
          <tr>
            <th style='text-align: right;'>이메일</th>
            <td style='text-align: left;'>wangnuni@gmail.com</td>
          </tr>
          <tr>
            <th style='text-align: right;'>휴대폰 번호</th>
            <td style='text-align: left;'>
              <input type="text" value="010-5555-5555" readonly="readonly">
              <button type="button">인증받기</button><br>
              * 거래기록 보존을 위해 본인확인 후 구매가 가능. (첫구매 1회만)<br>
              * 인증 번호를 못 받았다면, 1577-7011 번호 차단 및 스팸 설정을 확인해 주세요.<br>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <!-- 구매자 정보 종료 -->
    
    <!-- 배송 정보 시작 -->
    <div style="margin: 20px auto;">
      <table class="table_sty" style='width: 100%;'>
        <caption style="text-align:left;"><h3>배송 정보</h3></caption>
        <colgroup>
          <col style="width: 10%;"></col>
          <col style="width: 90%;"></col>
        </colgroup>
        <%-- table 컬럼 --%>
        <tbody>
          <tr>
            <th style='text-align: right;'>받는 사람</th>
            <td style='text-align: left;'>왕눈이</td>
          </tr>
          <tr>
            <th style='text-align: right;'>휴대폰 번호</th>
            <td style='text-align: left;'><input type="text" value="010-5555-5555"></td>
          </tr>
          <tr>
            <th style='text-align: right;'>배송 주소</th>
            <td style='text-align: left;'>
              <input type="text" placeholder="우편번호" style="width: 200px;"><br>
              <input type="text" placeholder="상세주소" style="width: 500px;">
            </td>
          </tr>
          <tr>
            <th style='text-align: right;'>배송 요청 사항</th>
            <td style='text-align: left;'>
              <textarea rows="3" style="width: 500px;">문 앞에 두고 가세요</textarea>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <!-- 배송 정보 종료 -->
    
    <!-- 주문 상품 시작 -->
    <div style="margin: 60px auto; width:100%; border: 1px solid black;">
      <div style="margin: 20px auto; width: 95%; border-bottom: 1px solid gray"><h3>주문 상품</h3></div>
      <div style="margin: 20px auto; width: 95%;">
        <table style='width: 100%;'>
          <colgroup>
            <col style="width: 10%;"></col>
            <col style="width: 50%;"></col>
            <col style="width: 20%;"></col>
            <col style="width: 20%;"></col>
          </colgroup>
          <%-- table 내용 --%>
          <tbody>
            <c:forEach var="shopping_cartno" items="${shopping_cartlist }">
              <tr>
                <td style='text-align: left;'><img src="./sample.png" style="width: 50px; height: 50px;"></td>
                <td style='padding:0 20px; text-align: left;'>장바구니 번호 ${shopping_cartno }</td>
                <td style='padding:0 20px; text-align: center;'>n개</td>
                <td style='padding:0 20px; text-align: center;'>오늘 출고</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>  
    </div>
    <!-- 주문 상품 종료 -->
    
    <!-- 결제 정보 시작  -->
    <div style="margin: 20px auto; border: 1px solid gray;">
      <h3 style="margin: 20px 20px;">결제 정보</h3>
      <ul style="list-style: none; margin: 20px 30px 0 30px; padding:0 0 10px 0; border-bottom: 2px solid gray;">
        <li style="text-align: right;"><span style="float: left;">판매가총액</span><span >${porderVO.item_price_sum }원</span></li>
        <li style="text-align: right;"><span style="float: left;">할인총액</span><span >-${porderVO.item_discount_sum }원</span></li>
        <li style="text-align: right;"><span style="float: left;">쿠폰할인</span><span>-${porderVO.coupon_discount_sum }원</span></li>
        <li style="text-align: right;"><span style="float: left;">배송비</span><span>${porderVO.delivery_fee }원</span></li>
      </ul>
      <div style="padding: 5px 30px; text-align: right; border-bottom: 1px solid gray;">
        <span  style="float: left; margin-top: 10px;"><strong>최종 결제 금액</strong></span>
        <span  style="font-weight: bold; color: red; font-size: 26px;">${porderVO.payment_price }원</span>
      </div>
      <div style="padding: 10px 20px; border-bottom: 1px solid gray;">
        <div style="font-weight: bold; margin: 5px;">결제 방법</div>
        <label><input type="radio" name='method' value='kakaopay'>카카오페이</label>
        <label><input type="radio" name='method' value='naverpay'>네이버페이</label>
        <label><input type="radio" name='method' value='insis'>이니시스</label>
      </div>
      <div style="padding: 10px 20px;">
        <label><input type="checkbox" name='order_list_agreement' value='yes'>주문내역확인 동의(필수)</label>
        <div style="font-size: 12px; margin: 0 20px;">
          주문할 상품의 상품명, 가격, 배송정보 등을 최종 확인하였으며, 구매에 동의하십니까?
          (전자상거래법 제 8조 2항)
        </div>
      </div>
    </div>
    <!-- 결제 정보 종료  -->
    
    <div style="margin: 20px auto; text-align: center;">
      <button type="button" style="width: 100px; height: 60px; border-radius: 5%;">장바구니 가기</button>
      <button type="button" style="width: 100px; height: 60px; border-radius: 5%;">결제하기</button>
    </div>
  </div>
  <!-- 주문/결제창 종료 -->
   
   <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>