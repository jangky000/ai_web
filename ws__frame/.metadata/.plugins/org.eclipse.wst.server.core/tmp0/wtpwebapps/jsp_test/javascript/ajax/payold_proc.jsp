<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("UTF-8"); %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../../css/style.css" rel="Stylesheet" type="text/css">
 
</head> 
 
<body>
<DIV class='container'>
<DIV class='content'>
 
<DIV class="title_line" style='width: 80%;'>조회 결과</DIV>
 
<DIV style='width: 50%; margin: 0px auto; background-color: #EEEEEE;'>
  <%
  String id = request.getParameter("id");
  String passwd = request.getParameter("passwd");
 
  if (id.equals("user1") && passwd.equals("123")){
  %>
    성명: 홍길동<BR>
    아이디: <%=id %><BR>
    패스워드: <%=passwd %><BR>
    본봉: ￦ 2,200,000 원 <BR>
    수당: ￦   200,000 원 <BR>
    합계: ￦ 2,400,000 원 <BR>
  <%  
  }else{
  %>
    아이디와 패스워드가 일치하지 않습니다.<BR><BR>
  <%  
  }
  %>  
</DIV>
 
  
<DIV class='bottom_menu'>
  <input type='button' value='다시 검색' onclick="history.back();">
</DIV>
 
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
 
</html> 