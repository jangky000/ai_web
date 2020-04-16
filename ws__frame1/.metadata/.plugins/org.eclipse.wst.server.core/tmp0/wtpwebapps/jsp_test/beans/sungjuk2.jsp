<%-- 페이지 디렉티브 --%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%-- 스크립틀릿 사용, 보통 클래스를 3단 구조로 사용하기 때문에 매번 여러 패키지를 입력해주는 것이 불편하다. -> import를 사용 --%>
<%@ page import="beans.SungjukVO" %>
<% SungjukVO sungjukVO = new SungjukVO(); %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV style='padding: 20px;
                    border: solid 1px #0000FF; 
                    font-size: 26px; 
                    width: 50%; 
                    background-color: #EEEEFF; 
                    margin: 50px auto;'>          
    <% 
    sungjukVO.setName("성적2");
    sungjukVO.setTot(100);
    sungjukVO.setAvg(90);
    %>
    성명: <%=sungjukVO.getName()%><br>
    총점: <%=sungjukVO.getTot()%><br>
    평균: <%=sungjukVO.getAvg()%><br>
 
  </DIV>           
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>