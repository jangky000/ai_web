<%@ page contentType="text/html; charset=UTF-8" %>
 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath(); 
%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class="title_line">공지사항 ver 1.0＞등록 </DIV>
  <form name='frm' action='./create_proc.jsp' method='POST'>
    <fieldset class="fieldset_basic">
      <ul>
        <li class="li_none">
          <label>제목: </label>
          <input type="text" name="title" style="width: 80%;" autofocus="autofocus" class="input_basic">
        </li>
        <li class="li_none">
          <label>내용: </label>
          <textarea name="content" style="width: 80%; height: 200px;"></textarea>
        </li>
        <li class="li_none">
          <label>성명: </label>
          <input type="text" name="rname" style="width: 80%;" class="input_basic">
        </li>
        <li class="li_none">
          <label>패스워드: </label>
          <input type="password" name="passwd" style="width: 30%;" class="input_basic">
        </li>
      </ul>

      <DIV class="bottom_menu">
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='./list.jsp'">취소</button>
        <button type="button" onclick="location.href='./list.jsp'">목록</button>
      </DIV>
    
    </fieldset>
    
  </form>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>






