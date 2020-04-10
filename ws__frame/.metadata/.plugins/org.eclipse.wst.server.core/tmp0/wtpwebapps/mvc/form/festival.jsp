<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html>
<html> 
<head> 
<meta charset="UTF-8"> 
<title>festival_form2.jsp</title> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
 
<DIV class='title_line'><strong>대한민국 축제 정보</strong></DIV>
 
 <!-- http://localhost:9090/mvc/form/festival.do -->
<FORM name='frm' method='post' action='/mvc/form/festival.do'>
 
<TABLE style='margin: 0px auto;'>
  <TR>
    <TH>축제 이름</TH>
    <TD><input type='text' name='title' size='40' value='2017 태안 튜울립축제'> </TD>
  </TR>
  <TR>
    <TH>개최 지역</TH>
    <TD><input type='text' name='area' size='40' value='충청남도 태안군'></TD>
  </TR>
  <TR>
    <TH>개최 기간</TH>
    <TD><input type='text' name='period' size='40' value='2017.04.13~05.10'></TD>
  </TR>
</TABLE>
 
<DIV class='bottom_menu'>
  <input type='submit' value='전송'>
</DIV>
 
</FORM>
 
 
</body>
</html>