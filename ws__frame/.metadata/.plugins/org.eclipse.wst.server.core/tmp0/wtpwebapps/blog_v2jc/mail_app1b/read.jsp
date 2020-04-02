<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ page import = "nation.web.mail_app1b.MailVO" %>
<%@ page import = "nation.web.mail_app1b.MailDAO" %>

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

<%
int mailno = Integer.parseInt(request.getParameter("mailno"));
String my_ip = request.getRemoteAddr();

MailDAO mailDAO = new MailDAO();
MailVO mailVO = mailDAO.read(mailno);
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
  <div class="title_line">메일 앱 ver 1.0b＞조회</div>
  <div class="sub_menu">
    <button type="button" onclick="location.href='./list.jsp'">목록</button>
    <% 
    if(my_ip.equals(mailVO.getMail_to())){
      %>
      <button type="button" onclick="location.href='./reply_form.jsp?mailno=<%= mailno%>'">답장하기</button>
      <%
    }
    if(my_ip.equals(mailVO.getMail_from())){
      %>
      <button type="button" onclick="location.href='./update_form.jsp?mailno=<%= mailno%>'">수정</button>
      <%
    }
    %>
    
    <button type="button" onclick="location.href='./delete_form.jsp?mailno=<%=mailno %>'">삭제</button>
  </div>

    

  <div class="content_title">
    제목:
    <%=mailVO.getTitle()%>
  </div>
  <div style="text-align: left; font-size: 0.9em; margin-bottom: 20px;">
    mail from:
    <%=mailVO.getMail_from()%>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mail to:
    <%=mailVO.getMail_to()%>
  </div>
  <div style="text-align: left; margin-left: 20px;">
    <%=convertChar(mailVO.getContent())%>
  </div>



  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>