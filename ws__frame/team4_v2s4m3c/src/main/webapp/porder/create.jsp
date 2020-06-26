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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <script src="${root }/javascript/script.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  
  
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
    
    .btn_dflt1{
      width:200px; height:40px; line-height:40px; 
      margin:15px auto; 
      text-align:center; cursor: pointer; color:#333; transition:all 0.9s, color 0.3;
      border: none;
    }
    .btn_dflt1:hover{
      box-shadow:200px 0 0 0 rgba(0,0,0,0.5) inset;
      border: none;
    }
    
    .btn_dflt1:active{
      /*  */
      box-shadow:200px 0 0 0 rgba(0,0,0,0) inset;
      background-color: white;
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
    
    <%
      int memno = 1;
      request.setAttribute("memno", memno);
    %>
    
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
              <input type="text" id='porder_zip_code' placeholder="우편번호" value="1111" style="width: 200px;" required="required"><br>
              <input type="text" id='porder_address' placeholder="상세주소" value="서울특별시 강남구" style="width: 500px;" required="required">
            </td>
          </tr>
          <tr>
            <th style='text-align: right;'>배송 요청 사항</th>
            <td style='text-align: left;'>
              <textarea id='porder_delivery_request' rows="3" style="width: 500px;">문 앞에 두고 가세요</textarea>
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
            <c:forEach var="shopping_cartVO" items="${shopping_cartlist }">
              <tr>
                <td style='text-align: left;'><img src="./sample.png" style="width: 50px; height: 50px;"></td>
                <td style='padding:0 20px; text-align: left;'>장바구니 번호 ${shopping_cartVO.shopping_cartno }</td>
                <td style='padding:0 20px; text-align: center;'>${shopping_cartVO.quantity} 개</td>
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
      <button type="button" class="btn_dflt1" style="width: 100px; height: 60px; border-radius: 5%;" onclick="history.back();">장바구니 가기</button>
      <button type="button" id="btn_buy" class="btn_dflt1" style="width: 100px; height: 60px; border-radius: 5%;">결제하기</button>
    </div>
  </div>
  <!-- 주문/결제창 종료 -->
   
   <jsp:include page="/menu/bottom.jsp" flush='false' />
   
   <script type="text/javascript">
    $(function(){
      $('#btn_buy').on('click', iamport)
    });
    
    function iamport(){
      alert('iamport start');
      var IMP = window.IMP; // 생략가능
      IMP.init('imp67321715');
      // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
      // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
      IMP.request_pay({
          pg: 'kakao', // inicis version 1.1.0부터 지원.
          /*
          'kakao':카카오페이,
          html5_inicis':이니시스(웹표준결제)
          'nice':나이스페이
          'jtnet':제이티넷
          'uplus':LG유플러스
          'danal':다날
          'payco':페이코
          'syrup':시럽페이
          'paypal':페이팔
          */
          pay_method: 'card',
          /*
          'samsung':삼성페이,
          'card':신용카드,
          'trans':실시간계좌이체,
          'vbank':가상계좌,
          'phone':휴대폰소액결제
          */
          merchant_uid: 'merchant_' + new Date().getTime(),
          /*
          merchant_uid에 경우
          https://docs.iamport.kr/implementation/payment
          위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
          참고하세요.
          나중에 포스팅 해볼게요.
          */
          name: '주문명:결제테스트',
          //결제창에서 보여질 이름
          amount: ${porderVO.payment_price },
          //가격
          buyer_email: 'iamport@siot.do',
          buyer_name: '구매자이름',
          buyer_tel: '010-1234-5678',
          buyer_addr: '서울특별시 강남구 삼성동',
          buyer_postcode: '123-456',
          m_redirect_url: 'https://www.yourdomain.com/payments/complete'
          /*
          모바일 결제시,
          결제가 끝나고 랜딩되는 URL을 지정
          (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
          */
          }, function (rsp) {
              // 결제 완료시 호출 됨
              // 여기서 결제 결과 검증해야 함, 컨트롤러와 연결해야함, AJAX로 DB처리?
              console.log(rsp);
              if (rsp.success) {
                  var msg = '결제가 완료되었습니다.';
                  msg += '고유ID : ' + rsp.imp_uid;
                  msg += '상점 거래ID : ' + rsp.merchant_uid;
                  msg += '결제 금액 : ' + rsp.paid_amount;
                  msg += '카드 승인번호 : ' + rsp.apply_num;
                  alert(msg);
                  create_pay();
              } else {
                  var msg = '결제에 실패하였습니다.';
                  msg += '에러내용 : ' + rsp.error_msg;
                  alert(msg);
              }
              // alert(msg);
      });
    }
    
    // json, jsonArray 형태로 정보 전송 -> 이대로 결제 처리
    function create_pay(){
      // ajax로 처리
      
      alert('iamport end');
      
      var porderJSON={
                              'memno':'1',
                              'item_price_sum':${porderVO.item_price_sum },
                              'item_discount_sum':${porderVO.item_discount_sum },
                              'coupon_discount_sum':${porderVO.coupon_discount_sum },
                              'delivery_fee':${porderVO.delivery_fee },
                              'payment_price':${porderVO.payment_price },
                              //'porder_status':'1',
                              'porder_zip_code': $('#porder_zip_code').val(),
                              'porder_address':$('#porder_address').val(),
                              'porder_delivery_request':$('#porder_delivery_request').html()
                             };
      
      var porder_detailArr = [];
      
      // 상품 개수 만큼 순회      
      <c:forEach var="shopping_cartVO" items="${shopping_cartlist }">
        porder_detailArr.push({
          'itemno':'${shopping_cartVO.itemno}',
          'quantity':'${shopping_cartVO.quantity}',
          'item_price_sum':'1',
          'item_discount_sum':'1',
          'payment_price':'1'
          //'porder_detail_status':'1'
        });
      </c:forEach>
      
      
      // JSON형식의 String 변환은 단 한번 해준다, JSON 내부의 JSON은 모두 String 형태로 직접 변환해줘야 한다.
      var params = {'porderJSONString':JSON.stringify(porderJSON), 'porder_detailArrString':JSON.stringify(porder_detailArr)};
      
      //alert(params);
      
      $.ajax({
        url: './create.do',
        type: 'post',
        //traditional: true, // json 배열 전송??
        cache: false, // 응답 결과 임시 저장 취소
        async: false,  // false: 동기 통신 -> 주문이 중복으로 들어가는 것을 방지, 절차적으로 처리
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
          //var msg = "";
          //alert(rdata.result);
          if(rdata.result == "fully success"){
            alert("결제완료");
            location.href="./complete.do?cnt=1";
          } else{
            alert("결제 오류");
            
          }
          /* if (rdata.result) { // 주문 입력, 주문상세 입력 처리 성공
            // frm.submit();
          } else {  // 결제 오류
            
          } */
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          var msg = 'ERROR<br><br>';
          msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
          msg += '<strong>error</strong><br>'+error + '<hr>';
          console.log(msg);
        }
      });

      
    }
    
    function create_porder(){
      var form = document.createElement("form");
      form.action="./create.do";
      form.method="post";
      $("body").append(form);
      
      //alert(${memno});
      //return;
      
      //EL 값을 넣음
      create_hidden("memno", ${memno}, form); 
      
      create_hidden("item_price_sum", ${porderVO.item_price_sum }, form);
      create_hidden("item_discount_sum", ${porderVO.item_discount_sum }, form);
      create_hidden("coupon_discount_sum", ${porderVO.coupon_discount_sum }, form);
      create_hidden("delivery_fee", ${porderVO.delivery_fee }, form);
      create_hidden("payment_price", ${porderVO.payment_price }, form);
      
      create_hidden("porder_status", "R", form);
      
      if($('#porder_zip_code').val() == ""){
        $('#porder_zip_code').focus();
        alert("우편번호를 입력해주세요.");
        return;
      }
      create_hidden("porder_zip_code", $('#porder_zip_code').val(), form);
      
      if($('#porder_address').val() == ""){
        $('#porder_address').focus();
        alert("상세주소를 입력해주세요");
        return;
      }
      create_hidden("porder_address", $('#porder_address').val(), form);
      
      create_hidden("porder_delivery_request", $('#porder_delivery_request').html(), form);
      
      //alert();
      form.submit();
    }
    
    function create_hidden(name, val, form){
      input = document.createElement("input");
      input.type = "hidden";
      input.name = name;
      input.value = val;
      form.append(input);
    }
    
  </script>
</body>
</html>