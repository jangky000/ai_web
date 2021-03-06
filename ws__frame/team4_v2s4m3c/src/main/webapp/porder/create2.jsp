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
  <div style="width: 50%; margin: 20px auto; outline: solid 1px gray;">
    <h4 style="padding: 20px 0;">주문/결제 페이지</h4>
    *: 필수 입력
    <form name='frm' id='frm' method='POST' action='./create.do' class="form-horizontal">
      <div class="form-group">
        <label for="memberno" class="col-md-2 control-label" style='font-size: 0.9em;'>회원번호*</label>    
        <div class="col-md-10">
          <input type='text' class="form-control" name='memberno' id='memberno' value='' required="required" style='width: 50%;' placeholder="회원번호">
        </div>
      </div>       
      
      <div class="form-group">
        <label for="payment_price" class="col-md-2 control-label" style='font-size: 0.9em;'>주문총액*</label>    
        <div class="col-md-10">
          <input type='text' class="form-control" name='payment_price' id='payment_price' value='' required="required" style='width: 50%;' placeholder="주문총액">
        </div>
      </div> 
  
      <div class="form-group">
        <label for="status" class="col-md-2 control-label" style='font-size: 0.9em;'>주문상태*</label>    
        <div class="col-md-10">
          <input type='text' class="form-control" name='status' id='status' value='' required="required" style='width: 50%;' placeholder="주문상태">
        </div>
      </div>
      <div style="text-align: right;">
        <button type="submit" class="btn btn-default">등록</button>
      </div>
    </form>
  </div>
  ** 삭제할 페이지
</body>
</html>