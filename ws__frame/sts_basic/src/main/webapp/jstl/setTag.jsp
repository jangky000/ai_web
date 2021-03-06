<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>/webapp/jstl/setTag.jsp</title> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
 
<body>
<DIV class='container'>
<DIV class='content'>
  <!-- JSTL -->
  <c:set var='img' value= "<img src='./images/bu5.png'>"/>
   
   ${img } JAVA<BR>
   ${img } JSP<BR>
   ${img } SPRING<BR>
   ${img } R<BR>
   ${img } Python<BR>
   ${img } Crawling<BR>
   ${img } Analysis<BR>
   ${img } Machine Learning<BR>
   
   <BR>
   <!-- EL을 값으로 할당 -->
   <c:set var="root" value="${pageContext.request.contextPath}"/>
   절대 경로: ${root }
   
   <BR><BR>
   
   <!-- 스크립틀릿을 값으로 할당 -->
   <c:set var="tot" value="<%= 2020+1 %>"/>
   합계: ${tot }
   
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
 
</html> 