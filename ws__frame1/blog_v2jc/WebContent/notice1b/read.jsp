<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ page import = "nation.web.notice1b.NoticeVO" %>
<%@ page import = "nation.web.notice1b.NoticeDAO" %>
 
 <%!
 //특수 문자의 태그로 변환
public String convertChar(String str){
   return str.replace("\r\n", "<br>");
 }
 %>
 
<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <% int noticeno = Integer.parseInt(request.getParameter("noticeno")); %>
  <div class="title_line">공지사항 ver 1.0b＞조회</div>
  <div class="sub_menu">
  <button type="button" onclick="location.href='./list.jsp'">목록</button>
    <button type="button" onclick="location.href='./update_form.jsp?noticeno=<%= noticeno%>'">수정</button>
    <button type="button" onclick="location.href='./delete_form.jsp?noticeno=<%= noticeno%>'">삭제</button>
  </div>

    <%
    NoticeVO noticeVO = new NoticeDAO().read(noticeno);
    %>
    <div class="content_title"><%=noticeVO.getTitle() %></div>
    <%= convertChar(noticeVO.getContent()) %>
    <div class="content_bottom">
      <%=noticeVO.getRname() %>
      <%=noticeVO.getRdate() %>
    </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>