<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>form.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
 
 <!-- name, action, method -->
<form name='frm' action='./proc.jsp' method='GET'>
  <h2>뉴스 등록</h2><br>
  제목<br>
  <input type="text" name="title"  size="40"><br>
  내용<br>
  <textarea rows="5" cols="40" name = "content"></textarea><br>
  기부<br>
  <input type="number" name="donate" value="0"> 원
  <br>
  패스워드<br>
  <input type = "password" name="passwd" size="20">
  <!-- submit은 html4에서 사용, html5에서는 button 사용 -->
  <input type = "submit" value="등록">
</form>
 
</body>
</html>