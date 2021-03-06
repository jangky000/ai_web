<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <% request.setCharacterEncoding("utf-8"); %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<DIV class='container'>
<DIV class='content'>

  <c:if test="true">
    무조건 실행<br>
  </c:if>
  
  <c:set var="score" value="85"/>
  <c:if test="${score >= 60 }">
    ${score }점 합격<br>
  </c:if>
 
  <c:if test="${param.code=='A01' }">
    ${param.code }는 서울을 나타냅니다.
  </c:if>
  
  <c:if test="${param.code!='A01' }">
    ${param.code }는 서울이 아닙니다.<br>
  </c:if>
  
  <!-- EL 안에 자바 스트링 메소드 사용 가능 -->
  <c:if test="${param.code.toUpperCase()=='A01' }">
    ${param.code.toUpperCase() }는 서울을 나타냅니다.(대문자 변환)<br>
  </c:if>
  
  <!-- 한글 비교 가능, 
  internet explorer11에서는 직접 한글 입력시 에러 발생
  (직접 %EC... 등으로 변환 코드로 인코딩 해준다면 사용 가능하다, <form>에서는 자동으로 변경됨)
   -->
  <c:if test="${param.kor=='자바' }">
    개발 분야: ${param.kor }<br>
  </c:if>
  
  <c:if test="${param.year>=5 }">
    중급개발자<br>
  </c:if>

  AI 개발 Device: ${param.cpu } CUDA ${param.calc }<br>
  <c:if test="${param.cpu == 'intel' and param.calc >= 6.0 }">
    GPU 기반 개발 가능<br>
  </c:if>
  <br>

</DIV> <!-- content END -->
</DIV> <!-- container END -->
 
</body>
</html>