<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html>
<html> 
<head> 
<meta charset="UTF-8"> 
<title>rd_a1.jsp</title> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<body>
 
<form name='frm' method='post' action='./rd_a2.jsp'> 
  <DIV style='text-align: center;'>
    <IMG src='./images/spring14.jpg' style='width: 50%;'>
  </DIV> 
  <div style ="margin: 0 auto; width:25%;">
    --> rd_a1.jsp<br><br>
    영화 제목: <input type='text' name='title' value='인터스텔라'><br> 
    주연 배우: <input type='text' name='actor' size='30' value='앤 헤서웨이'><br> 
    개봉 연도: <input type='text' name='year' value='2014-11-06'><br> 
    <br> 
    <input type='submit' value='서버로 전송'>
  </div> 
</form> 
</body> 
</html> 