<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>calc.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
<DIV class='container'>
<DIV class='content'>
  <H1>EL calc_vo.jsp</H1>
  ${msg } 계산기<br>
  수1: ${param.no1 }<br>
  수2: ${param.no2 }<br>
  결과: ${result }<br><br>
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html>