<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>tot_proc.jsp</title>
<style type="text/css">
  *{ font-size: 26px;}
</style> 
</head>
<body>
<DIV class='container'>
<DIV class='content'>
  <H1>tot_proc.jsp</H1>
 
  <DIV class='panel'>
    ${msg } <br>
    수1: ${param.no1 } <br>
    수2: ${param.no2 } <br>
    합계: ${param.no1+param.no2 }  <br>
  </DIV>

</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html>