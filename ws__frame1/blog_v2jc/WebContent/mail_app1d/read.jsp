<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@include file="./ssi.jsp" %>

 <%!
 //특수 문자의 태그로 변환
public String convertChar(String str){
   return str.replace("\r\n", "<br>");
 }
 %>
 

<%
int mailno = Integer.parseInt(request.getParameter("mailno"));
String my_ip = request.getRemoteAddr();

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
  <div class="title_line"><%=application_title %>＞조회</div>
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
  <div style="text-align: right;">
    조회수:
    <%=mailVO.getCnt()+1%>
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
  
  <table style="border-collapse: collapse; width: 100%; border: solid 1px #999999; margin-top: 100px;">
    <tr>
      <th style="width: 100px; border: solid 1px #999999;">url1:</th>
      <td style="padding-left: 10px; border: solid 1px #999999;">
        <%
          if(mailVO.getUrl1() != null){
            %>
            <a href="<%=mailVO.getUrl1()%>"><%=mailVO.getUrl1()%></a>
            <%
          }
        %>
      </td>
    </tr>
    <tr>
      <th style="width: 100px; border: solid 1px #999999;">url2:</th>
      <td style="padding-left: 10px; border: solid 1px #999999;">
        <%
          if(mailVO.getUrl2() != null){
            %>
            <a href="<%=mailVO.getUrl2()%>"><%=mailVO.getUrl2()%></a>
            <%
          }
        %>
      </td>
    </tr>
    <tr>
      <th style="width: 100px; border: solid 1px #999999;">youtube:</th>
      <td style="padding-left: 10px; border: solid 1px #999999;">
        <%
          if(mailVO.getYoutube() != null){
            %>
            <a href="<%=mailVO.getYoutube()%>"><%=mailVO.getYoutube()%></a>
            <%
          }
        %>
      </td>
    </tr>
  </table>

<%
mailDAO.cnt_update(mailVO.getMailno());
%>


  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
</html>