<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html>
<html> 
<head> 
<meta charset="UTF-8"> 
<title>study1.jsp</title> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<body>
<br>
 
<!-- 서블릿의 경로를 사용할때는 프로젝트명 명시, 절대 경로 지정 -->
<!-- <url-pattern>/form/study1</url-pattern> -->
<!-- <form name="frm" method="GET" action="/mvc/form/study1"> -->
<!-- <form name="frm" method="POST" action="/mvc/form/study1"> --> 
<form name="frm" method="GET" action="/mvc/form/study1.kor"> <!-- web.xml에서 지정한 Study1.java의 실행 주소 -->
  현재 과목명: <input type="text" name="step" value="데이터분석" style="width:30%;"><br><br>
  다음 과목명: <input type="text" name="next" value="머신러닝" style="width:30%;">
    
  <input type="submit" value="서블릿으로 전송" />
</form>
 
</body>
</html> 