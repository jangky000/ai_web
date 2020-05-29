<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
  request.setAttribute("complicated_data", "simple");
  request.setAttribute("list", new String[]{"테일러", "마틴", "펜더", "깁슨"});
  %>
 
 <div style="margin: 20px auto; width: 30%; padding:20px; outline: solid 1px gray;">
   <c:set var="simple" value="${complicated_data }"/>
   c set data: ${simple }<br><br>
   
   
   <c:forEach var="brand" items="${list }">
     브랜드명: ${brand }<br>
   </c:forEach>
 </div>
 
 


</body>
</html>