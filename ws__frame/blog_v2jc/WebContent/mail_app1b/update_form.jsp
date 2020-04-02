<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ page import = "nation.web.mail_app1b.MailVO" %>
<%@ page import = "nation.web.mail_app1b.MailDAO" %>

 <%!
 //특수 문자의 태그로 변환
public String convertChar(String str){
   return str.replace("\r\n", "<br>");
 }
 
 //특수 문자의 태그로 변환
public String convertTag(String str){
   return str.replace("<br>", "\r\n");
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
  <div class="title_line">메일 앱 ver 1.0b＞수정</div>
  
  <form name='frm' action='./update_proc.jsp' method='POST'>
    <input type='hidden' name='mailno' value='<%= mailno %>'>
    <fieldset class="fieldset_basic">
      <!-- <legend class="legend_basic">공지사항 등록</legend> -->
      <ul>
        <li class="li_none">
          <label>제목: </label>
          <input class="input_basic" type="text" name="title" style="width: 80%;" autofocus="autofocus" 
                      value="<%=mailVO.getTitle() %>">
        </li>
        <li class="li_none">
          <label>보내는 사람 IP: </label>
          <input class="input_basic" type="text" name="mail_from"  value="<%= my_ip %>" style="width: 200px;" readonly="readonly">
        </li>
        <li class="li_none">
          <label>받는 사람 IP: </label>
          <input class="input_basic" type="text" name="mail_to" style="width: 200px;" value="<%= mailVO.getMail_to()%>">
        </li>
        <li class="li_none">
          <label style="vertical-align: top;">내용: </label>
          <textarea name="content" style="width: 80%; height: 150px;"><%=mailVO.getContent() %></textarea>
        </li>
      </ul>
      <div class ="bottom_menu">
        <button type="submit">수정 완료</button>
        <button type="button" onclick="location.href = './list.jsp'">취소</button>
        <button type="button" onclick="location.href = './list.jsp'">목록</button>
      </div>
    </fieldset>
    
  </form>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>