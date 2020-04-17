<%-- 페이지 디렉티브 --%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%-- JSP 액션 태그 --%>
<jsp:useBean id="sungjukVO" class="beans.SungjukVO" />  <!-- beans package 반드시 선언 -->

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
    sungjukVO.setName("성적1");
    sungjukVO.setTot(70);
    sungjukVO.setAvg(80);
    %>
    성명: <%=sungjukVO.getName()%><br>
    총점: <%=sungjukVO.getTot()%><br>
    평균: <%=sungjukVO.getAvg()%><br>
 
  </DIV>           
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>