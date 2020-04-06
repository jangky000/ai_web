<%@ page contentType="text/html; charset=UTF-8" %>
 
 <%@include file="./ssi.jsp" %>
 
 <%!
 //특수 문자의 태그로 변환
public String convertChar(String str){
   return str.replace("\r\n", "<br>");
 }
 %>
 
<%
 int nowPage = 0;
 int recordPerPage = 0;
 
 if(request.getParameter("nowPage") == null){
   nowPage = 1;
 } else{
   nowPage = Integer.parseInt(request.getParameter("nowPage"));
 }
 
 if(request.getParameter("recordPerPage") == null){
   recordPerPage = 3;
 } else{
   recordPerPage = Integer.parseInt(request.getParameter("recordPerPage"));
 }
 
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
  <div class="title_line"><%=application_title %>＞조회</div>
  <div class="sub_menu">
  <button type="button" onclick="location.href='./list.jsp?nowPage=<%=nowPage %>&recordPerPage=<%= recordPerPage%>'">목록</button>
    <button type="button" onclick="location.href='./update_form.jsp?noticeno=<%= noticeno%>'">수정</button>
    <button type="button" onclick="location.href='./delete_form.jsp?noticeno=<%= noticeno%>'">삭제</button>
  </div>

    <%
    NoticeVO noticeVO = new NoticeProc().read(noticeno);
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