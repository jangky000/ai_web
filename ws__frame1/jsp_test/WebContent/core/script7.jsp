<%@ page contentType="text/html; charset=UTF-8" %>
 
<%!
public boolean isImage(String fname){
  fname = fname.toLowerCase();
  if(fname.endsWith(".jpg") || fname.endsWith(".gif") || fname.endsWith(".png")){
    //bmp는 용량이 커서 사용하지 않는다. 
    return true;
  } else{
    return false;
  }
}
%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  *{ font-family: 맑은 고딕; font-size: 26px;}
</style>
</head>
<body>
<%
if(isImage("coffee01.jpg")){
%>
  <img src = "./images/coffee01.jpg" style="width: 30%;">
<%
}
%>
<br>
<%
if(isImage("coffee02.jpgx")){
%>
  <img src = "./images/coffee02.jpg" style="width: 100%;">
<%
} else{
 %>
  이미지가 아닙니다.
 <%
}
%>
<br>
<%
if(isImage("coffee03.jpg")){
%>
  <img src = "./images/coffee03.jpg" style="width: 30%;">
<%
} else{
 %>
  이미지가 아닙니다.
 <%
}
%>
<br>

</body>
</html>
 