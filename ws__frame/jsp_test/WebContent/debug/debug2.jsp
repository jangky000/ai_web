<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<DIV class='container'>
<DIV class='content'>
 
  <form name='frm' action='./_proc.jsp' method='POST'>
  <TABLE>
<%
for (int index=1; index <= 5; index++) {
  %>
  <TR><TD style='border: solid 1px auto; height: 50px; font-size: 2em;'><%=index %> 라인 생성됨</TD></TR>
  <%
}
 
%>  
  </TABLE>
  </form>
 
</DIV> <!-- content END -->
</DIV> <!-- container END -->
 
</body>
</html>