<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">

</head>
<body>
  <form name='frm' id='frm' method='POST' action='./create.do' class="form-horizontal">
    
    <div class="form-group">
      <label for="memberno" class="col-md-2 control-label" style='font-size: 0.9em;'>회원번호</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='memberno' id='memberno' value='' required="required" style='width: 30%;' placeholder="회원번호">
      </div>
    </div>       
    
  <div class="form-group">
      <label for="total_price" class="col-md-2 control-label" style='font-size: 0.9em;'>주문총액</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='total_price' id='total_price' value='' required="required" style='width: 30%;' placeholder="주문총액">
      </div>
    </div> 

    <div class="form-group">
      <label for="status" class="col-md-2 control-label" style='font-size: 0.9em;'>주문상태</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='status' id='status' value='' required="required" style='width: 30%;' placeholder="주문상태">
      </div>
    </div> 
    <button type="submit">등록</button>
  </form>
</body>
</html>