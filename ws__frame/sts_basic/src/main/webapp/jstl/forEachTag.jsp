<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="sts.basic.test.ELDTO" %>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>/webapp/jstl/forEachTag.jsp</title> 
<style type="text/css">
  * { font-size: 32px; }
</style>
</head>
<body>
<DIV class='container'>
<DIV class='content'>

  <!-- index 증가 -->
 <c:forEach var="index" begin="1" end="5" step="1">
  ${index }
 </c:forEach>
 
  <br><br>
  <%
  request.setAttribute("datas", new String[]{"JAVA", "JSP", "SPRING"});
  %>
 
 <!-- 배열 순회, 일련번호: varStatus.count, 1부터 시작 -->
 <c:forEach var="item" items="${datas }" varStatus="info">
  ${info.count}. ${item }<br> <!-- 1. JAVA  -->
 </c:forEach>
 
  <br>
  
 <!-- 배열 순회, 인덱스 번호: varStatus.index, 0부터 시작 -->
 <c:forEach var="item" items="${datas }" varStatus="info">
  ${info.index}. ${item }<br> <!-- 0. JAVA  -->
 </c:forEach>
 
  <br>
  
  <%
  ArrayList<ELDTO> list = new ArrayList<ELDTO>();
  ELDTO eldto = new ELDTO("암살", "전지현");
  list.add(eldto);
  eldto = new ELDTO("골목식당", "백종원");
  list.add(eldto);
  eldto = new ELDTO("숨바꼭질", "이유리");
  list.add(eldto);
  
  request.setAttribute("list", list);
  %>
  <!-- script -->
  <%
  int size = list.size();
  for (int index = 0; index < size; index++) {
    ELDTO vo = list.get(index);
    out.print((index+1) + ". " + vo.getMovie() + "(" + vo.getName() + ")<br>");
  }
  %>  
  <br>
  <!-- jstl -->
  <c:forEach var="vo" items="${list }" varStatus="info">
    ${info.count }. ${vo.movie }(${vo.name })<br> <!-- 1. 암살(전지현) -->
  </c:forEach>
  
  <br>
  <!-- 동적 id의 생성 -->
  <form name='frm'>
 
  </form>
  <br>
  <!-- 목록 출력시 마지막 요소의 ',' 생략 처리 -->
  <c:forEach var="vo" items="${list}" varStatus="info">
    { id: 1001,
      data: [
        "<c:out value="${vo.movie}" />",
        "<c:out value="${vo.name}" />" <%-- comma 생략 --%>
      ]
    }<c:if test="${!info.last}">,</c:if>
  </c:forEach>
  <br><br><br><br><br>
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html>