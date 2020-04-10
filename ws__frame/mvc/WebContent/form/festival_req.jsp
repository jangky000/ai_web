<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html>
<html> 
<head> 
<meta charset="UTF-8"> 
<title>festival_req.jsp</title> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
 
<DIV class='title_line'><strong>축제 예약</strong></DIV>
 
<FORM name='frm' method="POST" action='/mvc/form/festival_req.do'>
 
<TABLE style='margin: 0px auto;'>
  <TR>
    <TH>축제 이름</TH>
    <TD><input type='text' name='title' size='40' value='<%=request.getAttribute("title")%>'> </TD>
  </TR>
  <TR>
    <TH>개최 지역</TH>
    <TD><input type='text' name='where' size='40' value='<%=request.getAttribute("where")%>'></TD>
  </TR>
  <TR>
    <TH>개최 기간</TH>
    <TD><input type='text' name='when' size='40' value='<%=request.getAttribute("when")%>'></TD>
  </TR>
</TABLE>
 
<DIV class='bottom_menu'>
  <input type='submit' value='전송'>
</DIV>
 
</FORM>
 
</body>
</html>