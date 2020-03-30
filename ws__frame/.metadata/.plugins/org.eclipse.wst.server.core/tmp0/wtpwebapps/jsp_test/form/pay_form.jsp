<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
<h2>급여 처리</h2>
<form name='frm' action='./pay_proc.jsp' method='GET'>
  본봉: <input type="number" name='pay'  
                      min='0' max='100000000' step="1000" value="2200000"> <!-- step: 단위 --><br>
  수당: <input type="number" name='su'  
                      min='0' max='100000000' step="1000" value="300000"><br><br>
 <button type = "submit">처리 진행</button>
</form>
 
</body>
</html>