<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ page import = "java.util.ArrayList" %>
 
<%@ page import = "nation.web.mail_app1b.MailVO" %>
<%@ page import = "nation.web.mail_app1b.MailDAO" %>

<%
  request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
%>

<%
String my_ip = request.getRemoteAddr();
/* out.print("<p>Remote Host: " + request.getRemoteHost() + "</p>"); */
/* out.print("<p>X-Forwarded-For: " + request.getHeader("x-forwarded-for") + "</p>"); */

MailDAO mailDAO = new MailDAO(my_ip);
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
  <div class="title_line">메일 앱 ver 1.0b</div>
  

  
  <div class="sub_menu">
    <button type="button" onclick="location.href='./create_form.jsp'">메일 보내기</button>
  </div>
  <table class="table_basic">
    <caption style="text-align: left; margin: 0 0 20px 20px; text-decoration: underline;"><h2>받은 메일함</h2></caption>
    <colgroup>
      <col style="width: 5%;">
      <col style="width: 45%;">
      <col style="width: 12%;">
      <col style="width: 18%;">
      <col style="width: 5%;">
      <col style="width: 15%;">
    </colgroup>
    <thead>
      <tr>
        <th class="th_basic">NO</th>
        <th class="th_basic">제목</th>
        <th class="th_basic">보낸사람</th>
        <th class="th_basic">등록일</th>
        <th class="th_basic" >조회수</th>
        <th class="th_basic" >기타</th>
      </tr>
    </thead>
    <tbody>
      <%
        ArrayList<MailVO> list = mailDAO.list_receive();
        
        for(MailVO vo: list){
      %>
        <tr>
          <td class="td_basic"><%=vo.getMailno()%></td>
          <td class="td_left"><a href="./read.jsp?mailno=<%=vo.getMailno()%>"><%=vo.getTitle()%></a></td>
          <td class="td_basic"><%=vo.getMail_from()%></td>
          <td class="td_basic"><%=vo.getRdate()%></td>
          <td class="td_basic"><%= vo.getCnt()%></td>
          <td class="td_basic"><a href='./delete_form.jsp?mailno=<%=vo.getMailno()%>'>삭제</a></td>
        </tr>
        <%
          }
        %>
    </tbody>
  </table>
  
  <hr style="margin: 80px 0;">
  
  <table class="table_basic">
    <caption style="text-align: left; margin: 0 0 20px 20px; text-decoration: underline;"><h2>보낸 메일함</h2></caption>
    <colgroup>
      <col style="width: 5%;">
      <col style="width: 45%;">
      <col style="width: 12%;">
      <col style="width: 18%;">
      <col style="width: 5%;">
      <col style="width: 15%;">
    </colgroup>
    <thead>
      <tr>
        <th class="th_basic">NO</th>
        <th class="th_basic">제목</th>
        <th class="th_basic">받는 사람</th>
        <th class="th_basic">등록일</th>
        <th class="th_basic">조회수</th>
        <th class="th_basic">기타</th>
      </tr>
    </thead>
    <tbody>
    <%
      list = mailDAO.list_send();
      
      for(MailVO vo: list){
    %>
        <tr>
          <td class="td_basic"><%= vo.getMailno()%></td>
          <td class="td_left"><a href="./read.jsp?mailno=<%= vo.getMailno()%>"><%= vo.getTitle()%></a></td>
          <td class="td_basic"><%= vo.getMail_to()%></td>
          <td class="td_basic"><%= vo.getRdate()%></td>
          <td class="td_basic"><%= vo.getCnt()%></td>
          <td class="td_basic"><a href='./update_form.jsp?mailno=<%= vo.getMailno()%>'>수정</a>/<a href='./delete_form.jsp?mailno=<%= vo.getMailno()%>'>삭제</a></td>
        </tr>
        <%
      }
      %>
    </tbody>
  </table>

 <hr style="margin: 80px 0;">
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>