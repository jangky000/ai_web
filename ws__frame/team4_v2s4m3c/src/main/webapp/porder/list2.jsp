<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko"> 
<head>
<meta charset="UTF-8">
<title>SKINFIT</title>
  <script type="text/JavaScript"
            src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">

</head>
<body>
  <div style="margin: 20px auto; width: 80%;">
    관리자만 접근 허용**
    
    <!-- 검색창 -->
    <div style="margin: 20px auto;">
      <form>
        <div style="width:20%; height:20px; display: inline-block;">
          <div class="form-group">
            <!-- <label for="sel1">Select list:</label> -->
            <select class="form-control" id="sel1">
              <option>회원 검색</option>
              <option>주문 번호 검색</option>
              <option>날짜 검색</option>
              <option>구매상품검색</option>
            </select>
          </div>
        </div>
      
        <div style="width:50%; height:20px; display: inline-block;">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="검색">
            <div class="input-group-btn">
              <button class="btn btn-default" type="submit">
                <i class="glyphicon glyphicon-search"></i>
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
    <!-- 검색창 종료 -->
    
    <!-- 정렬 -->
    <div style="margin: 20px auto;">
      <a href="#">결제 대기</a> | 
      <a href="#"> 결제 완료</a> | 
      <a href="#">날짜순</a> | 
      <a href="#">높은 금액순</a> | 
      <a href="#">낮은 금액순</a>
    </div>
    <!-- 정렬 종료 -->
    
    <!-- 리스트 테이블 시작 -->
    <div style="margin: 20px auto;">
      <table class="table table-striped" style='width: 100%;'>
          <colgroup>
            <col style="width: 5%;"></col>
            <col style="width: 5%;"></col>
            <col style="width: 15%;"></col>
            <col style="width: 10%;"></col>
            <col style="width: 10%;"></col>
            <col style="width: 10%;"></col>
            <col style="width: 5%;"></col>
            <col style="width: 10%;"></col>
            <col style="width: 5%;"></col>
            <col style="width: 10%;"></col>
            <col style="width: 5%;"></col>
            <col style="width: 10%;"></col>
          </colgroup>
          <%-- table 컬럼 --%>
          <thead>
            <tr>
              <th style='text-align: center;'>주문no</th>
              <th style='text-align: center;'>회원번호</th>
              <th style='text-align: center;'>주문날짜</th>
              <th style='text-align: center;'>판매가총액</th>
              <th style='text-align: center;'>할인총액</th>
              <th style='text-align: center;'>쿠폰할인</th>
              <th style='text-align: center;'>배송비</th>
              <th style='text-align: center;'>최종결제금액</th>
              <th style='text-align: center;'>승인 상태</th>
              <th style='text-align: center;'>배송지</th>
              <th style='text-align: center;'>상세보기</th>
              <th style='text-align: center;'>기타</th>
            </tr>
          </thead>
          
          <%-- table 내용 --%>
          <tbody>
            <c:forEach var="porderVO" items="${list }">
              <c:set var="porderno" value="${porderVO.porderno }" />
              <c:set var="memno" value="${porderVO.memno }" />
              <c:set var="rdate" value="${porderVO.rdate }" />
              <c:set var="item_price_sum" value="${porderVO.item_price_sum }" />
              <c:set var="item_discount_sum" value="${porderVO.item_discount_sum }" />
              <c:set var="coupon_discount_sum" value="${porderVO.coupon_discount_sum }" />
              <c:set var="delivery_fee" value="${porderVO.delivery_fee }" />
              <c:set var="payment_price" value="${porderVO.payment_price }" />
              <c:set var="porder_status" value="${porderVO.porder_status }" />
              <c:set var="porder_address" value="${porderVO.porder_address }" />
              
              <tr> 
                <td style='text-align: center;'>${porderno}</td>
                <td style='text-align: center;'>${memno}</td>
                <td style='text-align: center;'>${rdate} </td>
                <td style='text-align: center;'>${item_price_sum} </td>
                <td style='text-align: center;'>${item_discount_sum} </td>
                <td style='text-align: center;'>${coupon_discount_sum} </td>
                <td style='text-align: center;'>${delivery_fee} </td>
                <td style='text-align: center;'>${payment_price} </td>
                <td style='text-align: center;'>${porder_status}</td>
                <td style='text-align: center;'>${porder_address}</td>
                <td style='text-align: center;'>
                  <button type="button" onclick="location.href='./update.do?porderno=${porderno}'">내역보기</button>
                </td>
                <td style='text-align: center;'>
                  <button type="button" onclick="location.href='./update.do?porderno=${porderno}'">수정</button>
                  <button type="button" onclick="location.href='./delete.do?porderno=${porderno}'">삭제</button>
                </td>
              </tr>
            </c:forEach>
            
          </tbody>
        </table>
    </div>
    <!-- 리스트 테이블 종료 -->
    
  </div>

추가할 기능
검색 기능: 회원 검색, 주문 번호 검색, 날짜 검색, 상품 검색?
정렬 기능 추가하기**(주문 번호 정렬 내림차순, 날짜 정렬, 결제 대기만 보기, 결제 완료만 보기, 금액 높은 순?) -> AJax로
주문 상태 테이블 추가하기**
주문 상태 토글 스위치 사용
회원 아이디 가져오기**
주문 상세보기 버튼 만들기**
회원 아이디를 클릭하면(anchor) 해당 회원 주문 목록으로 연결**
주문 상태 -> 결제 대기, 결제 완료 문구 띄우기, 배송 정보는?
주문 상태 클릭하면 주문 상세 테이블 보여주기 배송 정보 등도 보여주기** -> 상품 정보도 가져오기**

</body>
</html>