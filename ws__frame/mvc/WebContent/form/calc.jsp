<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html>
<html> 
<head> 
<meta charset="UTF-8"> 
<title>calc_getpost.jsp</title> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
 
 <!-- http://localhost:9090/mvc/form/calc.do -->
<DIV class='title_line'><strong>온라인 계산기</strong></DIV>
<FORM name='frm' method='POST' action='/mvc/form/calc.do'>
 
<TABLE style='margin: 50px auto;'>
  <TR>
    <TH>수1</TH>
    <TD><input type='text' name='su1' value='10'> </TD>
  </TR>
  <TR>
    <TH>수2</TH>
    <TD><input type='text' name='su2' value='2'></TD>
  </TR>
</TABLE>
 
<DIV class='bottom_menu'>
  <input type='submit' value='전송'>
</DIV>
 
</FORM>
 
 
</body>
</html>