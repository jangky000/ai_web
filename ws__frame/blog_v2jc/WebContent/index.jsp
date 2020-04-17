<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link href="./css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<!-- include file 실행시 자바 소스가 들어와서 충돌할 수 있음 -> 그래서 사용하지 않는 것을 권장 -->
<!-- 아래 주소는 절대주소, jsp:include는 프로젝트 명(Context Path)을 표시하면 안된다(/WebContents 기준, ) -->
<jsp:include page="/menu/top.jsp" flush="false" />
  
<h1 style="margin: 0 auto; width:40%; text-align: center;">프로젝트 메인 페이지</h1>
<div style="margin: 0 auto; width:40%;text-align: center;">
  <img src="./images/flower.jpg" style="width:100%">
</div>

<!-- 아래 주소는 절대주소, jsp:include는 프로젝트 명(Context Path)을 표시하면 안된다(/WebContents 기준, ) -->
<jsp:include page="/menu/bottom.jsp" flush="false" />  
</body>
</html>