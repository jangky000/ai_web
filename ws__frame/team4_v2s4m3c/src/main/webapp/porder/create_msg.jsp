<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <c:choose>
    <c:when test="${param.cnt ==1 }">
      등록 완료
    </c:when>
    <c:otherwise>
      등록 실패
    </c:otherwise>
  </c:choose>
</body>
</html>