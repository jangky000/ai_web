<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ page import = "nation.web.mail_app1b.MailVO" %>
<%@ page import = "nation.web.mail_app1b.MailDAO" %>

<% 
request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
int mailno = Integer.parseInt(request.getParameter("mailno"));
%>

<%
MailVO mailVO = new MailVO();
MailDAO mailDAO = new MailDAO();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>메일 앱</title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <div class="title_line">메일 앱 ver 1.0b＞삭제</div>
  <fieldset class="fieldset_basic">
    <!-- <legend class="legend_basic">공지사항 등록</legend> -->
      <ul>
        <%
        int count = 0;

        count = mailDAO.delete(mailno);
      
        if(count == 1){
          %>
          <li class="li_none">삭제 처리에 성공했습니다.</li>
          <%
        } else{
          %>
          <li class="li_error" >삭제 처리에 실패했습니다.</li>
          <li class="li_none">다시 시도해주세요. </li>
          <%
        }
          %>
          </ul>
          <div class ="bottom_menu">
          <!-- onclick = "" javascript 연결 -->
          <%
          if(count == 0){
            %>
            <button type="button" onclick="history.back();">다시 시도</button>
            <%
          }
          %>
        <%-- <button type="button" onclick="location.href = './read.jsp?mailno=<%=mailno %>'">수정 확인</button> --%>
        <button type="button" onclick="location.href = './list.jsp'">목록</button>
      </div>
  </fieldset>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>