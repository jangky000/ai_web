<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.io.File" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
<% 
String dir = "/"; // root
String abs_dir = application.getRealPath(dir); // root 실제 경로를 가져옴
out.println(abs_dir);
out.println("<br><br>");

dir = "/core/images";
abs_dir = application.getRealPath(dir);
out.println(abs_dir);
out.println("<br><br>");

dir = "/core/images/x"; // 존재하지 않는 폴더 -> 존재하는 것처럼 나온다.
abs_dir = application.getRealPath(dir);
out.println(abs_dir);
out.println("<br><br>");

File folder = new File(abs_dir);
if(folder.exists()){
  out.println("폴더가 존재함");
} else{
  out.println("폴더가 존재하지 않음");
}
%>
 
<br><br>
[<A href='./application2.jsp'>application2로가기</A>]
  
</body>
</html>