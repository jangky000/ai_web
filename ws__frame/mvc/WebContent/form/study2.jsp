<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html>
<html> 
<head> 
<meta charset="UTF-8"> 
<title>method.jsp</title> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<body>
<br>
 
<!-- 서블릿의 경로를 사용할때는 프로젝트명 명시 -->
<!-- @WebServlet(asyncSupported = true, urlPatterns = { "/form/study2.annotation" }) -->
<form name="frm" method="GET" action="/mvc/form/study2.annotation">
  현재 과목명: <input type="text" name="step" value="R" size='25' ><br><br>
  다음 과목명: <input type="text" name="next" value="Python" size='25' >
    
  <input type="submit" value="서블릿으로 전송" />
</form>
 
</body>
</html>